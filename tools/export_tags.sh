DB=$1


# Export series

sqlite3 $DB "CREATE VIEW all_tags AS SELECT t.name AS name, t.NORM_name AS NORM_name, t.tagtype AS tagtype, (select json_group_array(json_object('kid',ak.kid, 'title', ak.title, 'songtype', ak.songtype, 'songorder', ak.songorder, 'language', [language])) from all_karas ak, kara_tag kt where ak.kara_id = kt.fk_id_kara AND t.pk_id_tag = kt.fk_id_tag ORDER BY ak.language, ak.serie IS NULL, ak.serie, ak.singer, ak.songtype DESC, ak.songorder, ak.title) AS karas FROM tag t";

sqlite3 $DB "SELECT '{\"tags\":[' || group_concat(json_object('name',name,'NORM_name',NORM_name,'tagtype',tagtype,'karas', karas)) || ']}' FROM all_tags ORDER BY tagtype, name;"