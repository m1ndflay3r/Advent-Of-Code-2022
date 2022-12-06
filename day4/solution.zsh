#!/usr/bin/env zsh

INPUT=$(cat ./OGinput)

IFS=$'\n\n'
for a in $=INPUT; do
  IFS=$','
  for b in $=a; do
    IFS=$'-'
    unset AA
    unset BB
    FLAGGY=0
    for c in $=b; do
      if [ $FLAGGY = 0 ]; then
        AA=$c
        FLAGGY=1
      else
        BB=$c
        FLAGGY=0
      fi
    done
    if [ $AA -gt $BB ]; then
      until [ $AA = $BB ]; do
        echo $BB
        BB=$((BB+1))
      done
      echo $BB
    elif [ $BB -gt $AA ]; then
      until [ $BB = $AA ]; do
        echo $AA
        AA=$((AA+1))
      done
      echo $AA
    fi
    IFS=$','
  done
  IFS=$'\n\n'
done
