FILE=~/.vim/bundle/Vundle.vim
if [ -d "$FILE" ]; then
    cp vimrc ~/.vimrc
    vim +PluginUpdate +qall
else 
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    cp vimrc ~/.vimrc
    vim +PluginInstall +qall
fi
