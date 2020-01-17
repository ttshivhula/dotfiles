FILE=~/.tmux/plugins/tpm
if [ -d "$FILE" ]; then
    cp tmux.conf ~/.tmux.conf
    tmux source ~/.tmux.conf
else 
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
