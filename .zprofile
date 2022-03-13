export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

export PYENV_ROOT="$HOME/.pyenv"

path=("$HOME/.yarn/bin" "$HOME/.pyenv/bin" "$HOME/.poetry/bin" "$HOME/bin" $path)

export PATH

export VENVS="$HOME/.venvs"
export NVM_DIR="$HOME/.nvm"
export EDITOR="/usr/local/bin/nvim"
export SYSTEMD_EDITOR="/usr/local/bin/nvim"
export KITTY_CONF="$HOME/.config/kitty/kitty.conf"

# test wayland
export QT_QPA_PLATFORM=wayland

# xset r rate 285 42
# this is working
# gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 20
# gsettings set org.gnome.desktop.peripherals.keyboard delay 230

source $HOME/.sbl
