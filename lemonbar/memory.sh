#!/bin/bash

sededtrimmedFreeM=$(free -m | tr -s ' ' | sed '2q;d')
totalMem=$(echo $sededtrimmedFreeM | cut -d ' ' -f 2 | cut -d ' ' -f 2)
usedMem=$(echo $sededtrimmedFreeM | cut -d ' ' -f 3)
memPerc="$(calc 100/$totalMem*$usedMem)"
echo $(./format.sh "memory" "$(printf " %.0f%s\n" "${memPerc:2}" "%")")
