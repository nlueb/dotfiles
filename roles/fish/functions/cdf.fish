function cdf --description "cdf [base_folder]"
	echo $argv | read -l base_folder rest
	if test -z $base_folder
		set base_folder .
	end
	cd (find -L $base_folder -type d -mindepth 1 | fzf)
end
