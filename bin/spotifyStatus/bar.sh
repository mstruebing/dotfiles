#!/bin/bash

i3status | while :
do
    # with mpd
    read line
    song=$(ncmpcpp --current-song '{{{{%a - }%t}}|{%f}}')
    if [[ ! -z $song ]]; then
        echo -n "$song | $line" || exit 1
        continue
    fi

    # spotify client
    dir=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)
    spotify_status=$(dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'PlaybackStatus' | tail -n1 | cut -d'"' -f2)
    spotify_artist=$(dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' | awk -f ${dir}/spotify_song.awk | head -n 1 | cut -d':' -f2)
    spotify_song=$(dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' | awk -f ${dir}/spotify_song.awk | tail -n 1 | cut -d':' -f2)

    if [ "$spotify_status" = "Playing" ] ; then
        echo -n "$spotify_artist - $spotify_song | $line" || exit 1
        continue
    fi
    echo -n $line || exit 1
done
