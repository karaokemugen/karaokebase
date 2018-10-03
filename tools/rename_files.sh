# This script is used to rename .kara files and its contents according to
# Karaoke Mugen file naming rules.
# It outputs the following scripts :
# - gitkaras.sh renames kara files in git
# - gitlyrics.sh same thing for ass files
# - mediasunix.sh renames media files in your folder (for UNIX-like)
# - mediaswindows.cmd renames media files in your folder (for windows)
# - modifymedias.sh renames medias inside kara files
# - modifylyrics.sh renames subfiles inside kara files

rm gitkaras.sh
rm gitlyrics.sh
rm mediasunix.sh
rm mediaswindows.cmd
rm modifymedias.sh
rm modifylyrics.sh

cd karas
ls * >../karas.txt
while read kara
do
	# Define new name
	LANGKARA=`cat "$kara" | grep lang= | awk -F= {'print $2'} | awk -F, {'print $1'} | tr '[:lower:]' '[:upper:]'`
	SERIES=`cat "$kara" | grep series= | awk -Fseries= {'print $2'}`
	SINGER=`cat "$kara" | grep singer= | awk -Fsinger= {'print $2'}`
	TYPE=`cat "$kara" | grep type= | awk -Ftype= {'print $2'}`
	ORDER=`cat "$kara" | grep order= | awk -F= {'print $2'}`
	TITLE=`cat "$kara" | grep title= | awk -Ftitle= {'print $2'}`
	TAGS=`cat "$kara" | grep tags= | awk -Ftags= {'print $2'} | sed 's/TAG_//g'`

	SERIESINGER=$SERIES

	if [ "$TYPE" == "MV" ] || [ "$TYPE" == "LIVE" ] && [ "$SERIES" == "" ]
	then
		SERIESINGER=$SINGER
	fi

	if [[ $TAGS = *"VIDEOGAME"* ]]
	then
		TYPE="GAME "$TYPE
	fi

	if [[ $TAGS = *"PS3"* ]]
	then
		TYPE="PS3 "$TYPE
	fi

	if [[ $TAGS = *"PS4"* ]]
	then
		TYPE="PS4 "$TYPE
	fi

	if [[ $TAGS = *"SPECIAL"* ]]
	then
		TYPE="SPECIAL "$TYPE
	fi

	if [[ $TAGS = *"REMIX"* ]]
	then
		TYPE="REMIX "$TYPE
	fi

	if [[ $TAGS = *"OVA"* ]]
	then
		TYPE="OVA "$TYPE
	fi

	if [[ $TAGS = *"ONA"* ]]
	then
		TYPE="ONA "$TYPE
	fi

	if [[ $TAGS = *"MOVIE"* ]]
	then
		TYPE="MOVIE "$TYPE
	fi

	if [[ $TAGS = *"PSX"* ]]
	then
		TYPE="PSX "$TYPE
	fi

	if [[ $TAGS = *"PS2"* ]]
	then
		TYPE="PS2 "$TYPE
	fi

	if [[ $TAGS = *"PSV"* ]]
	then
		TYPE="PSV "$TYPE
	fi

	if [[ $TAGS = *"PSP"* ]]
	then
		TYPE="PSP "$TYPE
	fi

	if [[ $TAGS = *"XBOX360"* ]]
	then
		TYPE="XBOX360 "$TYPE
	fi

	if [[ $TAGS = *"GAMECUBE"* ]]
	then
		TYPE="GAMECUBE "$TYPE
	fi

	if [[ $TAGS = *"DS"* ]]
	then
		TYPE="DS "$TYPE
	fi

	if [[ $TAGS = *"3DS"* ]]
	then
		TYPE="3DS "$TYPE
	fi

	if [[ $TAGS = *"PC"* ]]
	then
		TYPE="PC "$TYPE
	fi

	if [[ $TAGS = *"SEGACD"* ]]
	then
		TYPE="SEGACD "$TYPE
	fi

	if [[ $TAGS = *"SATURN"* ]]
	then
		TYPE="SATURN "$TYPE
	fi

	if [[ $TAGS = *"WII"* ]]
	then
		TYPE="WII "$TYPE
	fi

	if [[ $TAGS = *"SWITCH"* ]]
	then
		TYPE="SWITCH "$TYPE
	fi

	SERIESINGER=`echo "$SERIESINGER" | sed "s/*//g" | sed 's/\\;/\;/g' | sed 's/\[//g;s/\]//g' | sed 's/∆/Delta/g' | sed 's/[△\:\/☆★+×†↑½♪＊*∞♥❤♡⇄♬]/ /g' | sed 'y/·・ΛЯ³²°θØ○×Φ±∀/..AR32000OXO+A/' | sed "s/µ's/Mu's/g" | sed 's/®/(R)/g' | sed 's/…/.../g'`
	echo $SERIESINGER
	SERIESINGER=`echo "$SERIESINGER" | iconv -c -f utf8 -t ascii//TRANSLIT`

	TITLE=`echo "$TITLE" | sed "s/*//g" | sed 's/∆/Delta/g' | sed 's/\\;/\;/g' | sed 's/\[//g;s/\]//g' | sed 's/[△\:\/☆★+×†↑½♪＊*∞♥❤♡⇄♬]/ /g' | sed 'y/·・ΛЯ³²°θØ○×Φ±∀/..AR32000OXO+A/' | sed "s/µ's/Mu's/g" | sed 's/®/(R)/g' | sed 's/…/.../g'`
	TITLE=`echo "$TITLE" | iconv -c -f utf-8 -t ascii//TRANSLIT`

	TYPE=$TYPE$ORDER

	BASEFILE=`echo "$LANGKARA - $SERIESINGER - $TYPE - $TITLE" | sed 's/  */ /g'`
	KARAFILE=$BASEFILE.kara
	LYRICSFILE=$BASEFILE.ass
	OLDMEDIAFILE=`cat "$kara" | grep mediafile= | awk -F= {'print $2'}`
	OLDLYRICSFILE=`cat "$kara" | grep subfile= | awk -F= {'print $2'}`
	MEDIAEXTENSION=`echo "$OLDMEDIAFILE" | awk -F. {'print $NF'}`
	MEDIAFILE=$BASEFILE.$MEDIAEXTENSION

	if [ "$kara" != "$KARAFILE" ]
	then
		echo "git mv \"karas/$kara\" \"karas/$KARAFILE\"" >>../gitkaras.sh
	fi
	if [ "$OLDLYRICSFILE" != "$LYRICSFILE" ]
	then
		echo "sed -i '/^subfile=/s/=.*/=$LYRICSFILE/' \"karas/$kara\"" >>../modifylyrics.sh
		echo "git mv \"lyrics/$OLDLYRICSFILE\" \"karas/$LYRICSFILE\"" >>../gitlyrics.sh
	fi
	if [ "$OLDMEDIAFILE" != "$MEDIAFILE" ]
	then
		echo "sed -i '/^mediafile=/s/=.*/=$MEDIAFILE/' \"karas/$kara\"" >>../modifymedias.sh
		echo "mv \"medias/$OLDMEDIAFILE\" \"medias/$MEDIAFILE\"" >>../mediasunix.sh
		echo "rename \"medias\\$OLDMEDIAFILE\" \"medias\\$MEDIAFILE\"" >>../mediaswindows.cmd
	fi


done < ../karas.txt

rm ../karas.txt
