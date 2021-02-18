<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$currPath = realpath(dirname(__FILE__));

#Path to the 'live_eggs_list.txt' file
$live_egg_file = $currPath . "/../live_eggs_list.txt";

if (!empty($argv[1])) {
    $pgsqlDSN = $argv[1];
} else {
    $pgsqlDSN = 'host=postgres;port=5432;dbname=karaokemugen_app;user=karaokemugen_app;password=musubi';
}

try {
    $pdo = new PDO('pgsql:' . $pgsqlDSN);
    $pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); // ERRMODE_WARNING | ERRMODE_EXCEPTION | ERRMODE_SILENT
} catch (Exception $e) {
    echo "Unable to connect to database : " . $e->getMessage();
    die();
}

$query = '
SELECT
  ak.pk_kid AS kid,
  ak.title AS title,
  ak.songorder AS songorder,
  ak.subfile AS subfile,
  ak.singers AS singers,
  ak.songtypes AS songtypes,
  ak.languages AS languages,
  ak.authors AS authors,
  ak.misc AS misc,
  ak.platforms AS platforms,
  ak.families AS families,
  ak.genres AS genres,
  ak.series AS series,
  ak.origins AS origins,
  ak.creators AS creators,
  ak.mediafile AS mediafile,
  ak.gain AS gain,
  ak.songwriters AS songwriters,
  ak.versions AS versions
FROM all_karas AS ak
WHERE (mediafile LIKE \'%.mp4\' or mediafile LIKE \'%.mp3\')
GROUP BY ak.kid, ak.title, ak.songorder, ak.subfile, ak.singers, ak.songtypes, ak.languages, ak.authors, ak.misc,
         ak.platforms, ak.families, ak.genres, ak.series, ak.origins, ak.creators, ak.mediafile, ak.gain,
         ak.songwriters, ak.versions, ak.serie_singer_sortable, ak.songtypes_sortable
ORDER BY ak.serie_singer_sortable, ak.songtypes_sortable DESC, ak.songorder, lower(unaccent(ak.title))
';

$data = $pdo->query($query)->fetchAll();

function get_filename_without_ext($fname)
{
    return substr($fname, 0, strrpos($fname, "."));
}

//(easter) eggs support
$eggUIDList = "";
if (file_exists($live_egg_file)) {
    $eggLoad = file($live_egg_file, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
    foreach ($eggLoad as $egg) {
        if (strpos($egg, "#") === false && (preg_match("/^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/", trim($egg)) === 1))
            $eggUIDList .= trim($egg) . ",";
    }
}

//First pass
$first_pass = [];
$types = ['singers', 'songtypes', 'languages', 'authors', 'misc', 'platforms', 'genres', 'series', 'origins', 'creators', 'versions'];
foreach ($data as $kara) {

    $skip = false;
    foreach ($types as $tagtype) {
        $content = json_decode($kara[$tagtype], true);
        if (is_array($content))
        foreach($content as $tag) {
            if (!empty($tag['nolivedownload']) && $tag['nolivedownload']) {
                echo $kara['mediafile'] . ' ignored, ' . $tag['name'] . ' has noLiveDownload.';
                $skip = true;
                break;
            }
        }
        if ($skip) break;
    }
    if ($skip) continue;

    //Series or artist name

    if (!empty($kara['series'])) {
        $series = json_decode($kara['series'], true);
        $seriename = [];
        foreach ($series as $serie) $seriename[] = $serie['name'];
        sort($seriename); // avoid the Series A, Series B / Series B, Series A to create two groups
        $serie_singer = implode(', ', $seriename);
    } else {
        $singers = json_decode($kara['singers'], true);
        $serie_singer = $singers[0]['name'];
    }

    //init if series/singer not yet added
    if (!isset($first_pass[$serie_singer])) {
        $first_pass[$serie_singer] = [];
    }

    $first_pass[$serie_singer][] = $kara;
}

//Second pass
$second_pass = [];
foreach ($first_pass as $serie_singer => $kara_serie_singer) {
    //init if series not yet added
    if (!isset($second_pass[$serie_singer])) {
        $second_pass[$serie_singer] = [];
    }

    foreach ($kara_serie_singer as $kara) {
        $songtype_json = json_decode($kara['songtypes'], true);
        // Sort algorithm, as suggested in https://discord.com/channels/84245347336982528/324208228680466434/730387614460543016
        $songtype = '';
        $type = '';
        $low_prio = false;
        foreach ($songtype_json as $songtype_try) {
            // Opening/Ending/MV/Insert: 1st level, break
            if (in_array($songtype_try['tid'], ['f02ad9b3-0bd9-4aad-85b3-9976739ba0e4', '38c77c56-2b95-4040-b676-0994a8cb0597', '7be1b15c-cff8-4b37-a649-5c90f3d569a9', '5e5250d9-351a-4a82-98eb-55db50ad8962'])) {
                $songtype = $songtype_try['name'];
                $type = $songtype_try['i18n']['eng'];
                break;
            }
            // Audio/OT: 3rd level, set low_prio to true
            elseif (in_array($songtype_try['tid'], ['97769615-a2e5-4f36-8c23-b2ce2ce3c460', '42a262ae-acba-4ab5-a446-c5789c96c821'])) {
                $songtype = $songtype_try['name'];
                $type = $songtype_try['i18n']['eng'];
                $low_prio = true;
                continue;
            }
            // All the others: 2nd level, overwrite if low_prio or first write, ignore otherwise
            else {
                if ($low_prio || empty($songtype)) {
                    $songtype = $songtype_try['name'];
                    $type = $songtype_try['i18n']['eng'];
                    $low_prio = false;
                    continue;
                } else {
                    continue;
                }
            }
        }

        //init if type not yet added
        if (!isset($second_pass[$serie_singer][$type])) {
            $second_pass[$serie_singer][$type] = [];
        }
        $second_pass[$serie_singer][$type][] = $kara;
    }
}


//third pass
$last_pass = [];
//Search pass in the same time
$search_pass = [];
foreach ($second_pass as $serie_singer => $kara_serie_singer) {

    //init if series not yet added
    if (!isset($last_pass[$serie_singer])) {
        $last_pass[$serie_singer] = [];
        $search_pass[$serie_singer] = [];
    }

    foreach ($kara_serie_singer as $type => $list_kara) {
        foreach ($list_kara as $key => $kara) {
            //Determine song order
            $languages = json_decode($kara['languages'], true);

			$additional_types = [];
			$families_tags = json_decode($kara['families'], true);
            if (!empty($families_tags)) {
                foreach ($families_tags as $tag) {
                    switch ($tag['name']) {
                        case 'Video Game':
                            $additional_types[] = 'Game';
                            break;
                    }
                }
            }
            $misc_tags = json_decode($kara['misc'], true);
            if (!empty($misc_tags)) {
                foreach ($misc_tags as $tag) {
                    switch ($tag['name']) {
                        case 'Cover':
                        case 'Remix':
                            $additional_types[] = $tag['name'];
                            break;
                    }
                }
            }
            $versions_tags = json_decode($kara['versions'], true);
            if (!empty($versions_tags)) {
                foreach ($versions_tags as $tag) {
                    $additional_types[] = $tag['name'];
                }
            }

            $type_with_num = (!empty($additional_types) ? implode(' ', $additional_types) . ' ' : '') . $type . (!empty($kara['songorder']) ? ' ' . $kara['songorder'] : '') . ' - ' . $languages[0]['name'] . ' - ' . $kara['title'];

            $audioOnly = (0 === strpos(strrev($kara['mediafile']), strrev('.mp3'))); // ends with mp3 ? we'll consider it as audio only.
            $mimeType = $audioOnly ? 'audio/mp3' : 'video/mp4';
            if (empty($kara['subfile'])) {
                $kara_data = [
                    'file' => get_filename_without_ext($kara['mediafile']),
                    'mime' => [$mimeType,],
                    'song' => [
                        'title' => $kara['title'],
                    ],
                    'uid' => $kara['kid'],
                    'gain' => floatval($kara['gain'])
                ];
            } else {
                $kara_data = [
                    'file' => get_filename_without_ext($kara['mediafile']),
                    'mime' => [$mimeType,],
                    'song' => [
                        'title' => $kara['title'],
                    ],
                    'subtitles' => '(unknown)',
                    'uid' => $kara['kid'],
                    'gain' => floatval($kara['gain'])
                ];

                $authors = json_decode($kara['authors'], true);
                if (!empty($authors) && $authors[0]['name'] != 'NO_TAG') {
                    $karaAuthor = "";
                    foreach ($authors as $author) {
                        $karaAuthor .= ', ' . $author['name'];
                    }
                    $kara_data['subtitles'] = substr($karaAuthor, 2);
                } else
                    $kara_data['subtitles'] = '(unknown)';
            }
            $singers = json_decode($kara['singers'], true);
            if (!empty($singers[0]['name']) && $singers[0]['name'] != 'NO_TAG') {
                $artist = "";
                foreach ($singers as $singer) {
                    $artist .= ', ' . $singer['name'];
                }
                $kara_data['song']['artist'] = substr($artist, 2);
            } else
                $kara_data['song']['artist'] = '(unknown)';
            $songwriters = json_decode($kara['songwriters'], true);
            if (!empty($songwriters[0]['name']) && $songwriters[0]['name'] != 'NO_TAG') {
                $songwriters_arr = array();
                foreach ($songwriters as $songwriter) {
                    $songwriters_arr[] = $songwriter['name'];
                }
                $kara_data['song']['songwriters'] = $songwriters_arr;
            } else
                $kara_data['song']['songwriters'] = ['(unknown)'];

            if (strpos($kara['misc'], 'R18'))
                $kara_data['r18'] = 'true';

            if (strpos($eggUIDList, $kara['kid']) !== false)
                $kara_data['egg'] = 'true';

            // Populate the search data with the tags and the differents names of the series
            if (strpos($eggUIDList, $kara['kid']) === false) { // But not with easter eggs
                $search_data = [
                    $kara['title'],
                    $serie_singer
                ];
                foreach ($types as $tagtype) {
                    $content = json_decode($kara[$tagtype], true);
                    if (is_array($content))
                    foreach($content as $tag) {
                        $search_data[] = $tag['name'];
                    }
                }
                $search_pass[$serie_singer][$type_with_num] = $search_data;
            }

            $last_pass[$serie_singer][$type_with_num] = $kara_data;

        }
    }
}

$out = var_export($last_pass, true);
$out = '<' . '?php $names = ' . $out . ' ?' . '>';

$names_file = fopen('names.php', 'w');
fwrite($names_file, $out);
fclose($names_file);

/**
 * This part aims to generate a pre-processed search cache file
 * This means by transliterating all the strings
 */
$transliterator = Transliterator::createFromRules(':: NFD; :: [:Nonspacing Mark:] Remove; :: Lower(); :: NFC;', Transliterator::FORWARD);

foreach ($search_pass as $serie => $karas) {
    foreach ($karas as $name => $data) {
        $search_pass[$serie][$name] = $transliterator->transliterate(implode(' ', $data));
    }
}

$out = var_export($search_pass, true);
$out = '<' . '?php $searchbase = ' . $out . ' ?' . '>';

$searchbase_file = fopen('searchbase.php', 'w');
fwrite($searchbase_file, $out);
fclose($searchbase_file);
