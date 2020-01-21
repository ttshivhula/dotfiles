#!/bin/bash
wdir="~/.vim/bundle/dotfiles"
wdir="${wdir/#\~/$HOME}"
cd $wdir
repo="vim/vimrc"
local="~/.vimrc"
local="${local/#\~/$HOME}"

#Get Git branch name
branch_name="$(git symbolic-ref HEAD 2>/dev/null)" ||
branch_name="(unnamed branch)"     # detached HEAD
branch_name=${branch_name##refs/heads/}

#Get Current Date
date +'FORMAT'
date +'%m/%d/%Y'
date +'%r'
date=$(date +'%m/%d/%Y')

#Random number for unique commits
unique=$((1000 + RANDOM % 9999))

#Pull latest changes
git pull origin "$branch_name"

#Copy local vim config to repo
if cmp -s "$local" "$repo"; then
    printf 'The file "%s" is the same as "%s"\n' "$local" "$repo"
else 
    printf 'Files differ copying your vimrc to "%s"\n' "$repo"
    cp $local $repo 
    printf 'Repo: "%s"\n', $repo
    git add $repo 
    git commit -m "Automatic local vimrc push. ${date} ${unique}"
fi

#Push changes
git push origin "$branch_name"
