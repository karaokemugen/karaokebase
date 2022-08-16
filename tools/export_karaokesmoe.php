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

$query = "
SELECT
  ak.pk_kid AS kid,
  ak.titles->>ak.titles_default_language AS title,
  ak.songorder AS songorder,
  ak.subfile AS subfile,
  jsonb_path_query_array( tags, '$[*] ? (@.type_in_kara == 2)') AS singers,
  jsonb_path_query_array( tags, '$[*] ? (@.type_in_kara == 3)') AS songtypes,
  jsonb_path_query_array( tags, '$[*] ? (@.type_in_kara == 5)') AS languages,
  jsonb_path_query_array( tags, '$[*] ? (@.type_in_kara == 6)') AS authors,
  jsonb_path_query_array( tags, '$[*] ? (@.type_in_kara == 7)') AS misc,
  jsonb_path_query_array( tags, '$[*] ? (@.type_in_kara == 13)') AS platforms,
  jsonb_path_query_array( tags, '$[*] ? (@.type_in_kara == 10)') AS families,
  jsonb_path_query_array( tags, '$[*] ? (@.type_in_kara == 12)') AS genres,
  jsonb_path_query_array( tags, '$[*] ? (@.type_in_kara == 1)') AS series,
  jsonb_path_query_array( tags, '$[*] ? (@.type_in_kara == 11)') AS origins,
  jsonb_path_query_array( tags, '$[*] ? (@.type_in_kara == 4)') AS creators,
  ak.mediafile AS mediafile,
  ak.gain AS gain,
  jsonb_path_query_array( tags, '$[*] ? (@.type_in_kara == 8)') AS songwriters,
  jsonb_path_query_array( tags, '$[*] ? (@.type_in_kara == 14)') AS versions,
  jsonb_path_query_array( tags, '$[*] ? (@.type_in_kara == 15)') AS warnings,
  jsonb_path_query_array( tags, '$[*] ? (@.type_in_kara == 16)') AS collections
FROM all_karas AS ak
GROUP BY ak.pk_kid, ak.tags, ak.titles, ak.titles_default_language, ak.songorder, ak.subfile, ak.mediafile, ak.gain, ak.titles_sortable, ak.serie_singergroup_singer_sortable, ak.songtypes_sortable
ORDER BY ak.serie_singergroup_singer_sortable, ak.songtypes_sortable DESC, ak.songorder, ak.titles_sortable
";

$data = $pdo->query($query)->fetchAll();

var_dump($data);

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

function map_name($tag) {
    return $tag['name'];
}

//First pass
$first_pass = [];
$types = ['singers', 'songtypes', 'languages', 'authors', 'misc', 'platforms', 'genres', 'series', 'origins', 'creators', 'versions', 'warnings', 'collections'];
foreach ($data as $kara) {

    $skip = false;
    foreach ($types as $tagtype) {
        $content = json_decode($kara[$tagtype], true);
        if (is_array($content))
        foreach($content as $tag) {
            if (!empty($tag['noLiveDownload']) && $tag['noLiveDownload']) {
                echo $kara['mediafile'] . ' ignored, ' . $tag['name'] . ' has noLiveDownload.\n';
                $skip = true;
                break;
            }
        }
        if ($skip) break;
    }
    if ($skip) continue;

    //Series or artist name

	if ($kara['series'] != "[]") {
        $series = json_decode($kara['series'], true);
        $seriename = [];
        foreach ($series as $serie) $seriename[] = $serie['name'];
        sort($seriename); // avoid the Series A, Series B / Series B, Series A to create two groups
        $serie_singer = implode(', ', $seriename);
    } else {
        $singers = json_decode($kara['singers'], true);
        $serie_singer = implode(', ', array_map('map_name', $singers));
    }

    //init if series/singer not yet added
    if (!isset($first_pass[$serie_singer])) {
        $first_pass[$serie_singer] = [];
    }

    $first_pass[$serie_singer][] = $kara;
}

function getI18nEng($tag) {
    return $tag['i18n']['eng'];
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
        $type = implode(' ', array_map('getI18nEng', $songtype_json));

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
