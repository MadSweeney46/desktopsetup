  #!/bin/bash
  
desktopsAnz=($(bspc query -D --names))
currentDesktop=$(bspc query -D -d --names)
  
currentDesktop=${currentDesktop}
desktopsAnz="${desktopsAnz[${#desktopsAnz[@]}-1]}"
  
#was soll hier passieren?
#die taseten "h" und "l" sollen den ersten Monitor umschalten und "j" und "k" sollen den zweiten Monitor wechseln

#Es muss darauf geachtet werden, dass beim erhöhen des ersten monitors nicht aufeinmal der zweite monitor umschaltet, sobald monitor 1
#die maximale anzahl seiner desktops erreicht hat. Er soll dann wieder von vorne anfangen. genaus so soll es sich bei monitor 2 auch verhalten.

#Die frage die ich mir grade stelle ist, ob man eine klare grenze einführen sollte oder ob ich einfach mit dem modulo operator prüfe, ob es eine ungerade zahl ist.
#Sollte das der Fall sein, weiß ich ja dass der erste monitor erhöht werden muss und falls nicht, wird halt monitor 2 erhöht
# Die Limitation die daraus entsteht ist natürlich, dass, wenn die Desktops weiterhin aus ganzzahlen bestehen sollen, die Anzahl der Monitore auf 2 limitiert wird.
#Wenn ich jedoch ein verhalten möchte in dem es so ist, dass bei einem bestimmten limit die desktops wieder von vorne anfangen (also von 1-3 und wenn er auf 3 ist wird wieder auf 1 gesprungen und nicht auf 4, da das ein desktop auf monitor zwei ist) muss ich folgendes beachten:

#1. Sollen alle bildschirme immer gleich viele monitore haben? Nein

#2. Woher kann ich die grenze der Monitore bestimmen?
#Durch variablen
#Da muss ich einfach nur n Dictionary machen mit "montior"+x wobei x eine laufende variable ist

if [ $1 == "+" ]; then
  if (( $currentDesktop <= $desktopsAnz ));then
    ((currentDesktop=$currentDesktop+1))
  #elif (( $currentDesktop == $desktopsAnz )); then
  #((currentDesktop=1))
  else
    ((currentDesktop=1))
  fi
elif [ $1 == "-" ]; then
  if (( currentDesktop > 1 )); then
    ((currentDesktop=currentDesktop-1))
  else
    ((currentDesktop=$desktopsAnz+1))
    fi                                                                                                                                                                             
fi
echo $currentDesktop
