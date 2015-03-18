#!/usr/bin/python
import os,re

def srcDestPair(src,dest):
    if(re.search(re.compile("/$"),dest)):
        dest = os.path.join(dest,os.path.basename(src))
    return({'src':src, 'dest':dest})

home = os.path.expanduser("~/")
srcDir = os.path.join(home,"systemConfig","dotFiles")
destDir = home
dotFiles = [".bash_profile",
            ".bashrc",
            ".emacs",
            ".dircolors",
            ".xbindkeysrc",
            ".Xresources",
            ".gitconfig",
            ".gitignore_global",
            ".toprc"]
dotFiles = [ srcDestPair(os.path.join(srcDir,f),destDir) for f in dotFiles]

if __name__ == "__main__":
    if os.path.isdir(srcDir) :
        for f in dotFiles:
            print f
            if os.path.islink(f['dest']):
                os.unlink(f['dest'])
            os.symlink(f['src'],f['dest'])
    else:
        print "Source directory \""+srcDir+"\" does not exist."
        exit(1)

    exit(0)
        
