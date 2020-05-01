#!/usr/bin/env bash
#Liste les vidéos qui n'ont pas l'audio AAC / la vidéo h264 / le bit depth 8bit

for i in *.mp4; do
        mediainfo=$(mediainfo "$i")
        if ! echo $mediainfo|grep -q "AAC"; then
            echo "$i n'est pas en AAC, eh oh le status quo !"
        fi
        if ! echo $mediainfo|grep -q "AVC"; then
            echo "$i n'est pas en h264, eh oh le status quo !"
        fi
        if ! echo $mediainfo|grep -q "8 bits"; then
            echo "$i n'est pas encodé en 8 bits."
        fi
done