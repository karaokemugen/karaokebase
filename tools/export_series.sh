DB=$1

# Export series

sqlite3 $DB "CREATE VIEW all_series AS SELECT s.name AS seriename, s.NORM_name AS NORM_name, s.altname AS altname, (select json_group_array(json_object('lang',sl.lang, 'seriename', sl.name)) from serie_lang sl where s.pk_id_serie = sl.fk_id_serie) as serie_i18n,(select json_group_array(json_object('kid',ak.kid, 'title', ak.title, 'songtype', ak.songtype, 'songorder', ak.songorder, 'language', [language])) from all_karas ak, kara_serie ks where ak.kara_id = ks.fk_id_kara AND s.pk_id_serie = ks.fk_id_serie ORDER BY ak.language, ak.serie IS NULL, ak.serie, ak.singer, ak.songtype DESC, ak.songorder, ak.title) AS karas, (select COUNT(k.pk_id_kara) FROM kara k, kara_serie ks WHERE ks.fk_id_kara = k.pk_id_kara AND ks.fk_id_serie = s.pk_id_serie) AS karacount FROM serie s;" >/dev/null

sqlite3 $DB "SELECT '{\"series\":[' || group_concat(json_object('name',name,'NORM_name',NORM_name,'aliases',altname,'i18n',serie_i18n, 'karas', karas)) || ']}' FROM all_series ORDER BY name;"