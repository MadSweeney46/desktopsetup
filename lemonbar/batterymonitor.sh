#!/usr/bin/bash

#Define the battery
batteryLvl=$(acpi --battery | cut -d, -f2)
if [[ $batteryLvl != "" ]]; then
  echo $(./format.sh "batterymonitor" " $batteryLvl")
fi
