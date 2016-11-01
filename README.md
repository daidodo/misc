# ubuntu/Dockerfile
This image is meant to be a daily used development environment for C/C++ programmers, as well as other professionals might be in the future.

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

## Features
* `root` is **not** permitted to login through `ssh`, please use `dozerg` or create your own.
* `dozerg`'s initial password is `dozerg`, change it when first login.
* `dozerg` is an sudoer.
* `vim` is well set with system headers paths and tags for C/C++ development.
* `Vundle.vim` is installed and used as plugins management.

## Usage
### Run
`docker run -d -p 127.0.0.1:22222:22 --name dev -h dev daidodo/dev`
### Login
`ssh dozerg@localhost -p 22222`


