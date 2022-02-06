export PYENV_ROOT="$HOME/.pyenv"

path=("$HOME/.yarn/bin" "$PYENV_ROOT/bin" "$HOME/.poetry/bin" "$HOME/bin" $path)

export PATH

export VENVS="$HOME/.venvs"
export NVM_DIR="$HOME/.nvm"
export EDITOR="/usr/local/bin/nvim"
export SYSTEMD_EDITOR="/usr/local/bin/nvim"
export KITTY_CONF="$HOME/.config/kitty/kitty.conf"

# test wayland
export QT_QPA_PLATFORM=wayland

# xset r rate 285 42
# gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 22                                                                                                                   <<<
# gsettings set org.gnome.desktop.peripherals.keyboard delay 245

source $HOME/.sbl
