#!/usr/bin/env bash

if playerctl next &>/dev/null
then
  exit 0
fi

ssh pi 'volumio next'
