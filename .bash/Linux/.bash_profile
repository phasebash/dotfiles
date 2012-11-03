#
# phasebash -- Linux arch .bash_profile
# 

# intellij idea on linux is best left installed by hand.
if [ -d $HOME/local/idea ]; then
    export IDEA_HOME=$HOME/local/idea
fi

# set the current java distribution by symlink in $HOME/jdk
if [ -d $HOME/local/jdk ]; then
    export JAVA_HOME=$HOME/local/jdk
    export JDK_HOME=$JAVA_HOME
fi

