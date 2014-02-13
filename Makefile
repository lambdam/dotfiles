PWD=`pwd`

default:
	echo "Select a task"

homebrew:
	brew list > ./init/homebrew_list

emacs:
	if [[ ! -d ~/.emacs.d ]] ; then mkdir ~/.emacs.d ; fi
	if [[ -L ~/.emacs.d/init.el || -f ~/.emacs.d/init.el ]] ; then rm ~/.emacs.d/init.el ; fi
	ln -s $(PWD)/emacs.d/init.el ~/.emacs.d/init.el
	if [[ -L ~/.emacs.d/custom.el || -f ~/.emacs.d/custom.el ]] ; then rm ~/.emacs.d/custom.el ; fi
	ln -s $(PWD)/emacs.d/custom.el ~/.emacs.d/custom.el
