#!/usr/bin/env sh

topics=`echo "tmux lua golang vuejs cpp python javascript typescript nodejs rust" | tr ' ' '\n'`
selection=`echo "$topics" | fzf`
read -p "query: " query

tmux neww zsh -c "curl -s cht.sh/$selection/$(echo $query | tr ' ' '+') | bat --paging=always --style=plain"
