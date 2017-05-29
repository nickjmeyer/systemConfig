#!/usr/bin/python
import os,re,sys

home = os.path.expanduser("~/")
srcDir = os.path.join(home,"systemConfig","dotFiles")
destDir = home
if sys.platform == "darwin":
    dotFiles = [(".bashrc_osx", ".bashrc"),
                (".bash_profile_osx",".bash_profile"),
                ".dircolors",
                ".gitconfig",
                ".gitignore_global"]
elif sys.platform == "linux" or sys.platform == "linux2":
    dotFiles = [(".bash_profile_ubuntu",".bash_profile"),
                ".profile",
                (".bashrc_ubuntu", ".bashrc"),
                ".dircolors",
                ".Xresources",
                ".gitconfig",
                ".gitignore_global",
                ".toprc"]
else:
    print "Invalid platform name: %s" % sys.platform
    exit(1)


srcDestPairs = []
for df in dotFiles:
    if isinstance(df, tuple):
        srcName = df[0]
        destName = df[1]
    else:
        srcName = destName = df

    srcName = os.path.join(srcDir, srcName)
    destName = os.path.join(home, destName)

    print "Installing: ", os.path.basename(srcName)
    print "To: ",os.path.basename(destName)

    if os.path.islink(destName):
        print "removing existing link"
        os.unlink(destName)
    elif os.path.isfile(destName):
        print "file exists"
        ind = 1
        moveDestName = destName + ".old"
        print "trying", moveDestName
        while os.path.isfile(moveDestName) or os.path.islink(moveDestName):
            moveDestName = destName + "." + str(ind) + ".old"
            print "trying", moveDestName

        print "copying", destName, "to", moveDestName
        os.rename(destName, moveDestName)

    os.symlink(srcName, destName)
