default:
	echo "Select a task"

homebrew:
	echo "TODO: Create a Brewfile"

homebrew-cask:
	echo "TODO: Create a Caskfile"

emacs:
	if [ -d ~/.emacs.d/ ]; then rm -rf ~/.emacs.d/; fi
	mkdir ~/.emacs.d/
	ln -sf $(shell pwd)/emacs.d/init.el ~/.emacs.d/init.el
	ln -sf $(shell pwd)/emacs.d/custom.el ~/.emacs.d/custom.el

ocaml-opam:
	opam user-setup install
