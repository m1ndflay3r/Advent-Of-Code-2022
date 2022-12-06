#!/usr/bin/env zsh

##
## Part 1
##
INPUT=$(cat ./OGinput)
IFS=$'\n\n'
zFLAG=0
unset RETURN
declare -a RETURN
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
        BBSTR=""$BBSTR""$BB"I"
        BB=$((BB+1))
      done
      BBSTR=""$BBSTR""$BB"I"
    elif [ $BB -gt $AA ]; then
      until [ $BB = $AA ]; do
        AASTR=""$AASTR""$AA"I"
        AA=$((AA+1))
      done
      AASTR=""$AASTR""$AA"I"
    elif [ $AA = $BB ]; then
      AASTR=""$AASTR""$AA"I"
      AA=$((AA+1))
    fi
    RETURN+=(
      $(echo "I"$AASTR""$BBSTR"")
    )
  done
done
unset IFS
unset zRETURN
rm -rf /$(pwd)/expandedinput
for i in $RETURN[@]; do
  if [ $zFLAG = 0 ]; then
    zFLAG=1
    zRETURN="$i"
  else
    zFLAG=0
    zRETURN=""$zRETURN":"$i""
    echo $zRETURN >> /$(pwd)/expandedinput
  fi
done
EXPINPUT=$(cat ./expandedinput)
IFS=$'\n'
zFLAG=0
unset COMPAREONE
unset COMPARETWO
FINALCOUNT=0
for i in $=EXPINPUT; do
  IFS=$':'
  unset COMPAREONE
  unset COMPARETWO
  for j in $=i; do
    if [ $zFLAG = 0 ]; then
      COMPAREONE="$j"
      zFLAG=1
    else
      COMPARETWO="$j"
      zFLAG=0
    fi
  done
  if echo $COMPAREONE | grep $COMPARETWO &> /dev/null; then
    FINALCOUNT=$((FINALCOUNT+1))
  elif echo $COMPARETWO | grep $COMPAREONE &> /dev/null; then
    FINALCOUNT=$((FINALCOUNT+1))
  fi
done
echo $FINALCOUNT

##
## Part 2
##
