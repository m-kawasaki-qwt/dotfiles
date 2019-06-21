#!/bin/sh

for file in .??*
do
	[[ "$file" == ".git" ]] && continue
	[[ "$file" == ".DS_Store" ]] && continue

	ln -sf ~/dotfiles/$file ~/$file
done

	vim +PluginInstall +qall

echo 'setup done'
