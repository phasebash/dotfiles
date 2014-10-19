# 
# phasebash -- ~/.bash/noarch/.bash_profile
# 

# import global profile
if [ -f /etc/profile ]; then
   source /etc/profile
fi

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs
PATH=$PATH:$HOME/.local/bin:$HOME/bin

# add all local apps bin dirs to path
for f in $HOME/local/*/bin ; do PATH=$f:$PATH ; done


# finally set our path
export PATH

#
# git -- git bash customizations
#

# thanks to Andreas D @ OCLC for this one.
function gitbranchname() {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \[\1\]/'
}

# add the current git branch name to PS1 if available
# export PS1="\h:\W \u\[\033[0;32m\]`gitbranchname` \[\033[0m\]\$ "
