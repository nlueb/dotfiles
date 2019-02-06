function fish_prompt
	test $SSH_TTY; and printf (set_color red)(whoami)(set_color white)'@'(set_color yellow)(hostname)' '

	test $USER = 'root'; and echo (set_color red)"#"

	# Main
	#echo -n (set_color cyan)(prompt_pwd) (set_color red)'❯'(set_color yellow)'❯'(set_color green)'❯ '
	echo -n (set_color normal)' '
	# echo -n (set_color black)(set_color -b green)':'(set_color normal)' '
	# echo -n (set_color black)(set_color -b white)' ━ '(set_color normal)' '
	# echo -n (set_color black)(set_color -b white)' ‣ '(set_color normal)' '
end
