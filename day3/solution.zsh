#!/usr/bin/env zsh

source /$(pwd)/libpriorities

INPUT=$(cat /$(pwd)/OGinput)
TOTAL=0

IFS=$'\n'
for ii in $=INPUT; do
  unset IFS
  STRLN=0
  while read -n -k 1 -u 0 character; do
    STRLN=$((STRLN+1))
  done < <(echo -n $ii)
  STRLN=$((STRLN/2))
  COMPTWO=$(echo ${ii:$STRLN})
  COMPONE=$(echo ${ii:0:$STRLN})
  unset COMPONEARR
  declare -a COMPONEARR
  while read -n -k 1 -u 0 character; do
    COMPONEARR+=(
      "$character"
    )
  done < <(echo -n $COMPONE)
  unset COMPTWOARR
  declare -a COMPTWOARR
  while read -n -k 1 -u 0 character; do
    COMPTWOARR+=(
      "$character"
    )
  done < <(echo -n $COMPTWO)
  for jj in $COMPONEARR[@]; do
    for kk in $COMPTWOARR[@]; do
      if [ $jj = $kk ]; then
        MATCHED=1
        break
      else
        MATCHED=0
      fi
    done
    if [ $MATCHED = 1 ]; then
      unset NUMVAL
      NUMVAL=$(eval echo $"$jj")
      TOTAL=$((TOTAL+NUMVAL))
      break
    fi
  done
  IFS=$'\n'
done
unset IFS
echo "Total sum of priorities is $TOTAL"

