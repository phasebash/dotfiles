# 
# phasebash -- ~/.bash/noarch/.bash_profile
# 

# import global profile
if [ -f /etc/profile ]; then
   source /etc/profile
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

if [ -f ${HOME}/.bash/noarch/git-prompt.sh ]; then
    . ${HOME}/.bash/noarch/git-prompt.sh
    export PS1='\u@\h \W$(__git_ps1 " (%s)")\$ '
fi

