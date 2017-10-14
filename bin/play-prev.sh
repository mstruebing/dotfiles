#!/usr/bin/env bash

if playerctl previous &>/dev/null
then
  exit 0
fi

localMPC=$(mpc prec | wc -l 2>/dev/null)

if [[ $localMPC -eq 1 ]]; then
    ssh pi 'mpc prec' &>/dev/null
fi
