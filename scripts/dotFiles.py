#!/usr/bin/python3
import os,re

def appFile(files,src,dest):
    if(re.search(re.compile("/$"),dest)):
        dest = os.path.join(dest,os.path.basename(src))
    files.append({'src':src, 'dest':dest})

home = os.path.expanduser("~/")
srcDir = os.path.join(home,"dotFiles")
destDir = home
dotFiles = []
appFile(dotFiles,os.path.join(srcDir,".bash_profile"),destDir)
appFile(dotFiles,os.path.join(srcDir,".bashrc"),destDir)
appFile(dotFiles,os.path.join(srcDir,".emacs"),destDir)

if __name__ == "__main__":
    print(os.path.isdir(srcDir))
    if os.path.isdir(srcDir) :
        for f in dotFiles:
            os.symlink(f['src'],f['dest'])
    else:
        print("Source directory \""+srcDir+"\" does not exist.")
        exit(1)

    exit(0)
        
