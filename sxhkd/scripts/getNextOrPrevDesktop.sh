  #!/bin/bash
  
desktopsAnz=($(bspc query -D --names))
currentDesktop=$(bspc query -D -d --names)
  
currentDesktop=${currentDesktop}
desktopsAnz="${desktopsAnz[${#desktopsAnz[@]}-1]}"
  
if [ $1 == "+" ]; then
  if (( $currentDesktop < $desktopsAnz ));then
    ((currentDesktop=$currentDesktop+1))
  else
    ((currentDesktop=1))
  fi
elif [ $1 == "-" ]; then
  if (( currentDesktop > 1 )); then
    ((currentDesktop=currentDesktop-1))
  else
    ((currentDesktop=$desktopsAnz ))
    fi                                                                                                                                                                             
fi
echo $currentDesktop
