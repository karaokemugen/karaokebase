# Prints out basic stats.

# This is the sqlite3 version. Feel free to make a bash only version using the karas.sqlite3 database if you need it and offer a pull request.
# sqlite3 needs to be installed obviously
# You also need a karas.sqlite3 database generated via Karaoke Mugen.

DB=$1

KARAS=`sqlite3 $1 "SELECT COUNT(*) FROM kara;"`
ARTISTS=`sqlite3 $1 "SELECT COUNT(*) FROM tag WHERE tagtype = 2;"`
AUTHORS=`sqlite3 $1 "SELECT COUNT(*) FROM tag WHERE tagtype = 6;"`
CREATORS=`sqlite3 $1 "SELECT COUNT(*) FROM tag WHERE tagtype = 4;"`
SONGWRITERS=`sqlite3 $1 "SELECT COUNT(*) FROM tag WHERE tagtype = 8;"`
SONGTYPES=`sqlite3 $1 "SELECT COUNT(*) FROM tag WHERE tagtype = 3;"`
MISC=`sqlite3 $1 "SELECT COUNT(*) FROM tag WHERE tagtype = 7;"`
SERIES=`sqlite3 $1 "SELECT COUNT(*) FROM series;"`
LANGS=`sqlite3 $1 "SELECT COUNT(*) FROM tag WHERE tagtype = 5;"`
DURATION=`sqlite3 $1 "SELECT SUM(duration) FROM kara;"`
SIZE=`sqlite3 $1 "SELECT SUM(mediasize) FROM kara;"`

echo "{ \"karas\": $KARAS,"
echo "  \"singers\": $ARTISTS,"
echo "  \"songwriters\": $SONGWRITERS,"
echo "  \"songtypes\": $SONGTYPES,"
echo "  \"misc\": $MISC,"
echo "  \"authors\": $AUTHORS,"
echo "  \"creators\": $CREATORS,"
echo "  \"series\": $SERIES,"
echo "  \"languages\": $LANGS,"
echo "  \"size\": $SIZE,"
echo "  \"duration\": $DURATION"
echo "}"
