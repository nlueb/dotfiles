function battery_indicator
	set batt (pmset -g batt | grep -o '[[:digit:]]\{1,3\}%' | tr -d '%')
	if test $batt -gt 80
		echo "  "
	else if test $batt -gt 60
		echo "  "
	else if test $batt -gt 40
		echo "  "
	else if test $batt -gt 20
		echo "  "
	else
		echo "  "
	end
end
