# Prints out basic stats.

# This is the sqlite3 version. Feel free to make a bash only version using the karas.sqlite3 database if you need it and offer a pull request.
# sqlite3 needs to be installed obviously
# You also need a karas.sqlite3 database generated via Karaoke Mugen.

DB=$1

KARAS=`sqlite3 $1 "SELECT COUNT(*) FROM kara;"`
ARTISTS=`sqlite3 $1 "SELECT COUNT(*) FROM tag WHERE tagtype = 2;"`
LANGS=`sqlite3 $1 "SELECT COUNT(*) FROM tag WHERE tagtype = 5;"`
DURATION=`sqlite3 $1 "SELECT SUM(duration) FROM kara;"`

echo "{ \"karas\": $KARAS,"
echo "  \"singers\": $ARTISTS,"
echo "  \"languages\": $LANGS,"
echo "  \"duration\": $DURATION"
echo "}"
