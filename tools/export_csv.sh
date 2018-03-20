# Build a CSV export from a karas directory
# Export is pretty basic and could be prettified.
# Comma separated lists aren't transformed into arrays, that's not a bug, it's a feature.'
# First argument is the kara folder
# Second argument is the JSON file you want to build

cd $1
dos2unix *.kara
ls *.kara >../karas.txt
cd ..

FILE=$2

echo "year,singer,songwriter,creator,author,series,lang,duration,title,type,order,tags,dateadded,datemodif,kid,audiogain,videosize,videofile" >$FILE

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

echo "\"$YEAR\",\"$SINGER\",\"$SONGWRITER\",\"$CREATOR\",\"$AUTHOR\",\"$SERIES\",\"$LANG\",\"$DURATION\",\"$TITLE\",\"$TYPE\",\"$ORDER\",\"$TAGS\",\"$DATEADDED\",\"$DATEMODIF\",\"$KID\",\"$AUDIOGAIN\",\"$VIDEOSIZE\",\"$VIDEOFILE\"" >>$FILE

done <karas.txt
rm karas.txt