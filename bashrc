# .bashrc
# Some extensions to the bashrc, to be sourced from the real .bashrc

# History settings
export HISTCONTROL=ignoreboth
export HISTSIZE=
export HISTFILESIZE=
export HISTFILE=$HOME/.bash_history_long
export HISTIGNORE='ls:ll:ls -alh:pwd:clear:history:git st:git ap:tig:git ci'
export HISTTIMEFORMAT='%F %T '

# Default editor
export EDITOR=vim

# macOS-style copy/paste
alias pbcopy='xclip -i -selection clipboard'
alias pbpaste='xclip -o -selection clipboard'

# Fuzzy find for history
source /usr/share/fzf/shell/key-bindings.bash
