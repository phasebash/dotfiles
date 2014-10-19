if [ -f /home/${USER}/.bash/`uname`/.bash_profile ]; then
    . /home/${USER}/.bash/`uname`/.bash_profile
fi

if [ -f /home/${USER}/.bash/noarch/.bash_profile ]; then
    . /home/${USER}/.bash/noarch/.bash_profile 
fi

if [ -f /Users/${USER}/.bash/`uname`/.bash_profile ]; then
    . /Users/${USER}/.bash/`uname`/.bash_profile
fi

if [ -f /Users/${USER}/.bash/noarch/.bash_profile ]; then
    . /Users/${USER}/.bash/noarch/.bash_profile 
fi
