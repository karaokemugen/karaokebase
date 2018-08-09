DB=$1

# Export series

sqlite3 $DB "CREATE VIEW all_series AS SELECT s.name AS name, s.NORM_name AS NORM_name, s.altname AS altname, (select json_group_array(json_object('lang',sl.lang, 'name', sl.name)) from serie_lang sl where s.pk_id_serie = sl.fk_id_serie) as serie_i18n,(select json_group_array(json_object('kid',ak.kid, 'title', ak.title, 'songtype', ak.songtype, 'songorder', ak.songorder, 'language', [language])) from all_karas ak, kara_tag kt where ak.kara_id = kt.fk_id_kara AND t.pk_id_tag = kt.fk_id_tag ORDER BY ak.language, ak.serie IS NULL, ak.serie, ak.singer, ak.songtype DESC, ak.songorder, ak.title) AS karas FROM serie s;"

sqlite3 $DB "SELECT '{\"series\":[' || group_concat(json_object('name',name,'NORM_name',NORM_name,'aliases',altname,'i18n',serie_i18n, 'karas', karas)) || ']}' FROM all_series ORDER BY name;"