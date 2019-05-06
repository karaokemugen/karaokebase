<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$currPath = realpath(dirname(__FILE__));

#Path to the 'live_eggs_list.txt' file
$live_egg_file = $currPath . "/../live_eggs_list.txt";

if(!empty($argv[1])) {
	$pgsqlDSN=$argv[1];
} else {
	$pgsqlDSN='host=postgres;port=5432;dbname=karaokemugen_app;user=karaokemugen_app;password=musubi';
}

try{
    $pdo = new PDO('pgsql:'.$pgsqlDSN);
    $pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); // ERRMODE_WARNING | ERRMODE_EXCEPTION | ERRMODE_SILENT
} catch(Exception $e) {
    echo "Unable to connect to database : ".$e->getMessage();
    die();
}

$query= '
SELECT
  ak.kid AS kid,
  ak.title AS title,
  ak.songorder AS songorder,
  ak.serie AS serie,
  ak.subfile AS subfile,
  ak.singers AS singers,
  ak.songtypes AS songtype,
  ak.languages AS languages,
  ak.authors AS authors,
  ak.misc_tags AS misc_tags,
  ak.mediafile AS mediafile
FROM all_karas AS ak
WHERE mediafile LIKE \'%.mp4\'
GROUP BY ak.kid, ak.title, ak.songorder, ak.serie, ak.subfile, ak.singers, ak.songtypes, ak.languages, ak.authors, ak.misc_tags, ak.mediafile,  ak.languages_sortable, ak.songtypes_sortable, ak.singers_sortable
ORDER BY serie, ak.songtypes_sortable DESC, ak.songorder, lower(unaccent(singers_sortable)), lower(unaccent(ak.title))
';

$data=$pdo->query($query)->fetchAll();

$types= [
    'TYPE_OP' => 'Opening',
    'TYPE_MV' =>  'Music Video',
    'TYPE_ED' => 'Ending',
    'TYPE_OT' => 'Other',
    'TYPE_AMV' => 'AMV',
    'TYPE_CM' => 'Advertisement',
    'TYPE_IN' => 'Insert',
    'TYPE_LIVE' => 'Live',
    'TYPE_PV' => 'Promo',
];

function get_extension($fname){
	return substr($fname, strrpos($fname, ".") + 1);
}
function get_filename_without_ext($fname){
	return substr($fname, 0, strrpos($fname, "."));
}

//(easter) eggs support
$eggUIDList = "";
if(file_exists($live_egg_file)) {
	$eggLoad = file($live_egg_file, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
	foreach($eggLoad as $egg) {
		if(strpos($egg,"#") === false && (preg_match("/^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/", trim($egg)) === 1))
			$eggUIDList .= trim( $egg) . ",";
	}
}

//First pass
$first_pass=[];
foreach ($data as $kara) {

	//Series or artist name

	if (!empty($kara['serie'])) {
		$serie_singer = $kara['serie'];
	} else {
		$singers = json_decode($kara['singers'], true);
		$serie_singer = $singers[0]['name'];
	}

	//init if series/singer not yet added
	if(!isset($first_pass[$serie_singer])) {
		$first_pass[$serie_singer]=[];
	}

	$first_pass[$serie_singer][]=$kara;
}

//Second pass
$second_pass=[];
foreach ($first_pass as $serie_singer => $kara_serie_singer) {
	//init if series not yet added
	if(!isset($second_pass[$serie_singer])) {
		$second_pass[$serie_singer]=[];
	}

	foreach ($kara_serie_singer as $kara) {
		$songtype_json = json_decode($kara['songtype'], true);
		$songtype = $songtype_json[0]['name'];
		$type = $types[$songtype];

		//init if type not yet added
		if(!isset($second_pass[$serie_singer][$type])) {
			$second_pass[$serie_singer][$type]=[];
		}
		$second_pass[$serie_singer][$type][]=$kara;
	}
}


//third pass
$last_pass=[];
foreach ($second_pass as $serie_singer => $kara_serie_singer) {

	//init if series not yet added
	if(!isset($last_pass[$serie_singer])) {
		$last_pass[$serie_singer] = [];
	}

	foreach ($kara_serie_singer as $type => $list_kara) {
		foreach($list_kara as $key => $kara) {
			//Determine song order
			$languages = json_decode($kara['languages'], true);

			$type_with_num = $type . (!empty($kara['songorder']) ? $kara['songorder'] : '') . ' - '  . $languages[0]['name'] . ' - ' . $kara['title'];

			if($kara['subfile'] === 'dummy.ass') {
				$kara_data=[
					'file' => get_filename_without_ext($kara['mediafile']),
					'mime' => ['video/mp4'],
					'song' => [
						'title' => $kara['title'],
					],
					'uid' => $kara['kid'],
				];
			}
			else {
				$kara_data=[
					'file' => get_filename_without_ext($kara['mediafile']),
					'mime' => ['video/mp4'],
					'song' => [
						'title' => $kara['title'],
					],
					'subtitles' => '(unknown)',
					'uid' => $kara['kid'],
				];

				$authors = json_decode($kara['authors'], true);
				if(!empty($authors) && $authors[0]['name'] != 'NO_TAG') {
					$karaAuthor = "";
					foreach($authors as $author) {
						$karaAuthor .= ', ' .$author['name'];
					}
					$kara_data['subtitles'] = substr($karaAuthor, 2);
				}
				else
					$kara_data['subtitles'] = '(unknown)';
			}
			$singers = json_decode($kara['singers'], true);
			if(!empty($singers[0]['name']) && $singers[0]['name'] != 'NO_TAG') {
				$artist = "";
				foreach($singers as $singer) {
					$artist .= ', ' .$singer['name'];
				}
				$kara_data['song']['artist'] = substr($artist, 2);
			}
			else
				$kara_data['song']['artist'] = '(unknown)';

			if(strpos($kara['misc_tags'], 'TAG_R18'))
				$kara_data['r18'] = 'true';

			if(strpos($eggUIDList, $kara['kid']) !== false)
				$kara_data['egg'] = 'true';

			$last_pass[$serie_singer][$type_with_num]=$kara_data;
		}
	}
}

$out=var_export($last_pass,true);


//Replacing spaces by tabs
$out=str_replace('  ','	',$out);

echo '<'.'?php $names = '.$out.' ?'.'>';
