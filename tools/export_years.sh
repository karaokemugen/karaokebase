DB=$1


# Export years

sqlite3 $DB "CREATE VIEW all_years AS SELECT DISTINCT year from kara;" >/dev/null
sqlite3 $DB "CREATE VIEW all_years_karas AS SELECT all_years.year, (select json_group_array(json_object('kid',ak.kid, 'title', ak.title, 'serie', serie, 'singer', singer, 'songtype', ak.songtype, 'songorder', ak.songorder, 'language', [language])) from all_karas ak where ak.year = all_years.year ORDER BY ak.language, ak.serie IS NULL, ak.serie, ak.singer, ak.songtype DESC, ak.songorder, ak.title) AS karas, (select COUNT(k.pk_id_kara) FROM kara k WHERE k.year = all_years.year) AS karacount FROM all_years ORDER BY all_years.year;" >/dev/null

sqlite3 $DB "SELECT '{\"years\":[' || group_concat(json_object('year',year,'karas', karas, 'karacount', karacount)) || ']}' FROM all_years_karas ORDER BY year;"
