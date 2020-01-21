"Automatic vimrc changes push
function! Pwd()
	let result = system('pwd')
	echo "Current dir " . result
endfunction
