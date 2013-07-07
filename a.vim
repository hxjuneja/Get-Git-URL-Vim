if !has('python')
    echo "Y U has no +python!??"
    finish
endif


function! CopyToClipboard()
    py << EOF

import vim, os, pygtk
pygtk.require('2.0')
import gtk, subprocess

#get the clipboard 
clipboard = gtk.clipboard_get()

# evaluate a vim expression and save its value to a variable
path = vim.eval('expand("%:p") . ":" . line(".")')

#logic to get the git directories

p1 = subprocess.Popen(['find', '/', '-type', 'd', '-name', '.git'], stdout=subprocess.PIPE)
p2 = subprocess.Popen(['xargs', '-n', '1', 'dirname'],stdin = p1.stdout, stdout=subprocess.PIPE)
p1.stdout.close()
output = p2.communicate()

dirs = output[0].split("\n")

#for i in dirs:
    


#read the clipboard text data
#text = clipboard.wait_for_text()

print "pasted to keyboard!!"


# copy the string to the clipboard
clipboard.set_text(path)
clipboard.store()

#os.system("echo '%s' | pbcopy" % path_line)


# do additional stuff with path_line here

EOF
endfunction

command! GETURL call CopyToClipboard()


