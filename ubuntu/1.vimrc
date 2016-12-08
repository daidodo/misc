" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below. If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed. It is recommended to
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
set nocp " be iMproved
"set showcmd " Show (partial) command in status line.
set showmode " Show the current editing mode
set showmatch " Show matching brackets.
set ignorecase " Do case insensitive matching
set smartcase " Do smart case matching
set incsearch " Incremental search
set autowrite " Automatically save before commands like :next and :make
set ls=2 " show status bar
set hlsearch
set nu
set backspace=indent,eol,start
set ruler               " Always show current position
set cursorline          " highlighten current line
set autoread            " auto read when a file is changed from the outside
set magic               " For regular expressions turn magic on
set nobackup            " Turn backup off, since most stuff is in SVN, git etc anyway
set nowb
set noswapfile
set cc=101              " Highlighten column after 100

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
Plugin 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call vundle#end() " required
filetype plugin indent on " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList - lists configured plugins
" :PluginInstall - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" ----End Vundle---

" YCM
let g:ycm_confirm_extra_conf = 0

" Always show the status line
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
	return 'PASTE MODE  '
    en
    return ''
endfunction
" Powered by powerline
set laststatus=2
let g:Powerline_symbols = 'unicode'
" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ %y\ \ CWD:\ %r%{getcwd()}%h\ \ %p%%\ \ %{fugitive#statusline()}
"set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set statusline=%<%f%m\ %y%r%w%{fugitive#statusline()}\ CWD:\ %{getcwd()}%=%-14.(%l,%c%V%)\ %p%%

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.c :call DeleteTrailingWS()
autocmd BufWrite *.cpp :call DeleteTrailingWS()
autocmd BufWrite *.cc :call DeleteTrailingWS()
autocmd BufWrite *.cxx :call DeleteTrailingWS()
autocmd BufWrite *.h :call DeleteTrailingWS()
autocmd BufWrite *.hh :call DeleteTrailingWS()
autocmd BufWrite *.hpp :call DeleteTrailingWS()
autocmd BufWrite *.sh :call DeleteTrailingWS()
autocmd BufWrite *.py :call DeleteTrailingWS()

" locale
set fencs=ucs-bom,prc,latin1
"set enc=utf8
"set tenc=prc

set tags=tags,./tags,../tags,../../tags,../../../tags,../../../../tags,~/sys.tags

set path=.,..,../..,../../..,marine,./marine,../marine,../../marine,/usr/include/c++/5,/usr/include/x86_64-linux-gnu/c++/5,/usr/include/c++/5/backward,/usr/lib/gcc/x86_64-linux-gnu/5/include,/usr/local/include,/usr/lib/gcc/x86_64-linux-gnu/5/include-fixed,/usr/include/x86_64-linux-gnu,/usr/include

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
" ctrl-c back to normal mode and save
imap <C-c> <ESC>:w<cr>

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
    source /etc/vim/vimrc.local
endif
