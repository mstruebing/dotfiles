#!/usr/bin/env bash

if playerctl previous &>/dev/null
then
  exit 0
fi

ssh pi 'volumio previous'
