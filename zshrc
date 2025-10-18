source $HOME/.grml/zsh/zshenv
source $HOME/.grml/zsh/zprofile
source $HOME/.grml/zsh/zshrc
source $HOME/.grml/zsh/zlogin

if [[ `uname` == "Darwin" ]]; then
  source $HOME/.zshrc.osx
else
  source $HOME/.zshrc.linux
fi

# WSL kernels identify as GNU/Linux with 'Microsoft' in the release.
# example: 4.4.0-18362-Microsoft
if [[ `uname -a | grep -i microsoft | wc -l` > 0 ]]; then
  source $HOME/.zshrc.wsl
fi

if [ -f "$HOME/.zshrc.reebelo" ]; then
  source $HOME/.zshrc.reebelo
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
#export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="$(pwd)/bin:$PATH"

# Force 256-color terminals
export TERM="xterm-256color"

# rust
if [ -d "${HOME}/.cargo/bin" ]; then
  export PATH="${HOME}/.cargo/bin:${PATH}"
fi

if [ -d "$HOME/.nvm" ]; then
  export NVM_DIR="$HOME/.nvm"

  if [ -f "$NVM_DIR/nvm.sh" ]; then
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
  elif [ -f "/usr/local/opt/nvm/nvm.sh" ]; then
    [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
  fi
fi



if [ -d "$HOME/.yarn/bin" ]; then
  export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
fi

# Github token for:
#  - homebrew
#  - bundler
if [ -f "$HOME/.keys/github-repo-admin.token" ]; then
  export HOMEBREW_GITHUB_API_TOKEN=$(cat ~/.keys/github-repo-admin.token)
#  export BUNDLE_GITHUB__COM=x-access-token:$(cat ~/.keys/github-repo-admin.token)
fi

# ejson key dir
if [ -d "$HOME/.keys" ]; then
  export EJSON_KEYDIR="$HOME/.keys"
fi

export FZF_DEFAULT_OPTS="--height=50% --min-height=15 --reverse"

# set autoload path
fpath=(~/.zsh "${fpath[@]}")

# move cursor to end of line after history search completion
#autoload -Uz history-search-end cani vmc vmi lps kp fp cani bip bup bcp tmuxify utils ll lx
autoload -Uz history-search-end fp kp

# every time we load .zshrc, ditch duplicate path entries
typeset -U PATH fpath

# Add some me-specific aliases
alias be='bundle exec'
alias crails='bundle exec rails console'
alias srails='bundle exec rails server'
alias sspring='bundle exec spring stop'
alias dbe='docker-compose run --rm api bundle exec'
alias dr='docker-compose run --rm'

# pnpm
export PNPM_HOME="/Users/_m/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
