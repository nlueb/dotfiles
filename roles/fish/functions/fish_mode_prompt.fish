function fish_mode_prompt
	set glyph 
	set glyph2 
	set seperator (set_color 282a36)(set_color c5c6d3 -b 44475a)
	set color red
	
	#git check
	set git_check (git status ^&1 | grep fatal)
	if test (count $git_check) -eq 0;
		set out '  '
	else;
		set out '   '
	end
	# 
	switch $fish_bind_mode
	case default
		set color red
	case insert
		set color green
	case replace_one
		set color ffb86c
	case visual
		set color yellow
	case '*'
		set_color --bold red
		echo '?'
	end

	set_color -o 282a36 -b $color
	echo $out

	if test \( $git_extra_info -eq 1 \) -a \( (count $git_check) -eq 0 \)
		set gitstatus (gitstatus.py)

		if test (count $gitstatus) -gt 0
			set git_branch $gitstatus[1]
			set git_remote $gitstatus[2]
			set git_staged $gitstatus[3]
			set git_conflicts $gitstatus[4]
			set git_changed $gitstatus[5]
			set git_untracked $gitstatus[6]
			set git_stashed $gitstatus[7]
			set git_clean $gitstatus[8]

			set_color -o $color -b 44475a
			echo $glyph
			set_color c5c6d3 -b 44475a

			echo "  $git_branch "
			# set_color 282a36
			# echo "  "
			# set_color grey -b 44475a

			if not test $git_changed -eq "0"
				echo $seperator
				echo "  $git_changed "
			end
			if not test $git_staged -eq "0"
				echo $seperator
				echo "  $git_staged "
			end
			if not test $git_untracked -eq "0"
				echo $seperator
				echo "  $git_untracked "
			end
			if not test $git_conflicts -eq "0"
				echo $seperator
				echo "  $git_conflicts "
			end
			if not test $git_stashed -eq "0"
				echo $seperator
				echo "  $git_stashed "
			end
			# if not test $git_changed -eq "0"
			# 	echo $seperator
			# 	echo "  $git_changed "
			# end
			# if not test $git_staged -eq "0"
			# 	echo $seperator
			# 	echo "  $git_staged "
			# end
			# if not test $git_untracked -eq "0"
			# 	echo $seperator
			# 	echo "  $git_untracked "
			# end
			# if not test $git_conflicts -eq "0"
			# 	echo $seperator
			# 	echo "  $git_conflicts "
			# end
			# if not test $git_stashed -eq "0"
			# 	echo $seperator
			# 	echo "  $git_stashed "
			# end

			# echo ' lul '
			set_color -o 44475a -b 282a36
			echo $glyph
		else
			set_color -r
			echo $glyph
		end
	else
		set_color -r
		echo $glyph
	end
	set_color normal
end
