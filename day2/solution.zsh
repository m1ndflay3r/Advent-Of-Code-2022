#!/usr/bin/env zsh

OSCORE="0"
PSCORE="0"

###
### Part one
###
IFS=$'\n'
for i in $(cat ./OGinput | grep 'B X'); do
  OSCORE=$((OSCORE+6))
done
for i in $(cat ./OGinput | grep 'C Y'); do
  OSCORE=$((OSCORE+6))
done
for i in $(cat ./OGinput | grep 'A Z'); do
  OSCORE=$((OSCORE+6))
done
for i in $(cat ./OGinput | grep 'A Y'); do
  PSCORE=$((PSCORE+6))
done
for i in $(cat ./OGinput | grep 'B Z'); do
  PSCORE=$((PSCORE+6))
done
for i in $(cat ./OGinput | grep 'C X'); do
  PSCORE=$((PSCORE+6))
done
for i in $(cat ./OGinput | grep 'A X'); do
  PSCORE=$((PSCORE+3))
  OSCORE=$((OSCORE+3))
done
for i in $(cat ./OGinput | grep 'B Y'); do
  PSCORE=$((PSCORE+3))
  OSCORE=$((OSCORE+3))
done
for i in $(cat ./OGinput | grep 'C Z'); do
  PSCORE=$((PSCORE+3))
  OSCORE=$((OSCORE+3))
done
for i in $(cat ./OGinput | grep 'A'); do
  OSCORE=$((OSCORE+1))
done
for i in $(cat ./OGinput | grep 'B'); do
  OSCORE=$((OSCORE+2))
done
for i in $(cat ./OGinput | grep 'C'); do
  OSCORE=$((OSCORE+3))
done
for i in $(cat ./OGinput | grep 'X'); do
  PSCORE=$((PSCORE+1))
done
for i in $(cat ./OGinput | grep 'Y'); do
  PSCORE=$((PSCORE+2))
done
for i in $(cat ./OGinput | grep 'Z'); do
  PSCORE=$((PSCORE+3))
done
echo "$OSCORE $PSCORE"

OSCORE=0
PSCORE=0
##
## Part two
##
for i in $(cat ./OGinput | grep 'A X'); do
  OSCORE=$((OSCORE+7))
  PSCORE=$((PSCORE+3))
done
for i in $(cat ./OGinput | grep 'B X'); do
  OSCORE=$((OSCORE+8))
  PSCORE=$((PSCORE+1))
done
for i in $(cat ./OGinput | grep 'C X'); do
  OSCORE=$((OSCORE+9))
  PSCORE=$((PSCORE+2))
done
for i in $(cat ./OGinput | grep 'A Z'); do
  PSCORE=$((PSCORE+8))
  OSCORE=$((OSCORE+1))
done
for i in $(cat ./OGinput | grep 'B Z'); do
  PSCORE=$((PSCORE+9))
  OSCORE=$((OSCORE+2))
done
for i in $(cat ./OGinput | grep 'C Z'); do
  PSCORE=$((PSCORE+7))
  OSCORE=$((OSCORE+3))
done
for i in $(cat ./OGinput | grep 'A Y'); do
  PSCORE=$((PSCORE+4))
  OSCORE=$((OSCORE+4))
done
for i in $(cat ./OGinput | grep 'B Y'); do
  PSCORE=$((PSCORE+5))
  OSCORE=$((OSCORE+5))
done
for i in $(cat ./OGinput | grep 'C Y'); do
  PSCORE=$((PSCORE+6))
  OSCORE=$((OSCORE+6))
done
echo "$OSCORE $PSCORE"
