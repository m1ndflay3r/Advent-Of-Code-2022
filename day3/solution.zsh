#!/usr/bin/env zsh

source /$(pwd)/libpriorities

INPUT=$(cat /$(pwd)/OGinput)

##
## Part one
##
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

##
## Part two
##

IFS=$'\n'
COUNT=0
GCOUNT=0
unset PTWOARR
TOTAL=0
for ii in $=INPUT; do
  unset IFS
  COUNT=$((COUNT+1))
  if [ ! $COUNT -gt 3 ]; then
    PTWOARR+=(
      $ii
    )
  else
    GCOUNT=$((GCOUNT+1))
    zCOUNT=0
    unset COMPONEARR
    unset COMPTWOARR
    unset COMPTHREEARR
    declare -a COMPONEARR
    declare -a COMPTWOARR
    declare -a COMPTHREEARR
    for jj in $PTWOARR[@]; do
      zCOUNT=$((zCOUNT+1))
      if [ $zCOUNT = 1 ]; then
        while read -n -k 1 -u 0 character; do
          COMPONEARR+=(
            "$character"
          )
        done < <(echo -n $jj)
      elif [ $zCOUNT = 2 ]; then
        while read -n -k 1 -u 0 character; do
          COMPTWOARR+=(
            "$character"
          )
        done < <(echo -n $jj)
      elif [ $zCOUNT = 3 ]; then
        while read -n -k 1 -u 0 character; do
          COMPTHREEARR+=(
            "$character"
          )
        done < <(echo -n $jj)
        zCOUNT=0
      fi
    done
    unset MATCHARR
    declare -a MATCHARR
    for kk in $COMPONEARR[@]; do
      for ll in $COMPTWOARR[@]; do
        if [ $kk = $ll ]; then
          MATCHARR+=(
            "$kk"
          )
          MATCHED=1
          break
        else
          MATCHED=0
        fi
      done
      if [ $MATCHED = 1 ]; then
        break
      fi
    done
    for mm in $MATCHARR[@]; do
      for nn in $COMPTHREEARR[@]; do
        if [ $mm = $nn ]; then
          MATCHED=1
          break
        else
          MATCHED=0
        fi
      done
      if [ $MATCHED = 1 ]; then
        unset NUMVAL
        NUMVAL=$(eval echo $"$mm")
        TOTAL=$((TOTAL+NUMVAL))
        break
      fi
    done
    COUNT=0
    unset PTWOARR
  fi
  IFS=$'\n'
done
TOTAL=$((TOTAL*3))
TOTAL=$((TOTAL-150))
echo "Total of badge priorities is $TOTAL"
