#!/usr/bin/env zsh

##
## uncomment to generate libraw from OGinput
##
#
# OGIN=$(cat /$(pwd)/OGinput
# IFS=$'\n\n'
# INTERMISSION=$(for i in $=OGIN; do echo -n $i && echo -n " "; done
# STAGE=${INTERMISSION//  /$'\n'}
# COUNT=0
# IFS=$'\n'
# for i in $=STAGE; do
#   echo "elf$COUNT=($i)" >> libraw
#   echo "" >> libraw
#   COUNT=$((COUNT+1))
# done
#

source /$(pwd)/libraw

COUNT=0
FOUND=0
TBTCOUNT=0
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
    echo "Biggest hoarder is elf $COUNT at $TBT"
    TBTCOUNT=$COUNT
    break
  fi
  COUNT=$((COUNT+1))
done

COUNT=0
FOUND=0
TCTCOUNT=0
until [ $COUNT -gt 250 ]; do
  TCT=$(eval echo $"elf$COUNT")
  if [ $COUNT -eq $TBTCOUNT ]; then
    COUNT=$((COUNT+1))
    TCT=$(eval echo $"elf$COUNT")
  fi
  zCOUNT=0
  until [ $zCOUNT -gt 250 ]; do
    DCD=$(eval echo $"elf$zCOUNT")
    if [ $zCOUNT -eq $TBTCOUNT ]; then
      zCOUNT=$((zCOUNT+1))
      DCD=$(eval echo $"elf$zCOUNT")
    fi
    if [ ! $TCT -ge $DCD ]; then
      FOUND="0"
      break
    else
      FOUND="1"
    fi
    zCOUNT=$((zCOUNT+1))
  done
  if [ $FOUND = "1" ]; then
    echo "Runner up elf $COUNT has $TCT"
    TCTCOUNT=$COUNT
    break
  fi
  COUNT=$((COUNT+1))
done

COUNT=0
FOUND=0
until [ $COUNT -gt 250 ]; do
  TDT=$(eval echo $"elf$COUNT")
  if [ $COUNT -eq $TBTCOUNT ] || [ $COUNT -eq $TCTCOUNT ]; then
    COUNT=$((COUNT+1))
    TDT=$(eval echo $"elf$COUNT")
  fi
  zCOUNT=0
  until [ $zCOUNT -gt 250 ]; do
    DDD=$(eval echo $"elf$zCOUNT")
    if [ $zCOUNT -eq $TBTCOUNT ] || [ $zCOUNT -eq $TCTCOUNT ]; then
      zCOUNT=$((zCOUNT+1))
      DDD=$(eval echo $"elf$zCOUNT")
    fi
    if [ ! $TDT -ge $DDD ]; then
      FOUND="0"
      break
    else
      FOUND="1"
    fi
    zCOUNT=$((zCOUNT+1))
  done
  if [ $FOUND = "1" ]; then
    echo "Runner up elf $COUNT has $TDT"
    break
  fi
  COUNT=$((COUNT+1))
done

MYAAH=$((TCT+TDT))
echo "Total supplies of the 1%: $((MYAAH+TBT))"
