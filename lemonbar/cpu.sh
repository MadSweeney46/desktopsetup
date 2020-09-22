#!/bin/bash

#Get the CPU usage
usage=$(calc 100 - $(mpstat | sed '1,3d;s/.* //'))
printf "%s %.0f" "CPU" "$usage"

