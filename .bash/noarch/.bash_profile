# 
# phasebash -- ~/.bash/noarch/.bash_profile
# 

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs
PATH=$PATH:$HOME/.local/bin:$HOME/bin

# add all local bin dirs to the path.  i've not yet decided if this is cool or dangerous
for f in $HOME/local/*/bin ; do PATH=$PATH:$HOME/local/$f/bin ; done

# set the current java distribution by symlink in $HOME/jdk
if [ -d $HOME/local/jdk ]; then
    export JAVA_HOME=$HOME/local/jdk
    export JDK_HOME=$JAVA_HOME
fi

# set our path
export PATH

#
# git -- git bash customizations
#

# thanks to Andreas D @ OCLC for this one.
function gitbranchname() {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \[\1\]/'
}

# add the current git branch name to PS1 if available

export PS1="\h:\W \u\[\033[0;32m\]\$(gitbranchname) \[\033[0m\]\$ "
