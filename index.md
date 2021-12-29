---
title: The basics of working on the UNIX command line
layout: default
author: Christopher Paciorek
---


# 1 Introduction

## 1.1 This Tutorial

This tutorial covers the basics of navigating in a UNIX-like (e.g., Linux or Mac OS X) environment. In particular, it covers using the UNIX command line interface, a powerful way to carry out operations on a computer and to automate tasks.  Being familiar with operating on the command line will allow you (with some practice and training) to do things more quickly and in a way that can be reproduced later. That's hard or impossible to do if you are doing point-and-click or drag-and-drop operations in a File Manager or Finder window.

Materials for this tutorial, including the Markdown file that was used to create this document are [available on GitHub](https://github.com/berkeley-scf/tutorial-unix-basics).

Software Carpentry has a very nice introductory lesson on the [basics of the shell](https://swcarpentry.github.io/shell-novice/). It also has an accompanying [YouTube video](https://www.youtube.com/watch?v=8c1BL5b47kg). Episodes 1-3 (the first 20 minutes) cover the material that is in this tutorial.

This tutorial by Christopher Paciorek is licensed under a Creative Commons Attribution 3.0 Unported License.

<!--
Determine output under the scflocal account on gandalf
-->

## 1.2 The shell

Operating on the UNIX command line is also known as "using the terminal" and "using the shell".

The shell is the UNIX program that you interact with when in a terminal window interacting with a UNIX-style operating system (e.g., Linux or MacOS). The shell sits between you and the operating system and provides useful commands and functionality. Basically, the shell is a program that serves to run other commands for you and show you the results. There are actually different shells that you can use, of which `bash` is very common and is the default on many systems. In recent versions of MacOS, `zsh` is the default shell.

I've generated this document based on using the bash shell on a computer running the Ubuntu Linux version 20.04 operating system, but you should be able to replicate most of the steps in this tutorial in other UNIX command line environments, ideally using the bash or zsh shells. 

## 1.3 Accessing a UNIX command line interface

Here are some options for accessing a UNIX command line interface:

  - MacOS: If you'd like to work on your own Mac, you'll find the Terminal under
      `Applications -> Utilities -> Terminal`.
  - Windows:
      - If you have a sufficiently new version of Windows 10, you can use the [Windows Subsystem for Linux](https://msdn.microsoft.com/en-us/commandline/wsl/install_guide), which will provide you with an Ubuntu shell running bash on your own machine.
      - If you have access to remote machines running Linux, you can login to them using programs such as MobaXTerm and Putty. Once logged in, you'll find yourself in a Terminal window on the remote machine.
  - JupyterHub: If you have access to a JupyterHub, you will likely be able to start a Terminal session under "New".
  - Cloud-based options: You could also try a cloud service such as Google [Cloud Shell](https://shell.cloud.google.com).

Note that you probably shouldn't use `Git Bash` as its functionality is limited. 

Once you're in a Terminal window, you'll be interacting with the shell and you can enter commands to get information and work with the system. Commands often have optional arguments (flags) that are specified with a minus in front of them, as we'll see. 

## 1.4 Getting started

Once we are in a terminal, we'll see the "prompt", which indicates that the shell is waiting for us to enter commands. Sometimes the prompt is just `$`:

```
$
```

but often it contains information about the username of the current user and the directory on the filesystem that we are in. For example, here a prompt that shows that the current user is 'scflocal', on the machine named 'gandalf' in the 'stat243-fall-2020' (sub)directory in the user's home directory (indicated by `~`).

```
scflocal@gandalf:~/stat243-fall-2020>
```

In the remainder of this tutorial, we'll show the default `$` prompt in front of commands to distinguish between commands and output that gets printed to the screen. If you're copying and pasting, you'll need to omit the `$`.

Note that if you see `>` instead of the usual prompt, that means the shell thinks you haven't finished entering your command and is expecting more input from you. If you're not sure what to do, type `<Ctrl-c>` (the control key and 'c' at the same time) to get back to the usual prompt.

Let's start by running a command, `whoami`, that prints out the username of the current user:
```bash
$ whoami
```

```
scflocal
```


# 2 Using `git` for version control

We'll discuss `git` briefly, both because it is an important and useful tool, and because it's the easiest way for us to get a set of files to work with in this tutorial. 

Git is an important tool to become familiar with, at least at the basic level. Git allows you to share files between different computers and different people and for people to collaborate on projects together. In particular, it is a version control tool that allows you to have different versions of your files and to go back to earlier versions of your files. Git stores the files for a project in a *repository*. 

For our purposes here, we'll simply use Git to download materials from GitHub, a website that stores Git repositories in the cloud. 

First we'll download the materials for this tutorial.

To *clone* (i.e., copy) a repository (in this case from GitHub) we do the following. Note that *berkeley-scf* is the "organization" and *tutorial-unix-basics* is the repository. Note that everything below that follows the `#` symbol is a comment and not executed.

Here we'll first use the `cd` command to go to our home directory and then use `git clone` to download materials to a subdirectory (which will be called `tutorial-unix-basics`) within our home directory. 

```bash
$ cd
$ git clone https://github.com/berkeley-scf/tutorial-unix-basics
```

```
Cloning into 'tutorial-unix-basics'...
remote: Enumerating objects: 186, done.
remote: Counting objects: 100% (9/9), done.
remote: Compressing objects: 100% (7/7), done.
remote: Total 186 (delta 3), reused 6 (delta 2), pack-reused 177
Receiving objects: 100% (186/186), 356.38 KiB | 1.12 MiB/s, done.
Resolving deltas: 100% (112/112), done.
```

When you run `git clone` you'll see some text indicating the progress of the cloning.

Next let's clone a more extensive repository - we'll get the materials for my Statistics 243 class at UC Berkeley from Fall 2020. 

```
$ git clone https://github.com/berkeley-stat243/stat243-fall-2020
```

```
Cloning into 'stat243-fall-2020'...
remote: Enumerating objects: 974, done.
remote: Counting objects: 100% (35/35), done.
remote: Compressing objects: 100% (28/28), done.
remote: Total 974 (delta 12), reused 26 (delta 7), pack-reused 939
Receiving objects: 100% (974/974), 20.55 MiB | 21.65 MiB/s, done.
Resolving deltas: 100% (520/520), done.
```

Now suppose that whoever controls the repository makes some changes to the materials in the repository and you want an updated copy of the repository on your computer. Simply `cd` (for "change directory") into any directory in the repository and run `git pull`.

```bash
$ cd stat243-fall-2020
$ git pull
```

```
Already up to date.
```

In this case, since no changes had been made, git simply reports that things are up-to-date.

We'll discuss how to use `cd` in more detail in the next section.

# 3 Files and directories

## 3.1 Moving around and listing information

We'll start by thinking about the filesystem, which organizes our information/data into files on the computer's disk.

Anytime you are at the UNIX command line, you have a *working directory*, which is your current location in the file system. 

Here's how you can see where you are using the "print working directory" command:

```bash
$ pwd
```

```
/home/scflocal/stat243-fall-2020
```

and here's how you list the files in the working directory...

```bash
$ ls
```

```
data  howtos  project  ps  README.md  sections  syllabus.lyx  syllabus.pdf  units
```

Now suppose I want to be in a different directory so I can see what is there or do things to the files in that directory.

The command you need is `cd` and an important concept you need to become familiar with is the notion of relative and absolute *path*. A path is the set of nested directories that specify a subdirectory of interest.

First let's go to our home directory, which is generally where our files will be. Simply running `cd` will do that.

```bash
$ cd
$ pwd
```

```
/home/scflocal
```

Now let's go into a subdirectory. We can use `cd` with the name of the subdirectory. The subdirectory is found 'relative' to our working directory, i.e., found from where we currently are.

```bash
$ cd stat243-fall-2020 
$ pwd
```

```
/home/scflocal/stat243-fall-2020
```

We could also navigate through nested subdirectories. For example, after going back to our home directory, let's go to the `units` subdirectory of the `stat243-fall-2020` subdirectory. The `/` is a separate character that distinguishes the nested subdirectories.

```bash
$ cd
$ cd stat243-fall-2020/units
$ pwd
```

```
/home/scflocal/stat243-fall-2020/units
```

You can access the parent directory of any directory using `..`:

```bash
$ cd ..
$ pwd
```

```
/home/scflocal/stat243-fall-2020
```

We can combine `..` with use of relative paths. Here we'll go up a directory and the down to a different subdirectory.

```bash
$ cd units
$ cd ../data 
$ pwd
```

```
/home/scflocal/stat243-fall-2020/data
```

And here we'll go up two directories and then down to another subdirectory.

```bash
$ cd ../../tutorial-unix-basics  # go up two directories and down
$ pwd
```

```
/home/scflocal/tutorial-unix-basics
```

All of the above examples used relative paths to navigate based on your working directory at the moment you ran the command.

We can instead use absolute paths so that it doesn't matter where we are when we run the command. Specifying an absolute path is done by having your path start with `/`, such as `/home/scflocal`. If the path doesn't start with `/` then it is interpreted as being a relative path, relative to your working directory. Here we'll go to the `units` subdirectory but using an absolute path. 

```bash
$ cd /home/scflocal/stat243-fall-2020/units 
$ pwd
```

```
/home/scflocal/stat243-fall-2020/units
```

Note that using absolute paths in scripts is generally a bad idea because the script wouldn't generally work correctly if run on a different machine (which will generally have a different filesystem structure).

## 3.2 The filesystem

The filesystem is basically a upside-down tree.

For example, if we just consider the `stat243-fall-2020/sections` directory, we can see the tree structure using `tree`:

```bash
$ cd /home/scflocal/stat243-fall-2020/sections
$ tree
```

Often (as is the case here), that would print out a lot of files and directories, so I'll just print out the first few lines of the result here:

```
.
├── 01
│   ├── data
│   │   ├── cpds.csv
│   │   ├── heights.dta
│   │   └── stateIncome.txt
│   ├── README.md
│   ├── R-practice.pdf
│   └── solutions
│       ├── R-practice-solutions.html
│       ├── R-practice-solutions.Rmd
│       ├── UNIX-practice-solutions.html
│       └── UNIX-practice-solutions.Rmd
├── 02
│   ├── example_sweave.pdf
│   ├── example_sweave.Rnw
│   ├── intro_git_knitr.pdf
│   └── intro_git_knitr.Rmd
```

The dot (`.`) means "this directory", so the top of the tree here is the `sections` directory itself, within which there are subdirectories, `01`, `02`, `03`, etc. Then within each of these are files and further subdirectories (as seen in the case of `01`, which has subdirectories named `data` and `solutions`.)

If we consider the entire filesystem, the top, or root of the tree, is the `/` directory. Within `/` there are subdirectories, such as `/home` (which contains users' home directories where all of the files owned by a user are stored) and `/bin` (containing UNIX programs, aka 'binaries'). If there is a user named *scflocal*, everything specific to that user would be stored in `/home/scflocal`. The shortcut `~scflocal` refers to `/home/scflocal`. If you are the *scflocal* user, you can also refer to `/home/scflocal` by the shortcut `~`.


```bash
$ ls /
```

```
accounts  bin   dev  home  lib32  libx32      media   mnt  proc  run   scratch  snap  sys     tmp  var
app       boot  etc  lib   lib64  lost+found  mirror  opt  root  sbin  server   srv   system  usr
```

```bash
$ ls /home
```

```bash
$ cd /home/scflocal
$ pwd
```

```
scflocal  shiny
```

Go to the home directory of the current user (which happens to be the `scflocal` user):


```bash
$ cd ~
$ pwd
```

```
/home/scflocal
```

Go to the home directory of the scflocal user explicitly:

```bash
$ cd ~scflocal
$ pwd
```

```
/home/scflocal
```

Another useful directory is `/tmp`, which is a good place to put temporary files that you only need briefly and don't need to save. These will disappear when a machine is rebooted. 

```bash
$ cd /tmp
$ ls
```

```
tmp.txt
```


We can return to the most recent directory we were in like this:

```bash
$ cd -
$ pwd
```

```
/home/scflocal
```

# 4 Using commands

## 4.1 Overview

Let's look more at various ways to use commands. We just saw the `ls` command. Here's one way we can modify the behavior of the command by passing a command option. Here the `-F` option (also called a 'flag') shows directories by appending `/` to anything that is a directory (rather than a file) and a `*` to anything that is an executable (i.e., a program).

```bash
$ cd stat243-fall-2020
$ ls -F
```

```
data/  howtos/  project/  ps/  README.md  sections/  syllabus.lyx  syllabus.pdf  units/
```


Next we'll use multiple options to the `ls` command. `-l` shows extended information about files/directories. `-t` shows files/directories in order of the time at which they were last modified and `-r` shows in reverse order. Before run `ls`, I'll create an empty file using the `touch` command. Given this, what file do you expect to be displayed last when you do the following?

```bash
$ cd ../tutorial-unix-basics
$ touch myfile
$ ls -lrt
```

```
total 144
-rw-rw-r-- 1 scflocal scflocal  1290 Dec 28 13:06 README.md
-rw-rw-r-- 1 scflocal scflocal 29702 Dec 28 13:09 unix-basics.Rmd
drwxrwxr-x 9 scflocal scflocal  4096 Dec 28 13:09 stat243-fall-2020
-rw------- 1 scflocal scflocal    22 Dec 28 13:09 tmp.txt
-rw-rw-r-- 1 scflocal scflocal     6 Dec 28 13:09 hello.pdf
-rw-rw-r-- 1 scflocal scflocal 41079 Dec 28 13:09 unix-basics.md
-rw-rw-r-- 1 scflocal scflocal 49482 Dec 28 13:09 unix-basics.html
-rw-rw-r-- 1 scflocal scflocal     0 Dec 28 13:32 myfile
```

While each command has its own syntax, there are some rules usually
followed. Generally, executing a command consists of four things: the command,
command option(s), argument(s), and line acceptance, as in this example:

```bash
$ wc -l example.txt
```

```
4 example.txt
```

In the above example, `wc` is the command, `-l` is a command option
specifying to count the number of lines, `example.txt` is the argument, and the
line acceptance is indicated by hitting the `Enter` key at the end of
the line.

So that invocation counts the number of lines in the file named example.txt.

The spaces are required and distinguish the different parts of the invocation. For this reason,
it's generally a bad idea to have spaces within file names. But if you do, you can
use quotation marks to demark the file name, e.g.,

```bash
$ ls -l "name of my file with spaces.txt"
```

Also, capitalization matters. For example `-l` and `-L` are different options.

Note that options, arguments, or both might not be included in some cases. Recall that we've used `ls`
without either options or arguments.

Arguments are usually one or more files or directories.

## 4.2 Options

Often we can specify an option either in short form (as with `-l` here)
or long form (`--lines` here), as seen in the following equivalent invocations:

```bash
$ wc -l example.txt
$ wc --lines example.txt
```
```
4 example.txt
```


We can also ask for the number of characters with the `-m` option, which can
be combined with the `-l` option equivalently in two ways:

```bash
$ wc -lm example.txt
$ wc -l -m example.txt
```

```
 4 51 example.txt
```


Options will often take values, e.g., if we want to get the first two lines of the file,
the following invocations are equivalent:

```bash
$ head -n 2 example.txt
$ head --lines=2 example.txt
$ head --lines 2 example.txt
```

```
Hello there.
This is a file
```

## 4.3 Comments

Anything that follows `#` is a comment and is ignored.

```bash
$ # This is ignored
$ ls  # Everything after the # is ignored
```
```
example.txt  myfile  README.md  stat243-fall-2020  tmp.txt  unix-basics.html  unix-basics.md  unix-basics.Rmd
```


## 4.4 Getting help with UNIX commands

Essentially all UNIX commands have  help information (called a man page), accessed using `man`.

```bash
$ man ls
```

Once you are in the man page, you can navigate by hitting the space bar (to scroll down) and the up and down arrows. You can search by typing `/`, typing the string you want to search for and hitting return. You can use `n` and `p` for the next and previous search hits and `q` to quit out of the search.

Unfortunately man pages are often quite long, hard to understand, and without examples. But the information you need is usually there if you take the time to look for it.

Also, UNIX commands as well as other programs run from the command line often provide help information via the `--help` option:

```bash
$ ls --help
```

## 4.5 Seeing if a command or program is available

You can see if a command or program is installed (and where it is installed) using `which`.

```bash
$ which grep
$ which R
$ which python
```

```
/usr/bin/grep
/usr/bin/R
/usr/local/linux/anaconda3.8/bin/python
```

# 5 Working with files

## 5.1 Copying and removing files

You'll often want to make a copy of a file, move it between directories, or remove it. When we move the file, the use of `/.` means to use the same name as the original file.

```bash
$ cd ~/stat243-fall-2020/units
$ cp unit8-bigData.py unit8-bigData-new.py
$ mv unit8-bigData-new.py /tmp/.
$ cd /tmp
$ ls -lrt
```

```
total 12
-rw-rw-r-- 1 scflocal scflocal    0 Dec 28 13:31 hello.txt
-rw-rw-r-- 1 scflocal scflocal 9914 Dec 28 13:36 unit8-bigData-new.py
```

```bash
$ rm unit8-bigData-new.py
$ ls -lrt
```

```
total 0
-rw-rw-r-- 1 scflocal scflocal 0 Dec 28 13:31 hello.txt
```

**I used `rm` above to remove the file. Be very careful about removing files - there is no Trash folder in UNIX - once a file is removed, it's gone for good.**


The `mv` command is also used if you want to rename a file. 
```bash
$ cd ~/stat243-fall-2020/units
$ mv unit8-bigData.py unit8-bigData-processing.py
$ ls
```

```
badCode.R               provision-github.py            unit13-graphics.lyx  unit4-goodPractices.lyx  unit8-bigData.lyx
calc_mean.py            provision-github-secrets.json  unit13-graphics.pdf  unit4-goodPractices.pdf  unit8-bigData.pdf
class1-demo.sh          shell.pdf                      unit13-graphics.R    unit5-programming.lyx    unit8-bigData-processing.py
class2-taboo-game.md    unit10-linalg.lyx              unit1-unix.lyx       unit5-programming.pdf    unit8-bigData.R
E-step-fixed.png        unit10-linalg.pdf              unit1-unix.pdf       unit5-programming.R      unit8-bigData.sh
exampleGraphic.png      unit10-linalg.R                unit2-dataTech.lyx   unit6-numbers.lyx        unit9-sim.lyx
gelmanUnwin2013.pdf     unit11-optim.lyx               unit2-dataTech.pdf   unit6-numbers.pdf        unit9-sim.pdf
goodCode.R              unit11-optim.pdf               unit2-dataTech.R     unit6-numbers.R          unit9-sim.R
gordonFinch2015.pdf     unit11-optim.R                 unit3-bash.lyx       unit7-parallel.lyx       wainer1984.pdf
likLoops.Rda            unit12-integ.lyx               unit3-bash.pdf       unit7-parallel.pdf
pca_example_unit10.png  unit12-integ.pdf               unit3-bash.sh        unit7-parallel.py
provision-github.json   unit12-integ.R                 unit3-bash-sol.sh    unit7-parallel.R
```


We can copy and remove entire directories. The `-p` flag preserves the time stamp and other information associated with the files/directories, while the `-r` option copies recursively, such that the directory and all its contents (all child files and directories) are also copied.

```bash
$ cd ~/stat243-fall-2020
$ cp -pr ps /tmp/.  # copy the ps directory into /tmp
$ cd /tmp
$ mkdir stat243
$ mv ps stat243     # move the ps directory into the stat243 directory
$ ls -l stat243/ps
```

```
total 4184
-rw-rw-r-- 1 scflocal scflocal 1016811 Dec 28 13:15 cao_etal_2015.pdf
-rw-rw-r-- 1 scflocal scflocal 2225446 Dec 28 13:15 clm.pdf
-rw-rw-r-- 1 scflocal scflocal   73020 Dec 28 13:15 ps1_notes.pdf
-rw-rw-r-- 1 scflocal scflocal   99327 Dec 28 13:15 ps1.pdf
-rw-rw-r-- 1 scflocal scflocal     993 Dec 28 13:15 ps1.R
-rw-rw-r-- 1 scflocal scflocal   60659 Dec 28 13:15 ps2.pdf
-rw-rw-r-- 1 scflocal scflocal   53624 Dec 28 13:15 ps3.pdf
-rw-rw-r-- 1 scflocal scflocal    1642 Dec 28 13:15 ps3prob1.R
-rw-rw-r-- 1 scflocal scflocal  135090 Dec 28 13:15 ps4.pdf
-rw-rw-r-- 1 scflocal scflocal  131404 Dec 28 13:15 ps5.pdf
-rw-rw-r-- 1 scflocal scflocal   67175 Dec 28 13:15 ps6.pdf
-rw-rw-r-- 1 scflocal scflocal  126455 Dec 28 13:15 ps7.pdf
-rw-rw-r-- 1 scflocal scflocal  106467 Dec 28 13:15 ps8.pdf
-rw-rw-r-- 1 scflocal scflocal     595 Dec 28 13:15 ps8.R
-rw-rw-r-- 1 scflocal scflocal  153646 Dec 28 13:15 unit_test_examples.pdf
```

```bash
$ rm -r /tmp/stat243/ps   # remove the ps directory and anything contained within it
$ ls /tmp/stat243         # this should be empty now
```

You can use a variant of `cp` to copy files between different UNIX-like machines. Suppose I have access to the machine *radagast.berkeley.edu* and that my user name on that machine is *scf1*. I can copy a file to that machine or from that machine as follows. 

```bash
$ cd ~/stat243-fall-2020/units
$ # copy the file to the Desktop subdirectory of the scf1 home directory on the remote machine:
$ scp unit1-unix.sh scf1@radagast.berkeley.edu:~/Desktop/.
$ # copy a file from the /tmp directory of the remote machine to a specific directory on this machine
$ scp scf1@radagast.berkeley.edu:/tmp/data.txt ~/stat243-fall-2020/data/.
```

## 5.2 File permissions

```bash
$ cd ~/stat243-fall-2020
$ ls -l  # this lists files in 'long' format
```

```
total 152
drwxrwxr-x  2 scflocal scflocal  4096 Dec 28 13:15 data
drwxrwxr-x  2 scflocal scflocal  4096 Dec 28 13:15 howtos
drwxrwxr-x  2 scflocal scflocal  4096 Dec 28 13:15 project
drwxrwxr-x  2 scflocal scflocal  4096 Dec 28 13:15 ps
-rw-rw-r--  1 scflocal scflocal 11825 Dec 28 13:15 README.md
drwxrwxr-x 13 scflocal scflocal  4096 Dec 28 13:15 sections
-rw-rw-r--  1 scflocal scflocal 37923 Dec 28 13:15 syllabus.lyx
-rw-rw-r--  1 scflocal scflocal 77105 Dec 28 13:15 syllabus.pdf
drwxrwxr-x  2 scflocal scflocal  4096 Dec 28 13:37 units
```

When using the `-l` flag to `ls`, you'll see extensive information about each file (or directory), of which the most important are:

  - (column 1) file permissions (more later)
  - (column 3) the owner of the file ('scflocal' here)
  - (column 4) the group of users that the file belongs too (also 'scflocal' here)
  - (column 5) the size of the file in bytes
  - (column 6-8) the last time the file was modified
  - (column 9) name of the file

Let's look in detail at the information in the first column returned by `ls -l`. 

```bash
$ echo "first line" > tmp.txt  # create a text file we can play with that contains "first line"
$ ls -l
```

```
total 156
drwxrwxr-x  2 scflocal scflocal  4096 Dec 28 13:15 data
drwxrwxr-x  2 scflocal scflocal  4096 Dec 28 13:15 howtos
drwxrwxr-x  2 scflocal scflocal  4096 Dec 28 13:15 project
drwxrwxr-x  2 scflocal scflocal  4096 Dec 28 13:15 ps
-rw-rw-r--  1 scflocal scflocal 11825 Dec 28 13:15 README.md
drwxrwxr-x 13 scflocal scflocal  4096 Dec 28 13:15 sections
-rw-rw-r--  1 scflocal scflocal 37923 Dec 28 13:15 syllabus.lyx
-rw-rw-r--  1 scflocal scflocal 77105 Dec 28 13:15 syllabus.pdf
-rw-rw-r--  1 scflocal scflocal    11 Dec 28 13:39 tmp.txt
drwxrwxr-x  2 scflocal scflocal  4096 Dec 28 13:37 units
```

The first column actually contains 10 individual single-character columns. Items marked with a `d` as the first character are directories. Here `data` is a directory while `tmp.txt` is not.

Following that first character are three triplets of file permission information. Each triplet contains read ('r'), write ('w') and execute ('x') information. The first `rwx` triplet (the second through fourth characters) indicates if the owner of the file can read, write, and execute a file (or directory). The second `rwx` triplet (the fifth through seventh characters) indicates if anyone in the group that the file belongs to can read, write and execute a file (or directory). The third triplet (the eighth through tenth characters) pertains to any other user. Dashes mean that a given user does not have that kind of access to the given file.

For example, for the *syllabus.pdf* file, the owner of the file can read it and can modify the file by writing to it (the first triplet is 'rw-'), as can users in the group the file belongs to. But for all other users, they can only read it (the third triplet is 'r--').

We can change the permissions by indicating the type of user and the kind of access we want to add or remove. The type of user is one of:

   - 'u' for the user who owns the file,
   - 'g' for users in the group that the file belongs to, and
   - 'o' for any other users.

Thus we specify one of 'u', 'g', or 'o', followed by a '+' to add permission or a '-' to remove permission and finally by the kind of permission: 'r' for read access, 'w' for write access, and 'x' for execution access. 

As a simple example, let's prevent anyone from reading the `tmp.txt` file. We then try to print the contents of the file to the screen with the command `cat`, but we are denied.

```bash
$ chmod u-r tmp.txt # prevent owner from reading
$ chmod g-r tmp.txt # prevent users in the file's group from reading
$ chmod o-r tmp.txt # prevent others from reading
$ ls -l tmp.txt
```
```
--w--w---- 1 scflocal scflocal 11 Dec 28 13:39 tmp.txt
```
```bash
$ cat tmp.txt
```
```
cat: tmp.txt: Permission denied
```           

That can actually be accomplished all at once, like this:

```bash
$ chmod ugo-r tmp.txt # prevent all three
$ ls -l tmp.txt
```
```
--w--w---- 1 scflocal scflocal 11 Dec 28 13:39 tmp.txt
```


Or if we wanted to remove read and write permission:

```bash
$ chmod ugo-rw tmp.txt # prevent all three
$ # The next command would usually add a line to the file, but we don't have permission to write to it
$ echo "added line" >> tmp.txt  
```

```
-bash: tmp.txt: Permission denied
```

Now let's restore read and write permission to the owner:

```bash
$ chmod u+rw tmp.txt
$ echo "added line" >> tmp.txt
$ cat tmp.txt
```

```
first line
added line
```

## 5.3 File names and extensions

The format a file is in is deterined by the actual content of the file. In many cases, files have extensions such as `.csv` (for comma-separated text files), `.pdf` for PDFs, `.jpg` for JPEG files. The extension is a convention that helps us and programs distinguish different kinds of files and therefore know how to manipulate/interpret the files.

But the extension is just a convention -- changing the file name doesn't change the file format.

So if I create a simple text file as follows, we see that it's still just a simple text file even if I give it a name that would suggest it's a PDF.

```bash
$ echo "hello" > hello.txt
$ mv hello.txt hello.pdf
$ cat hello.pdf
```

```
hello
```


However, changing the extension may prevent a program from using the file simply because the program was written to assume that files in a certain format have a certain extension.

# 6 Other useful tools and information

## 6.1 Compressing and uncompressing files

The `zip` utility compresses in a format compatible with zip files for Windows:

```bash
$ cd ~
$ zip -r data.zip ~/stat243-fall-2020/data
```

```
  adding: home/scflocal/stat243-fall-2020/data/ (stored 0%)
  adding: home/scflocal/stat243-fall-2020/data/RTADataSub.csv (deflated 77%)
  adding: home/scflocal/stat243-fall-2020/data/precip.txt (deflated 87%)
  adding: home/scflocal/stat243-fall-2020/data/hivSequ.csv (deflated 88%)
  adding: home/scflocal/stat243-fall-2020/data/cpds.csv (deflated 70%)
  adding: home/scflocal/stat243-fall-2020/data/IPs.RData (deflated 0%)
  adding: home/scflocal/stat243-fall-2020/data/precipData.txt (deflated 78%)
  adding: home/scflocal/stat243-fall-2020/data/coop.txt.gz (deflated 1%)
```
```bash
$ ls -l data.zip
```
```
-rw-rw-r-- 1 scflocal scflocal 2873870 Dec 28 13:52 data.zip
```

`gzip` is a standard UNIX compression utility to compress individual files:

```bash
$ cd ~/stat243-fall-2020/data
$ ls -l precip.txt
```

```
-rw-rw-r-- 1 scflocal scflocal 2766472 Dec 28 13:15 precip.txt
```

```bash
$ cd ~/stat243-fall-2020/data
$ gzip precip.txt
$ ls -l precip.txt.gz   # This is rather smaller than the uncompressed file.
```

```
-rw-rw-r-- 1 scflocal scflocal 356923 Dec 28 13:15 precip.txt.gz
```


Finally, the `tar` utility will combine multiple files and directories into a single archive. 

```bash
$ cd
$ tar -cvf data.tar stat243-fall-2020/data
```

```
stat243-fall-2020/data/
stat243-fall-2020/data/RTADataSub.csv
stat243-fall-2020/data/hivSequ.csv
stat243-fall-2020/data/cpds.csv
stat243-fall-2020/data/IPs.RData
stat243-fall-2020/data/precipData.txt
stat243-fall-2020/data/precip.txt.gz
stat243-fall-2020/data/coop.txt.gz
```

```bash
$ ls -l data.tar
```

```
-rw-rw-r-- 1 scflocal scflocal 4157440 Dec 28 13:54 data.tar
```

Adding the `-z` flag also gzips the result.

```bash
$ tar -cvzf data.tgz stat243-fall-2020/data
```

```
stat243-fall-2020/data/
stat243-fall-2020/data/RTADataSub.csv
stat243-fall-2020/data/hivSequ.csv
stat243-fall-2020/data/cpds.csv
stat243-fall-2020/data/IPs.RData
stat243-fall-2020/data/precipData.txt
stat243-fall-2020/data/precip.txt.gz
stat243-fall-2020/data/coop.txt.gz
```

```bash
$ ls -l data.tgz
```

```
-rw-rw-r-- 1 scflocal scflocal 2873907 Dec 28 13:54 data.tgz
```

Now let's move that *tarball* (as it is called) to a new directory and unzip and expand it using the -x flag. 

```bash
$ mv data.tgz /tmp
$ cd /tmp
$ tar -xvzf data.tgz
```

```
stat243-fall-2020/data/
stat243-fall-2020/data/RTADataSub.csv
stat243-fall-2020/data/hivSequ.csv
stat243-fall-2020/data/cpds.csv
stat243-fall-2020/data/IPs.RData
stat243-fall-2020/data/precipData.txt
stat243-fall-2020/data/precip.txt.gz
stat243-fall-2020/data/coop.txt.gz
```

You can see the whole directory structure of what was archived has been recovered in the new location:
```bash
$ ls -l /tmp/stat243-fall-2020/data
```

```
total 4064
-rw-rw-r-- 1 scflocal scflocal 2128297 Dec 28 13:15 coop.txt.gz
-rw-rw-r-- 1 scflocal scflocal   41130 Dec 28 13:15 cpds.csv
-rw-rw-r-- 1 scflocal scflocal 1244094 Dec 28 13:15 hivSequ.csv
-rw-rw-r-- 1 scflocal scflocal  223004 Dec 28 13:15 IPs.RData
-rw-rw-r-- 1 scflocal scflocal   10965 Dec 28 13:15 precipData.txt
-rw-rw-r-- 1 scflocal scflocal  356923 Dec 28 13:15 precip.txt.gz
-rw-rw-r-- 1 scflocal scflocal  139797 Dec 28 13:15 RTADataSub.csv
```


## 6.2 Disk usage

You can can see how much disk space is being used versus available as follows. The 'Mounted' column will generally identify the parts of the filesystem in a more user-friendly way than the 'Filesystem' column.

```bash
$ df -h
```

```
Filesystem                           Size  Used Avail Use% Mounted on
/dev/sda1                            120G   20G   95G  17% /
udev                                 7.8G     0  7.8G   0% /dev
tmpfs                                7.8G  449M  7.4G   6% /dev/shm
tmpfs                                1.6G  7.7M  1.6G   1% /run
tmpfs                                5.0M  4.0K  5.0M   1% /run/lock
tmpfs                                1.6G   44K  1.6G   1% /run/user/3189
tmpfs                                7.8G     0  7.8G   0% /sys/fs/cgroup
/dev/sda2                            240G   37G  192G  16% /var
/dev/sda3                            240G  196G   32G  87% /var/tmp
/dev/sda5                            286G  1.4G  270G   1% /tmp
```

In general, you'll want to look at the '/' line, and on standard UNIX machines possibly at '/tmp', '/home', and others.

We can see usage in specific directories like this:

```bash
$ cd ~/stat243-fall-2020/sections
$ du -h
```

```
224K	./11
8.0K	./04
408K	./02
104K	./01/data
1.6M	./01/solutions
1.8M	./01
12K	./03/tests
336K	./03
232K	./06
332K	./05/figures
816K	./05
8.0K	./10
260K	./07
460K	./08
152K	./09
4.7M	.
```

Here we see that the total usage is 4.7 MB, with, for example, 260 KB of that in the `07` subdirectory.

If we only want a summary of usage for each top-level subdirectory, rather than showing all nested subdirectories:

```bash
$ cd ~/stat243-fall-2020
$ du -h -d 1
```

```
4.0M	./data
4.1M	./ps
9.2M	./units
872K	./howtos
21M	./.git
4.7M	./sections
88K	./project
44M	.
```

## 6.3 Machine information

Linux machines (but not Macs) have system information provided in a few special files.

`/proc/cpuinfo` shows information on each processor. 

```bash
$ head -n 30 /proc/cpuinfo
```

```
processor	: 0
vendor_id	: GenuineIntel
cpu family	: 6
model		: 42
model name	: Intel(R) Core(TM) i7-2600 CPU @ 3.40GHz
stepping	: 7
microcode	: 0x2f
cpu MHz		: 3461.093
cache size	: 8192 KB
physical id	: 0
siblings	: 8
core id		: 0
cpu cores	: 4
apicid		: 0
initial apicid	: 0
fpu		: yes
fpu_exception	: yes
cpuid level	: 13
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx lahf_lm epb pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriority ept vpid xsaveopt dtherm ida arat pln pts md_clear flush_l1d
bugs		: cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass l1tf mds swapgs itlb_multihit
bogomips	: 6784.68
clflush size	: 64
cache_alignment	: 64
address sizes	: 36 bits physical, 48 bits virtual
power management:

processor	: 1
vendor_id	: GenuineIntel
cpu family	: 6
```


This indicates  there are at least two processors (numbered 0 and 1) [we'd need to see the whole file to see if there are more]. Each is an Intel Core i7. 


This file has information on the memory available:

```bash
$ head -n 10 /proc/meminfo
```

```
MemTotal:       16351800 kB
MemFree:          367676 kB
MemAvailable:    3573392 kB
Buffers:           84268 kB
Cached:          3685904 kB
SwapCached:          264 kB
Active:         10684336 kB
Inactive:        2458608 kB
Active(anon):    8684760 kB
Inactive(anon):  1374888 kB
```

The key line is the *MemTotal* line, indicating 163 GB of RAM.

```bash
$ cat /etc/issue
```

```
Ubuntu 20.04.2 LTS \n \l
```

We're running Ubuntu version 20.04.

We can also use commands to get information:

```bash
$ nproc  # how many processors?
```

```
8
```

# 7 The shell

The shell provides a number of useful shortcuts, of which we highlight a couple here.

## 7.1 Tab completion

The shell will try to auto-complete the names of commands/programs or of files when you type part of the name and then hit <Tab>. This can save quite a bit of typing, particularly for long file names. 

## 7.2 Command history

The up and down arrow keys will move you through the history of commands you have entered in the terminal. So you can recover something you typed previously and then directly run it again, or edit it and then run the modified version. You run the command by pressing <Enter>, which you can do regardless of where your cursor currently is on the line you are editing.

There's also lots more functionality along these lines that we won't go into here.

You can navigate within a line using the usual arrows but also:

* `Ctrl-a` moves to the beginning of the line
* `Ctrl-e` moves to the end of the line
* `Ctrl-k` deletes the rest of the line starting at the cursor
* `Ctrl-y` pastes in whatever was deleted previously with Ctrl-k
* `Ctrl-r` enables an [interactive history search](http://www.techrepublic.com/article/keyboard-shortcuts-in-bash-and-zsh/)

## 7.3 Saving your code as a shell script

Often (particularly as you learn more sophisticated shell functionality) you will want to save your shell syntax in the form of a code file, called a script, that you could run another time.

For example, suppose you often need to do the following series of steps:
```bash
$ cd 
$ tar -cvzf stat243.tgz stat243-fall-2020
$ mv stat243.tgz /tmp
$ cd /tmp
$ tar -xvzf stat243.tgz
$ rm -rf data
```

You can put those lines into a file, say, `mvStat243.sh`, which will generally end in .sh.

Then we can run the code in the file as follows. (Results not shown here.)

```bash
$ chmod ugo+x mvStat243.sh  # make the script executable by everyone
$ ./mvStat243.sh  # run it
```

The inital './' is needed because UNIX is not expecting there to be an executable file in this particular directory. 

# 8 Questions

1) Try to run the following command `mkdir ~/projects/drought`. It will fail. Look in the help information on `mkdir` to figure out how to make it work without first creating the *projects* directory.

2) Figure out how to list out the files in a directory in order of decreasing file size, as a way to see easily what the big files are that are taking up the most space. Modify this command to get the ascending order.

3) Change the permissions on the file `stat243-fall-2020/units/unit2-bash.sh` to be readable by the user and the group, writeable by the user, and executable by all users.

4) Use both `zip` and `tar -cvzf` to compress the stat243-fall-2020 directory. Is one much smaller than the other?

5) Figure out how to print out free disk space in terms of megabytes. 

6) The `ls` command is itself an executable installed on the system. Where is it located?

7) Where is *grep* installed on the system? What are some other programs/executables that are installed in the same directory?


