#!/usr/bin/env bash

DEFAUL_SINK="alsa_output.pci-0000_00_1f.3.analog-stereo"
activeSinks=$(pactl list short sinks | grep RUNNING | cut -f1)

if [ -z "$activeSinks" ]
then 
    echo $DEFAUL_SINK
else 
    echo "$activeSinks"
fi
