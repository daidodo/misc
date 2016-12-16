# ubuntu/Dockerfile
This image is meant to be a daily used development environment for C/C++ programmers, as well as other professionals.

If you find it useful, please drop me a message in the comments. Thanks!

[![](https://images.microbadger.com/badges/image/daidodo/dev.svg)](https://microbadger.com/images/daidodo/dev "Get your own image badge on microbadger.com")

## Packages
* git
* GCC, g++, gdb
* make
* vim
* manpages
* protobuf, google-perftools
* sshd, sz, rz
* ...

See [`apt-get.sh`](https://github.com/daidodo/misc/blob/master/ubuntu/apt-get.sh) for a complete list.

## Features
* `root` is **NOT** permitted to login through `ssh`, please use `dozerg` or create your own.
* `dozerg`'s initial password is `dozerg`, change it when first login.
* `dozerg` is an sudoer.
* `Vim` is well set with a bunch of plugins and configurations, see [`1.vimrc`](https://github.com/daidodo/misc/blob/master/ubuntu/1.vimrc) for more.
* `Vundle.vim` is installed and used as plugins management.
* `GDB` is tested.

## `Vim` plugins
* YouCompleteMe
* ultisnips
* vim-snippets
* DoxygenToolkit.vim
* vim-airline
* vim-fugitive
* vim-easymotion
* tagbar
* nerdtree
* ctrlp.vim
* ...

## Usage
See [`run.sh`](https://github.com/daidodo/misc/blob/master/run.sh) for more details.

### Run
`docker run -d -p 127.0.0.1:22222:22 --name dev -h dev --security-opt seccomp:unconfined daidodo/dev`

### Login
`ssh dozerg@localhost -p 22222`
