# .bash_profile

# load bashrc for WSL
if [[ -f ~/.bash_wsl ]]; then
    . ~/.bash_wsl
fi

# load bashrc
if [[ -f ~/.bashrc ]]; then
    . ~/.bashrc
fi

# User specific environment and startup programs
parse_git_branch() {
	     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
     }
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

export REPOS="/mnt/e/dev-repos-my"

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin

export FZF_DEFAULT_COMMAND="find . -type f -not -path '*/\.git/*'"

export SEARCHYAML=$HOME/.config/searchweb/pages.yaml
export SCRIPTS=$REPOS/scripts/bin
export PATH=$PATH:$GOBIN:$SCRIPTS

# User specific aliases and functions
if [[ -f ~/.bash_aliases ]]; then
    . ~/.bash_aliases
fi

