if !has('python')
    echo "Y U has no +python!??"
    finish
endif
let s:scriptfile=expand("<sfile>") 

function! CopyToClipboard()

    "pyfile ~/.vim/plugin/Get-Git-URL-Vim/plugin/geturl.py
    execute "pyfile ".fnameescape(fnamemodify(s:scriptfile, ":h")."/geturl.py") 
endfunction

command! GGU call CopyToClipboard()


