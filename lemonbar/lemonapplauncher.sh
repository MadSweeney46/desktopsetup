#!/bin/bash

#$1 the app to launch

if [ ! -z "$1" ] ; then
  pid=$(pgrep $1)
  echo $pid
  if [ -z $pid ] ; then
    echo "jwa launch process"
    $1
  else
    echo "jwa kill process"
    kill -SIGTERM $pid
  fi
else
  echo "is null"
fi
