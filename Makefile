default:
	echo "Select a task"

links:
	sh _tasks/links.sh

homebrew:
	brew list > ./_init/homebrew_list