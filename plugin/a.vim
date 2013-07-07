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
path = vim.eval('expand("%:p") . "#L" . line(".")')

#logic to get the git directories

dicpath = path.split('/')[1:]

repoin = dicpath[0]

print "generating URL . . "

p1 = subprocess.Popen(['find', "/"+repoin, '-type', 'd', '-name', '.git'], stdout=subprocess.PIPE)
p2 = subprocess.Popen(['xargs', '-n', '1', 'dirname'],stdin = p1.stdout, stdout=subprocess.PIPE)
p1.stdout.close()
output = p2.communicate()

dirs = output[0].split("\n")
sorted_dict = []

for i in dirs:
    for m,n in zip(i.split("/")[1:],dicpath):
        if m != n:
            i = []
    sorted_dict.append(i)

maxlength = max(s for s in sorted_dict)


import itertools

b = []

lleng = maxlength.split('/')[1:]

for i,j in itertools.izip_longest(dicpath,lleng):
    if j is not None:
        continue
    else:
        b.append(i)

#TODO : get branch info

URL = ["http:/","github","hardikj",lleng[len(lleng)-1],"blob","master"]

print URL

for i in b:
    URL.append(i)

URL = "/".join(URL)

#read the clipboard text data
#text = clipboard.wait_for_text()

print "dude!! check your clipboard"

# copy the string to the clipboard
clipboard.set_text(URL)
clipboard.store()



EOF
endfunction

command! GETURL call CopyToClipboard()


