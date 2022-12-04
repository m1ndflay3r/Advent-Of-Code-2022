#!/usr/bin/env zsh

source /$(pwd)/libraw

COUNT=0
FOUND=0
until [ $COUNT -gt 250 ]; do
  TBT=$(eval echo $"elf$COUNT")
  zCOUNT=0
  until [ $zCOUNT -gt 250 ]; do
    DBD=$(eval echo $"elf$zCOUNT")
    if [ ! $TBT -ge $DBD ]; then
      FOUND="0"
      break
    else
      FOUND="1"
    fi
    zCOUNT=$((zCOUNT+1))
  done
  if [ $FOUND = "1" ]; then
    echo $TBT
    break
  fi
  COUNT=$((COUNT+1))
done

