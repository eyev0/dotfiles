export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

export PYENV_ROOT="$HOME/.pyenv"

path=("$HOME/.emacs.d/bin" "$HOME/go/bin" "$HOME/.yarn/bin" "$HOME/.pyenv/bin" "$HOME/.poetry/bin" "$HOME/bin" $path)

export PATH

export VENVS="$HOME/.venvs"
export NVM_DIR="$HOME/.nvm"

export EDITOR="/usr/local/bin/nvim"
export SYSTEMD_EDITOR="/usr/local/bin/nvim"
# Use nvim as manpager `:h Man`
export MANPAGER='nvim +Man'
export MANWIDTH=999

export KITTY_CONF="$HOME/.config/kitty/kitty.conf"

# wayland
export QT_QPA_PLATFORM=wayland
export MOZ_ENABLE_WAYLAND=1
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1

# export BEMENU_BACKEND='wayland'
# export CLUTTER_BACKEND='wayland'
# export ECORE_EVAS_ENGINE='wayland_egl'
# export ELM_ENGINE='wayland_egl'
# export GDK_BACKEND='wayland'
# export MOZ_ENABLE_WAYLAND=1
# export QT_AUTO_SCREEN_SCALE_FACTOR=0
# export QT_QPA_PLATFORM='wayland-egl'
# export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
# export SAL_USE_VCLPLUGIN='gtk3'
# export SDL_VIDEODRIVER='wayland'
# export _JAVA_AWT_WM_NONREPARENTING=1

# xset r rate 285 42
# this is working
# gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 20
# gsettings set org.gnome.desktop.peripherals.keyboard delay 230

source $HOME/.sbl
source $HOME/.openai
