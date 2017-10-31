#!/usr/bin/env bash

if playerctl previous &>/dev/null
then
  exit 0
fi

localMPC=$(mpc prev | wc -l 2>/dev/null)

if [[ $localMPC -eq 1 ]]; then
    ssh pi 'mpc prev' &>/dev/null
fi
