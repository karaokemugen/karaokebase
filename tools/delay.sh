kara=$1
awk -F, '{if ($1 ~ /^Dialogue:/) {cmd="date -d \"1 second ago "$2"\" +%H:%M:%S.%N";cmd | getline datum; close(cmd); cmd="date -d \"0.10 second "$3"\" +%H:%M:%S.%N";cmd | getline datum2; close(cmd); $2=datum ; $3=datum2 ; gsub(/0000000$/,"",$2);gsub(/0000000$/,"",$3); gsub(/^0/,"",$2);gsub(/^0/,"",$3);$10="{\\fad(800,100)\\k90}"$10 ; print $0}}' FS=, OFS=, "$kara" >tmp.txt
sed '/^Dialogue:/d' -i "$kara"
cat tmp.txt >>"$kara"
rm -f tmp.txt