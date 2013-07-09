import itertools
import vim, os, pygtk
pygtk.require('2.0')
import gtk, subprocess
import vim, os, random


class Path(object):
    """
    Class to get the path of the file with the line number
    """
    def __init__(self):
        pass

    def get_vim_path(self):

        # evaluate a vim expression and save its value to a variable
        path = vim.eval('expand("%:p") . "#L" . line(".")')
        dicpath = path.split('/')[1:]
        return (path,dicpath)


class MakeURL(object):
    """
        This class generate the URL and copy it to clipboard
    """
    def __init__(self):

        self.dicpath = None
        self.path =  None

    def getrepo(self):
        """
            get the git repositories
        """

        self.path, self.dicpath = Path().get_vim_path()

        repoin = self.dicpath[0]

        p1 = subprocess.Popen(['find', "/"+repoin, '-type', 'd', '-name', '.git'], stdout=subprocess.PIPE)
        p2 = subprocess.Popen(['xargs', '-n', '1', 'dirname'],stdin = p1.stdout, stdout=subprocess.PIPE)
        p1.stdout.close()
        output = p2.communicate()
    
        dirs = output[0].split("\n")
        
        sorted_dict = []

        for i in dirs:
            for m,n in zip(i.split("/")[1:],self.dicpath):
                if m != n:
                    i = []
            sorted_dict.append(i)

        return sorted_dict

    def geturl (self):
        """
            generate the url
        """
        dirs = self.getrepo()
        maxlength = max(s for s in dirs)

        b = []

        lleng = maxlength.split('/')[1:]

        self.pstatus()

        for i,j in itertools.izip_longest(self.dicpath,lleng):
            if j is not None:
                continue
            else:
                b.append(i)

        branch = self.get_branch(maxlength)
        #user = config.get_user()

        URL = ["http:/","github.com","hardikj",lleng[len(lleng)-1],"blob",branch]  

        for i in b:
             URL.append(i)

        URL = "/".join(URL)

        return URL

    def get_branch(self,ml):
        """
            get current branch of the required repo
        """
        os.chdir(ml)
        p1 = subprocess.Popen(["git","branch"], stdout=subprocess.PIPE)
        output = p1.communicate()
        branch = None
        
        output = output[0].split("\n")
        for i in output:
            b = i.strip().split(" ")
            for j in b:
                if j == "*":
                    branch = max(b)
                    break

        return branch
 
    def pstatus(self):
    
        status = ["what the fuck are you waiting for, check your clipboard!!", "You are free to Paste the URL!!", "Guess What? you can now paste the url",
                  "Why dont you paste the URL??", "your work is done", "URL copied to clipboard!!" ]
        s = random.randint(0,5)
        print status[s]
 
    def PasteIt(self):

        url = self.geturl()

        clipboard = gtk.clipboard_get()

        # copy the string to the clipboard
        clipboard.set_text(url)
        clipboard.store()


def main():

    URL = MakeURL().PasteIt()    

if __name__ == '__main__':
    main()
