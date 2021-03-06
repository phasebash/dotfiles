autoload -Uz compinit && compinit
# partial completion suggestions
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix

zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:$HOME/local/bin"

. $(brew --prefix asdf)/asdf.sh
eval "$(direnv hook zsh)"

export CDP_SOUND_EXT=wav
export EDITOR=vim
export ERL_AFLAGS="-kernel shell_history enabled"
export GPG_TTY=$(tty)

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export JAVA_16_HOME=$(/usr/libexec/java_home -v16)

alias java16='export JAVA_HOME=$JAVA_16_HOME'

java16
