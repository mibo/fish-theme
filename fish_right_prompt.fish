function fish_right_prompt -d "Write out the right prompt"
	set -l last_status $status

	if test $last_status -ne 0
		set_color --bold red
		echo -ns $last_status ' :( '
		set_color normal
	end

	# tmux, screen title
	switch $TERM;
	case xterm'*' vte'*';
	printf '\033]0;['(prompt_pwd)']\007';
	case screen'*';
	printf '\033k['(prompt_pwd)']\033\\';
	end

	# set_color --bold brblue
	# echo -ns [(date "+%H:%M:%S")]
	# set_color normal
end
