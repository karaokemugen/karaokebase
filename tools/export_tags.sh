DB=$1


# Export series

sqlite3 $DB "CREATE VIEW all_tags AS SELECT t.name AS tagname, t.NORM_name AS NORM_name, t.tagtype AS tagtype, (select json_group_array(json_object('kid',ak.kid, 'karafile', ak.karafile, 'title', ak.title, 'serie', serie, 'singer', singer, 'songtype', ak.songtype, 'songorder', ak.songorder, 'language', [language])) from all_karas ak, kara_tag kt where ak.kara_id = kt.fk_id_kara AND t.pk_id_tag = kt.fk_id_tag ORDER BY ak.language, ak.serie IS NULL, ak.serie, ak.singer, ak.songtype DESC, ak.songorder, ak.title) AS karas, (select COUNT(k.pk_id_kara) FROM kara k, kara_tag kt WHERE kt.fk_id_kara = k.pk_id_kara AND kt.fk_id_tag = t.pk_id_tag) AS karacount FROM tag t" >/dev/null

sqlite3 $DB "SELECT '{\"tags\":[' || group_concat(json_object('tagname',tagname,'NORM_name',NORM_name,'tagtype',tagtype,'karas', karas, 'karacount', karacount)) || ']}' FROM all_tags ORDER BY tagtype, tagname;"
