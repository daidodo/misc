" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set nocp                " be iMproved
"set showcmd            " Show (partial) command in status line.
set showmode            " Show the current editing mode
set showmatch           " Show matching brackets.
set ignorecase          " Do case insensitive matching
set smartcase           " Do smart case matching
set incsearch           " Incremental search
set autowrite           " Automatically save before commands like :next and :make
set ls=2                " show status bar
set hlsearch
set nu
set backspace=indent,eol,start
set ruler
set cursorline          " highlighten current line

" ----Begin Vundle---
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'Valloric/YouCompleteMe'
Plugin 'solarnz/thrift.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" ----End Vundle---

" locale
set fencs=ucs-bom,prc,latin1
"set enc=prc
"set tenc=prc

set tags=tags,./tags,../tags,../../tags,../../../tags,../../../../tags,~/sys.tags

set path=.,..,../..,../../..,marine,./marine,../marine,../../marine

set listchars=tab:>-,trail:- "when you enter 'set list', TAB will shown as '>---'

au Filetype c,cpp,h,go,thrift set tabstop=4 "when you click TAB,indent 4 character in source file
au Filetype sh set tabstop=2 "when you click TAB,indent 2 character in shell scripts
au Filetype c,cpp,h,sh,thrift set expandtab "use <space> replace <Tab>

"au Filetype c,cpp,h set tw=80 "warp when more than 80 characters

" indentation
set cindent shiftwidth=4
au Filetype sh set cindent shiftwidth=2
filetype indent on

" press P P to show tag preview
" press P C to close tag preview window
map PP :ptag <C-R><C-W><cr><C-w>k
nmap PC :pclose<cr>

" press M to open compile window
" press C to close compile window
"nmap M :w<cr>:!make<cr><Esc>:copen<cr>
nmap M :copen<cr>
nmap C :cclose<cr>
nmap T :GoTest<cr>

" highlight redundent spaces
if $VIM_HATE_SPACE_ERROR != '0'
    let c_space_errors=1
endif

" buffers operatrions:
" ctrl-n switch to next buffer
" ctrl-p switch to previous buffer
" ctrl-l list all buffers
" ctrl-k remove current buffer
nmap <silent><C-n> :bn<cr>
nmap <silent><C-p> :bp<cr>
nmap <C-l> :ls<cr>
nmap <C-k> :bd<cr>
" t NUM jump to buffer NUM
nmap t :b<Space>

" override TAB in normal mode
nmap <tab> a<tab>

" Input Mode override:
" ctrl-l add newline prior to current line
imap <C-l> <C-o>O
" ctrl-w switch between windows
imap <C-w> <C-o><C-w>w

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
