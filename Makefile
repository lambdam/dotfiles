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

# Emacs

save-doom-directory:
	tar -cf ${HOME}/.emacs.d.doom.$(shell date -I).tar.zst --use-compress-program="zstd -T6" ${HOME}/.emacs.d.doom

switch-to-doom-emacs:
	rm -f ${HOME}/.emacs.d
	ln -s ${HOME}/.emacs.d.doom ~/.emacs.d

save-spacemacs-directory:
	tar -cf ${HOME}/.emacs.d.spacemacs.$(shell date -I).tar.zst --use-compress-program="zstd -T6" ${HOME}/.emacs.d.spacemacs

switch-to-spacemacs:
	rm -f ${HOME}/.emacs.d
	ln -s ${HOME}/.emacs.d.spacemacs ~/.emacs.d

