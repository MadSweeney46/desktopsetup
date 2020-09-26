#!/bin/bash

#$1 the app to launch
if [ ! -z "$1" ] ; then
  pid=$(pgrep $1)
  if [ -z $pid ] ; then
    $1 &
  else
    kill -SIGTERM $pid
  fi
else
  echo "is null"
fi
