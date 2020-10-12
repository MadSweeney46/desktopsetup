#!/bin/bash
#\uE0BC
#\uE0BC


color="#89beba"
if [ $1 == "cpu" ]; then
  color="#e68183"
elif [ $1 == "memory" ]; then
  color="#e39b7b"
elif [ $1 == "audio" ]; then
  color="#d9bb80"
fi

echo "$1%{O4}%{B$color}%{F#323d43}\uE0B8%{F} $2 %{O}%{B}%{O}"



