#!/usr/bin/bash

#Define the battery
echo $(./format.sh "batterymonitor" $(acpi --battery | cut -d, -f2))
