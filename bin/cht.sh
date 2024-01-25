#!/usr/bin/env sh

topics=$(echo "rust lua javascript typescript nodejs golang vuejs cpp python tmux" | tr ' ' '\n')
selection=$(echo "$topics" | fzf)
read -r -p "query: " query

# tmux neww zsh -c "curl -s cht.sh/$selection/$(echo $query | tr ' ' '+') | bat --paging=always --style=plain"
curl -s cht.sh/"$selection"/"$(echo "$query" | tr ' ' '+')" | bat --paging=always --style=plain
