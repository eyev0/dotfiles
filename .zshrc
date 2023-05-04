# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
# if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
#   source /usr/share/zsh/manjaro-zsh-prompt
# fi

# use p10k
() {
  emulate -L zsh

  source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
  # source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

  # Determine terminal capabilities.
  {
    if ! zmodload zsh/langinfo zsh/terminfo ||
       [[ $langinfo[CODESET] != (utf|UTF)(-|)8 || $TERM == (dumb|linux) ]] ||
       (( terminfo[colors] < 256 )); then
      # Don't use the powerline config. It won't work on this terminal.
      local USE_POWERLINE=false
      # Define alias `x` if our parent process is `login`.
      local parent
      if { parent=$(</proc/$PPID/comm) } && [[ ${parent:t} == login ]]; then
        alias x='startx ~/.xinitrc'
      fi
    fi
  } 2>/dev/null

  if [[ $USE_POWERLINE == false ]]; then
    # Use 8 colors and ASCII.
    source /usr/share/zsh/p10k-portable.zsh
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=black,bold'
  else
    # Use 256 colors and UNICODE.
    source /usr/share/zsh/p10k.zsh
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244'
  fi
}

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/yev/.oh-my-zsh"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-vim-mode)
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# export NODE_PATH=$(npm root -g)

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

eval "$(register-python-argcomplete pipx)"

export KEYTIMEOUT=1

alias vim='nvim'
alias n='nvim'
alias np='nvim --headless "+Lazy sync" +qa'
alias vimdiff='nvim -d'

alias wgu='wg-quick up wg0'
alias wgd='wg-quick down wg0'
alias myip='curl ifconfig.me'

alias mux='tmuxinator'
alias tx='tmuxinator'
alias ts='tmuxinator start'
alias tn='tmuxinator new'
alias ta='tmux a'
alias tk='tmux kill-session -t'
alias tka='tmux kill-server'

alias c='clear'
alias psv='source venv/bin/activate'

alias al='lsd -alh'
alias la='lsd -alh'
alias ld='lazydocker'
alias lg='lazygit'
alias lm='lazynpm'
alias pm='pnpm'

alias yc='yarn clean'
alias ys='yarn start'
alias ysv='yarn serve'
alias yw='yarn watch'
alias yb='yarn build'
alias yd='yarn dev'

alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias lgd='lazygit -g $HOME/.dotfiles -w $HOME'

alias p='pass'
alias psync='pass git pull && pass git push'

alias luamake=/home/yev/.cache/nvim/lspconfig/sumneko_lua/lua-language-server/3rd/luamake/luamake

# sdkman
# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/yev/.sdkman"
[[ -s "/home/yev/.sdkman/bin/sdkman-init.sh" ]] && source "/home/yev/.sdkman/bin/sdkman-init.sh"

# kitty
# BEGIN_KITTY_SHELL_INTEGRATION
if test -e "/home/yev/apps/kitty/shell-integration/kitty.zsh"; then source "/home/yev/apps/kitty/shell-integration/kitty.zsh"; fi
# END_KITTY_SHELL_INTEGRATION

# cursor stuff
# bindkey -v
# # Change cursor with support for inside/outside tmux
# function _set_cursor() {
#     if [[ $TMUX = '' ]]; then
#       echo -ne $1
#     else
#       echo -ne "\ePtmux;\e\e$1\e\\"
#     fi
# }
# # 1 or 0 -> blinking block
# # 2 -> solid block
# # 3 -> blinking underscore
# # 4 -> solid underscore
# # 5 -> blinking vertical bar
# # 6 -> solid vertical bar
# function _set_block_cursor() { _set_cursor '\e[2 q' }
# function _set_beam_cursor() { _set_cursor '\e[3 q' }
# function zle-keymap-select {
#   if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
#       _set_block_cursor
#   else
#       _set_beam_cursor
#   fi
# }
# zle -N zle-keymap-select
# # ensure beam cursor when starting new terminal
# precmd_functions+=(_set_beam_cursor) #
# # ensure insert mode and beam cursor when exiting vim
# zle-line-init() { zle -K viins; _set_beam_cursor }

# direnv
eval "$(direnv hook zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
