#!/usr/bin/env zsh

INPUT=$(cat ./OGinput)

IFS=$'\n\n'
zFLAG=0
unset RETURN
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
    unset AASTR
    unset BBSTR
    if [ $AA -gt $BB ]; then
      until [ $AA = $BB ]; do
        BBSTR=""$BBSTR""$BB""
        BB=$((BB+1))
      done
      BBSTR=""$BBSTR""$BB""
    elif [ $BB -gt $AA ]; then
      until [ $BB = $AA ]; do
        AASTR=""$AASTR""$AA""
        AA=$((AA+1))
      done
      AASTR=""$AASTR""$AA""
    elif [ $AA = $BB ]; then
      AASTR=""$AASTR""$AA""
      AA=$((AA+1))
    fi
    echo ""$AASTR""$BBSTR""
  done
done
