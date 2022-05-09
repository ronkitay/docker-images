prepare: 
	echo "Generating .zshrc.generated"

	echo "" > .zshrc.generated

	echo "alias fd=fdfind" >> .zshrc.generated
	echo "alias bat=batcat" >> .zshrc.generated

	cat ${HOME}/.bindkey.settings >> .zshrc.generated && echo ""  >> .zshrc.generated
	cat ${HOME}/.fzf.settings >> .zshrc.generated && echo ""  >> .zshrc.generated
	cat .oh.my.zsh.settings >> .zshrc.generated && echo ""  >> .zshrc.generated

	cat ${HOME}/.aliases/.common.aliases >> .zshrc.generated && echo ""  >> .zshrc.generated
	cat ${HOME}/.aliases/.git.aliases >> .zshrc.generated && echo ""  >> .zshrc.generated
	cat ${HOME}/.aliases/.iterm.aliases >> .zshrc.generated && echo ""  >> .zshrc.generated
	cat ${HOME}/.aliases/.java.aliases >> .zshrc.generated && echo ""  >> .zshrc.generated
	cat ${HOME}/.aliases/.k8s.aliases >> .zshrc.generated && echo ""  >> .zshrc.generated

	echo "" >> .zshrc.generated 
