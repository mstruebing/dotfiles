# Load devbox
eval "$(devbox global shellenv --init-hook)"
# Load direnv
eval "$(direnv hook zsh)"


# Load antigen (plugin manager)
source ~/.local/share/devbox/global/current/.devbox/nix/profile/default/share/antigen/antigen.zsh

# Configure antigen
antigen use oh-my-zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions

antigen theme jispwoso

# Tell Antigen that you're done.
antigen apply

# Start gpg-agent
gpg-agent --daemon 2>/dev/null

# Emacs bindings - use -v otherwise
bindkey -e

# Let devbox handle the update
DISABLE_AUTO_UPDATE="true"

# I don't think I need this?
# TODO: Check what happens to tmux "titles"
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git tmux tmuxinator zsh-syntax-highlighting)
# plugins=(git tmux tmuxinator asdf)
plugins=(git zsh-syntax-highlighting zsh-autosuggestions tmux tmuxinator)


# Some manual language "hacks"
export LANG=en_US.UTF-8
export LC_CTYPE=C.UTF-8
# export LC_ALL=en_US.UTF-8


# For gpg signing - https://stackoverflow.com/questions/41052538/git-error-gpg-failed-to-sign-data
export GPG_TTY=$(tty)


# Editor
export EDITOR="nvim"

# Local bin dir
export PATH=/home/debian/bin:$PATH

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Personal includes
#
#

# Load fzf: https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Automatically start or attach to an existing tmux session
[ -z "$TMUX"  ] && { tmux -2u attach || exec tmux -2u new-session;}


# Use colordiff if present
if command -v colordiff > /dev/null; then
    alias diff='colordiff -u'
else
    alias diff='diff -u'
fi

# Start ssh-agent
# only if $XDG_RUNTIME_DIR is set 
# (seems to work as a difference between mac and linux)
if [[ ! -z $XDG_RUNTIME_DIR ]]; then
    echo "XDG_RUNTIME_DIR: $XDG_RUNTIME_DIR"
    if ! pgrep -u "$USER" ssh-agent > /dev/null; then
        ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
    fi

    if [[ ! -f "$SSH_AUTH_SOCK" ]]; then
        source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
    fi
fi

###########
# ALIASES #
###########

# cd aliases
alias '..'='cd ..'
alias '...'='cd ../..'
alias 'dl'='cd ~/Downloads'
alias 'p'='cd ~/projects'
alias 'pw'='cd ~/projects/work'
alias 'po'='cd ~/projects/own'
alias 'pc'='cd ~/projects/contrib'
alias 'pt'='cd ~/projects/trying'
alias 't'='cd /tmp'
alias 'docs'='cd ~/Documents'
alias 'dots'='cd ~/.dotfiles'

# git aliases
alias 'g'='git'
alias 'gpc'='git push origin $(git_current_branch)' # because i cant use this variable in my gitconfig
alias 'gup'='git pull origin $(git_current_branch)'

# misc
alias 'n'='nvim'
alias 'mux'='tmuxinator'
alias 'k'='kubectl'
alias ls='ls -lah --color=auto'
alias tmux='tmux -2u'
alias dots='cd ~/.dotfiles'


#############
# FUNCTIONS #
#############

# cds into an directory and make an ls and pwd
# USAGE: cd <DIRECTORY>
function cd() {
  builtin cd "$@" && ls -l && pwd
}


# USAGE: mkd <DIRECTORY>
# Create a new directory and enter it
function mkd() {
    mkdir -p "$@" && cd "$@";
}

# USAGE calc <arithmetic expression>
# calculator aligator :)
function calc() {
  echo "$*" | bc -l
}

# USAGE: touch <folder/folder2/file.extension>
# touches a file and (if needed) it's parent directories
function touch() {
  if (($# < 1)); then
    echo "Missing argument";
    return 1;
  fi

  for f in "$@"; do
    mkdir -p -- "$(dirname -- "$f")" && command touch -- "$f"
  done
}

# USAGE: cdg
# cds into the git root
function cdg() {
    cd $(git rev-parse --show-toplevel)
}
