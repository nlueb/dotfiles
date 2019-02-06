function git_extra_info_toggle
	if test $git_extra_info -eq 0
		set -g git_extra_info 1
	else
		set -g git_extra_info 0
	end
	commandline -f repaint
end
