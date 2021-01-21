# .bash_profile

if [[ -f ~/.bash_wsl ]]; then
    . ~/.bash_wsl
fi
if [[ -f ~/.bashrc ]]; then
    . ~/.bashrc
fi

parse_git_branch() {
	     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
     }
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

export FZF_DEFAULT_COMMAND="find . -type f -not -path '*/\.git/*' -not -path '*cache*'"
export REPOS="/mnt/e/dev-repos-my"
export PAGES=$HOME/.config/searchweb/pages.yaml
export GOPATH=$HOME/go

export GOBIN=$GOPATH/bin
export SCRIPTS=$REPOS/scripts/bin
export PATH=$PATH:$GOBIN:$SCRIPTS

if [[ -f ~/.bash_aliases ]]; then
    . ~/.bash_aliases
fi

