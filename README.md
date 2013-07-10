## About


Get Git Url (GGU) is a [Vim] plugin that generate a GitHub repo URL for you from your editor itself.

## Usage


GGU helps you share the code in your remote repo (GitHub) from your local repo,
So there's no need to search for your code and the line no in GitHub and then paste the URL to share it
You can do all this very easily from your editor.

Here's how

1. Go to the file and line no using Vim.

2. enter `:GGU`

3. Boom! you are free to paste the URL.


##  Quick Start

1. Setup GGU:

  ```
  cd ~/.vim/plugin/
  git clone https://github.com/hardikj/Get-Git-URL-Vim.git 
  ```

2. Configure GGU:

  Before you can start you need to edit config.py.

  ```
  cd ~/.vim/plugins/Get-Git-URL-Vim/plugin/config.py

  ```
  
  In this file add the following
  
  ```
   def __init__(self):
   
        " Your Github Username
        self.username = "hardikj"
        
        " Your Shell(sudo) Password
        self.pw = ""  
        
  ```

Thats It!! Enjoy.

## FAQ

Q. How can I change the vim command?

Ans. Just replace the command in last line in run.py

    ` command! GGU call CopyToClipboard() `
    
Q. What if I run the command on a file which is not on my github?

Ans. It will still give you a URL but that won't point you to any repo (I will soon add a error for this.)

Q. It is not generating the URL to I want?

Ans. Glad you asked, can you please report it as a issue in github or contact me or maybe find me hanging around at KFC.

Q. Do you support any other editor?

Ans. Yes, A plugin for [Sublime Text 2] will be out soon




