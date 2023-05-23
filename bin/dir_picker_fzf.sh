#!/usr/bin/env sh

# topics=`echo "home work plugins nvim-dev" | tr ' ' '\n'`
# selection=`echo "$topics" | fzf`

# # work
# find -L ~/dev/sbl/ -maxdepth 2 -type d -print > /tmp/pick_dirs
# # .local
# find -L ~/.local/ -maxdepth 2 -type d -print >> /tmp/pick_dirs
# # home
# find -P ~/ -mindepth 1 -maxdepth 2 -type d -print >> /tmp/pick_dirs
# # plugins
# find -L ~/.local/share/nvim/lazy/ -maxdepth 1 -type d -print >> /tmp/pick_dirs
# # dev-plugins
# find -L ~/dev/nvim/plugins -maxdepth 1 -type d -print >> /tmp/pick_dirs

# selection=`cat /tmp/pick_dirs | fzf --preview 'tree -C {}' | sed 's#/$##'`
selection=`~/bin/tmux-repoizer | fzf --preview 'tree -C {}' | sed 's#/$##'`

if [ -z "${selection}" ]; then
    return
fi

tmux neww -c $selection -n $(realpath --relative-to="$(realpath $selection/../../)" "$selection" | sed -r 's#^(.?.?.?.?).*/#\1/#')
#
# selection=`cat /tmp/pick_dirs | fzf --preview 'tree -C {}' --print0 | xargs -0 -I{} echo {} | sed 's#/$##'`
# xargs -0 -I {} tmux neww -c {} -n $(echo {})
#$(realpath --relative-to={}../../ {})
