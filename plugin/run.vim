if !has('python')
    echo "Y U has no +python!??"
    finish
endif


:function! CopyToClipboard()

     pyfile geturl.py

endfunction

command! GGU call CopyToClipboard()


