#!/usr/bin/env zsh

source /$(pwd)/libraw

COUNT=0
unset SUMS
unset RAWSUMS
ISLASTRUN=0
if [ -z $TERMINATEALREADY ]; then
  TERMINATEALREADY="0"
fi
declare -a SUMS
until [ $COUNT = 251 ]; do
  if [ ! -z "$BLACKLIST" ]; then
    if [ $COUNT = $BLACKLIST ]; then
      COUNT=$((COUNT+1))
    fi
    if [ -z "$MEMBERME" ]; then
      ISLASTRUN=0
      export MEMBERME=$BLACKLIST
    else
      ISLASTRUN=1
    fi
    if [ $COUNT = $MEMBERME ]; then
      COUNT=$((COUNT+1))
    fi
  fi
  RET=0
  export SOMEVAR=elf$COUNT
  for i in $(typeset $SOMEVAR); do
    if ! echo $i | grep \( &> /dev/null; then
      if ! echo $i | grep \) &> /dev/null; then
        RET=$((RET+i))
      fi
    fi
  done
  RAWSUMS+=(
    "$RET"
  )
  SUMS+=(
    "$COUNT   $RET"
  )
  COUNT=$((COUNT+1))
done

FOUND="0"
unset CANDIDATES
declare -a CANDIDATES
for j in $RAWSUMS[@]; do
  for k in $RAWSUMS[@]; do
    if [ $k -gt $j ]; then
      FOUND="0"
      break
    else
      FOUND="1"
    fi
  done
  if [ $FOUND = 1 ]; then
    CANDIDATES+=(
      "$j"
    )
  fi
done

for wasd in $SUMS[@]; do
  if echo $wasd | grep $CANDIDATES[@] &> /dev/null; then
    IFS=$'   '
    FLAGGYMCFLAGFACE=0
    for finale in $=wasd; do
      if [ $FLAGGYMCFLAGFACE = 0 ]; then
        if [ -z "$BLACKLIST" ]; then
          echo "Elf $finale is the biggest resource hoarder of them all."
        else
          echo "Elf $finale is still kind of hoarding, but isn't as bad as the first guy."
        fi
        FLAGGYMCFLAGFACE=1
        BLACKLIST=$finale
      else
        echo "Total resource count: $finale"
        echo " "
      fi
    done
    if [ $ISLASTRUN = 0 ]; then
      BLACKLIST=$BLACKLIST . /$(pwd)/solution.zsh
    else
      if [ $TERMINATEALREADY = 1 ]; then
        unset MEMBERME
        exit 0
      else
        TERMINATEALREADY=1 BLACKLIST=$BLACKLIST MEMBERME=$MEMBERME . /$(pwd)/solution.zsh
      fi
    fi
    unset IFS
    break
  fi
done
