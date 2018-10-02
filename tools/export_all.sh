bash ./export_karas.sh ../db/karas.sqlite3 >karas.json
bash ./export_series.sh ../db/karas.sqlite3 >series.json
bash ./stats.sh ../db/karas.sqlite3 >stats.json
bash ./export_tags.sh ../db/karas.sqlite3 2 >singers.json
bash ./export_tags.sh ../db/karas.sqlite3 3 >songtypes.json
bash ./export_tags.sh ../db/karas.sqlite3 4 >creators.json
bash ./export_tags.sh ../db/karas.sqlite3 5 >languages.json
bash ./export_tags.sh ../db/karas.sqlite3 6 >authors.json
bash ./export_tags.sh ../db/karas.sqlite3 7 >misc.json
bash ./export_tags.sh ../db/karas.sqlite3 8 >songwriters.json
bash ./export_years.sh ../db/karas.sqlite3 >years.json
