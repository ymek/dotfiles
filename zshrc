PATH="$(pwd)/bin:$PATH"

source $HOME/.grml/zsh/zshenv
source $HOME/.grml/zsh/zprofile
source $HOME/.grml/zsh/zshrc
source $HOME/.grml/zsh/zlogin

if [[ `uname` == "Darwin" ]]; then
  source $HOME/.zshrc.osx
else
  source $HOME/.zshrc.linux
fi

#  insert completion on first tab even if ambiguous
setopt menu_complete

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Disable annoying-as-hell autocomplete
unsetopt correct_all
unsetopt correct

source $HOME/.git.zsh
autoload -U colors && colors

function git_remote_prompt() {
  prompt_info=$(git_prompt_info) || return
  echo "%F{magenta}[%F{green}$prompt_info%f$(git_remote_status)%F{magenta}]%f"
}

prompt off
setopt PROMPT_SUBST
PS1='%B%F{red}%(?..%? )%b %B%40<..<%~%<< %b$(git_remote_prompt) %F{yellow}$(git_prompt_short_sha)%f %(!.#.») '

# Ensure user-installed binaries take precedence
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Force 256-color terminals
export TERM="xterm-256color"

# Add some me-specific aliases
alias be='bundle exec'
alias crails='bundle exec rails console'
alias srails='bundle exec rails server'
alias sspring='bundle exec spring stop'

if [ -d "$HOME/.nvm" ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

if [ -d "$HOME/.yarn/bin" ]; then
  export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
fi
