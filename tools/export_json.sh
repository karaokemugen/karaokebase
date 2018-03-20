# Build a JSON export from a karas directory
# Export is pretty basic and could be prettified.
# Comma separated lists aren't transformed into arrays, that's not a bug, it's a feature.'
# First argument is the kara folder
# Second argument is the JSON file you want to build

cd $1
ls *.kara >../karas.txt
cd ..

FILE=$2

echo "{\"karas\": [" >$FILE

while read kara 
do
YEAR=`cat "$1/$kara" | grep year= | awk -F= {'print $2'}`
SINGER=`cat "$1/$kara" | grep singer= | awk -F= {'print $2'}`
SONGWRITER=`cat "$1/$kara" | grep songwriter= | awk -F= {'print $2'}`
CREATOR=`cat "$1/$kara" | grep creator= | awk -F= {'print $2'}`
AUTHOR=`cat "$1/$kara" | grep author= | awk -F= {'print $2'}`
SERIES=`cat "$1/$kara" | grep series= | awk -F= {'print $2'}`
LANG=`cat "$1/$kara" | grep lang= | awk -F= {'print $2'}`
DURATION=`cat "$1/$kara" | grep videoduration= | awk -F= {'print $2'}`
TITLE=`cat "$1/$kara" | grep title= | awk -F= {'print $2'}`
TYPE=`cat "$1/$kara" | grep type= | awk -F= {'print $2'}`
ORDER=`cat "$1/$kara" | grep order= | awk -F= {'print $2'}`
TAGS=`cat "$1/$kara" | grep tags= | awk -F= {'print $2'}`
DATEADDED=`cat "$1/$kara" | grep dateadded | awk -F= {'print $2'}`
DATEMODIF=`cat "$1/$kara" | grep datemodif | awk -F= {'print $2'}`
KID=`cat "$1/$kara" | grep KID | awk -F= {'print $2'}`
AUDIOGAIN=`cat "$1/$kara" | grep videogain | awk -F= {'print $2'}`
VIDEOSIZE=`cat "$1/$kara" | grep videosize | awk -F= {'print $2'}`
VIDEOFILE=`cat "$1/$kara" | grep videofile | awk -F= {'print $2'}`
SUBFILE=`cat "$1/$kara" | grep subfile | awk -F= {'print $2'}`

echo " {\"year\": \"$YEAR\"," >>$FILE
echo "  \"subfile\": \"$SUBFILE\"," >>$FILE
echo "  \"videofile\": \"$VIDEOFILE\"," >>$FILE
echo "  \"singer\": \"$SINGER\"," >>$FILE
echo "  \"songwriter\": \"$SONGWRITER\"," >>$FILE
echo "  \"creator\": \"$CREATOR\"," >>$FILE
echo "  \"author\": \"$AUTHOR\"," >>$FILE
echo "  \"series\": \"$SERIES\"," >>$FILE
echo "  \"lang\": \"$LANG\"," >>$FILE
echo "  \"duration\": $DURATION," >>$FILE
echo "  \"title\": \"$TITLE\"," >>$FILE
echo "  \"type\": \"$TYPE\"," >>$FILE
echo "  \"order\": \"$ORDER\"," >>$FILE
echo "  \"tags\": \"$TAGS\"," >>$FILE
echo "  \"dateadded\": \"$DATEADDED\"," >>$FILE
echo "  \"datemodif\": \"$DATEMODIF\"," >>$FILE
echo "  \"kid\": \"$KID\"," >>$FILE
echo "  \"audiogain\": \"$AUDIOGAIN\"," >>$FILE
echo " }," >>$FILE
done <karas.txt
echo "]}" >>$FILE
sed 'x; ${s/,//;p;x}; 1d' -i $FILE
sed 's/\\//g' -i $FILE
#sed '1s/.*/{"karas": \[/' -i file.txt
rm karas.txt