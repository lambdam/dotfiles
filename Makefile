default:
	echo "Select a task"

links:
	sh tasks/links.sh

homebrew:
	brew list > ./init/homebrew_list