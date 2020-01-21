"Automatic vimrc changes push

let s:current_file=expand('<sfile>')
function! PushVimrc()
:normal :au CursorHold * redraw!
echo "Saving vimrc please wait..."
let s:current_file = substitute(s:current_file, "plugin/dotfiles.vim", "publish.sh", "")
let result = system(s:current_file)
:normal :au CursorHold * redraw!
echo "Saved your vimrc"
endfunction

autocmd BufWritePost *.vimrc call PushVimrc()
