#!/usr/bin/env bash

if playerctl play-pause &>/dev/null
then
  exit 0
fi

localMPC=$(mpc toggle | wc -l 2>/dev/null)

if [[ $localMPC -eq 1 ]]; then
    ssh pi 'mpc toggle' &>/dev/null
fi
