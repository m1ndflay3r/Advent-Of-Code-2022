#!/usr/bin/env zsh

PSCORE=0
OSCORE=0
ISPLAYER=0
WIN=0
LOSS=0
DRAW=0
SetFlag=0

source /$(pwd)/OGinput

A() {
    OSCORE=$((OSCORE+1))
}

B() {
    OSCORE=$((OSCORE+2))
}

C() {
    OSCORE=$((OSCORE+3))
}
X() {
    PSCORE=$((PSCORE+1))
}

Y() {
    PSCORE=$((PSCORE+2))
}

Z() {
    PSCORE=$((PSCORE+3))
}

gameflags() {
  if [ $SetFlag = W ]; then
    WIN=1
    LOSS=0
    DRAW=0
  elif [ $SetFlag = D ]; then
    WIN=0
    LOSS=0
    DRAW=0
  elif [ $SetFlag = L ]; then
    WIN=0
    LOSS=1
    DRAW=0
  fi
}

GAMESET() {
  if [ $WIN = 1 ]; then
    PSCORE=$((PSCORE+6))
  elif [ $LOSS = 1 ]; then
    OSCORE=$((OSCORE+6))
  elif [ $DRAW = 1 ]; then
    PSCORE=$((PSCORE+3))
    OSCORE=$((OSCORE+3))
  fi
}

IFS=$'\n'
for i in $=STGUIDE; do
  FLAGGY=0
  for j in $=i; do
    if [ $FLAGGY = 0 ]; then
      export OPPLAY=$j
      $j
      FLAGGY=1
    else
      export PLPLAY=$j
      $j
      FLAGGY=0
    fi
  done
  echo "$OPPLAY $PLPLAY"
  read NULL
  if [ "$OPPLAY" = "A" ] && [ "$PLPLAY" = "X" ]; then
    SetFlag=D gameflags
    GAMESET
  elif [ "$OPPLAY" = "A" ] && [ "$PLPLAY" = "Y" ]; then
    SetFlag=W gameflags
    GAMESET
  elif [ "$OPPLAY" = "A" ] && [ "$PLPLAY" = "Z" ]; then
    SetFlag=L gameflags
    GAMESET
  elif [ "$OPPLAY" = "B" ] && [ "$PLPLAY" = "X" ]; then
    SetFlag=L gameflags
    GAMESET
  elif [ "$OPPLAY" = "B" ] && [ "$PLPLAY" = "Y" ]; then
    SetFlag=D gameflags
    GAMESET
  elif [ "$OPPLAY" = "B" ] && [ "$PLPLAY" = "Z" ]; then
    SetFlag=W gameflags
    GAMESET
  elif [ "$OPPLAY" = "C" ] && [ "$PLPLAY" = "X" ]; then
    SetFlag=W gameflags
    GAMESET
  elif [ "$OPPLAY" = "C" ] && [ "$PLPLAY" = "Y" ]; then
    SetFlag=L gameflags
    GAMESET
  elif [ "$OPPLAY" = "C" ] && [ "$PLPLAY" = "Z" ]; then
    SetFlag=D gameflags
    GAMESET
  fi
  IFS=$'\n'
done
unset IFS
echo "$OSCORE $PSCORE"
