if !has('python')
    echo "Y U has no +python!??"
    finish
endif
let s:scriptfile=expand("<sfile>") 
"execute "pyfile ".fnameescape(fnamemodify(expand("<sfile>"), ":h")."/geturl.py") 

function! CopyToClipboard()

    "pyfile ~/.vim/plugin/Get-Git-URL/plugin/geturl.py
    execute "pyfile ".fnameescape(fnamemodify(s:scriptfile, ":h")."/geturl.py") 
endfunction

command! GGU call CopyToClipboard()


