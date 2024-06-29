#!/usr/bin/env bash

DAILY_PATH="$HOME/projects/own/log/daily"
CURRENT_DATE=$(date +"%Y-%m-%d")
FILE_NAME="${CURRENT_DATE}.md"
FILE_PATH="$DAILY_PATH/$FILE_NAME"


if [ ! -f $FILE_PATH ]; then
  touch $FILE_PATH
  echo "# $CURRENT_DATE" >> $FILE_PATH
fi

nvim ~/projects/own/log/daily/${CURRENT_DATE}.md
