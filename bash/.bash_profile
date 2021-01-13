# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
parse_git_branch() {
	     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
     }
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

export MYREPOS="/mnt/e/dev-repos-my"

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin

export FZF_DEFAULT_COMMAND="find . -type f -not -path '*/\.git/*'"

export SCRIPTS=$MYREPOS/scripts/bin
export PATH=$PATH:$GOBIN:$SCRIPTS

