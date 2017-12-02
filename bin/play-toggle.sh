#!/usr/bin/env bash

if playerctl play-pause &>/dev/null
then
  exit 0
fi

play=$(ssh pi 'volumio status' | grep status | grep play | wc -l)

if [[ $play -eq 1 ]]; then
    ssh pi 'volumio pause'
else 
    ssh pi 'volumio play'
fi
