#!/usr/bin/env bash

COUNT=0
COUNT=$(gh search prs --review-requested @me --state open | wc -l | xargs)

echo $COUNT

if [ "$COUNT" -gt "0" ]; then
  sketchybar --set $NAME icon.highlight=on label="$COUNT"
else
  if [ "$COUNT" = "" ]; then
    sketchybar --set $NAME icon.highlight=off label="!"
  else 
    sketchybar --set $NAME icon.highlight=off label="$COUNT" 
  fi
fi
