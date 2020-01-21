"Automatic vimrc changes push
function! pwd()
	let result = system('pwd')
	echo "Current dir " . result
endfunction
