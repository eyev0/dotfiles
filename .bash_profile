#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH="$HOME/.poetry/bin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

source "$HOME/.cargo/env"
