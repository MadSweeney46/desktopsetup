#!/bin/bash

# Define the clock
echo $(./format.sh "datetime" $(echo -n $(date "+%a %b %d, %T")))
