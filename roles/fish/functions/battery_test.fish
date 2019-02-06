function battery
  set batt (pmset -g batt | grep -o '[[:digit:]]\{1,3\}%')
  echo -e \ue00a $batt
end
