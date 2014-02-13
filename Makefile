PWD=`pwd`

default:
	echo "Select a task"

links:
	make zshrc
	make git
	make emacs
	make vim

homebrew:
	brew list > ./init/homebrew_list

zsh:
	# Link zshrc
	if [[ -L ~/.zshrc || -f ~/.zshrc ]] ; then rm ~/.zshrc ; fi
	ln -s $(PWD)/zshrc ~/.zshrc

git:
	# Link gitconfig
	if [[ -L ~/.gitconfig || -f ~/.gitconfig ]] ; then rm ~/.gitconfig ; fi
	ln -s $(PWD)/gitconfig ~/.gitconfig
	# Link gitignore_global
	if [[ -L ~/.gitignore_global || -f ~/.gitignore_global ]] ; then rm ~/.gitignore_global ; fi
	ln -s $(PWD)/gitignore_global ~/.gitignore_global

vim:
	# Link vimrc
	if [[ -L ~/.vimrc || -f ~/.vimrc ]] ; then rm ~/.vimrc ; fi
	ln -s $(PWD)/vimrc ~/.vimrc
	# Link gvimrc
	if [[ -L ~/.gvimrc || -f ~/.gvimrc ]] ; then rm ~/.gvimrc ; fi
	ln -s $(PWD)/gvimrc ~/.gvimrc
	# Install neobundle if not present
	if [[ ! -d ~/.vim ]] ; then mkdir -p ~/.vim/bundle && git clone https://github.com/Shougo/neobundle.vim.git ~/.vim/bundle/neobundle.vim ; fi

emacs:
	# Create emacs.d folder if not present
	if [[ ! -d ~/.emacs.d ]] ; then mkdir ~/.emacs.d ; fi
	# Link init.el
	if [[ -L ~/.emacs.d/init.el || -f ~/.emacs.d/init.el ]] ; then rm ~/.emacs.d/init.el ; fi
	ln -s $(PWD)/emacs.d/init.el ~/.emacs.d/init.el
	# Link custom.el
	if [[ -L ~/.emacs.d/custom.el || -f ~/.emacs.d/custom.el ]] ; then rm ~/.emacs.d/custom.el ; fi
	ln -s $(PWD)/emacs.d/custom.el ~/.emacs.d/custom.el
