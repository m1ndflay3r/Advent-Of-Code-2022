#!/usr/bin/env zsh

OSCORE="0"
PSCORE="0"

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
  OSCORE=$((OSCORE+1))
done
for i in $(cat ./OGinput | grep 'C'); do
  OSCORE=$((OSCORE+1))
done
for i in $(cat ./OGinput | grep 'X'); do
  PSCORE=$((PSCORE+1))
done
for i in $(cat ./OGinput | grep 'Y'); do
  PSCORE=$((PSCORE+1))
done
for i in $(cat ./OGinput | grep 'Z'); do
  PSCORE=$((PSCORE+1))
done

echo "$OSCORE $PSCORE"
