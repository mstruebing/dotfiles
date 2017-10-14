#!/usr/bin/env bash

if playerctl next &>/dev/null
then
  exit 0
fi

localMPC=$(mpc next | wc -l 2>/dev/null)

if [[ $localMPC -eq 1 ]]; then
    ssh pi 'mpc next' &>/dev/null
fi
