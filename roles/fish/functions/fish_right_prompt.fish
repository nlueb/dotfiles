function fish_right_prompt
	set_color grey
	echo -n (pwd | sed -e "s|^$HOME|~|" -e "s/^\//* /g" -e "s/\// › /g")
end
