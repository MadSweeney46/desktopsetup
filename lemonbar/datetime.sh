#!/bin/bash

# Define the clock
echo $(./format.sh "datetime" "$(date "+%a %b %d, %T")")
