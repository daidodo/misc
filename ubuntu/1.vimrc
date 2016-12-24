"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copyright (c) 2016 Zhao DAI <daidodo@gmail.com>
"
" This program is free software: you can redistribute it and/or modify
" it under the terms of the GNU General Public License as published by
" the Free Software Foundation, either version 3 of the License, or any
" later version.
"
" This program is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
" GNU General Public License for more details.
"
" You should have received a copy of the GNU General Public License
" along with this program.  If not, see accompanying file LICENSE.txt
" or <http://www.gnu.org/licenses/>.
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Vim 5 and later versions support syntax highlighting. Uncomment the
" following enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set ignorecase      " Do case insensitive matching
set smartcase       " Do smart case matching
set incsearch       " Incremental search
set wildmenu        " Enhanced command-line completion
set wildignore+=*.o " Ignore certain file types for wildmenu
set matchpairs+=<:>,=:;   " Let % moves between < > or = ;

set autoread        " auto read when a file is changed from the outside
set autowrite       " Automatically save before commands like :next and :make
set nowritebackup   " Turn backup off, since most stuff is in SVN, git etc anyway
set noswapfile      " Do not use swap file

set showmatch       " Show matching brackets.
set number          " Show line number
set cursorline      " Highlight current line
set textwidth=100   " Max line length
set colorcolumn=101 " Highlight column 101
set laststatus=2    " Always show status line
set cmdheight=2     " Command line height
set scrolloff=3     " Minimal number of lines to keep above and below the cursor
set listchars=tab:>-,trail:-    " When you enter :set list, TAB will shown as '>---'
set virtualedit=block     " Allow virtual editing in Visual block mode.

set cindent         " Enable C/C++/Java like indentation
set shiftwidth=4    " Number of spaces to use for each step of indent
set softtabstop=-1  " Number of spaces for a <Tab> while editing, -1 means same to 'shiftwidth'
set expandtab       " Use spaces to insert a <Tab>
au Filetype vim,sh,vimrc,bashrc setlocal shiftwidth=2  " TAB width for scripts
" C/C++ code styles:
" g0    public/protected/private do not indent.
" l1    codes inside 'case N:{' indent 1 shiftwidth.
" (0    codes inside '(' indent 1 shiftwidth for each '('.
" W1s   the first argument of a function indents 1 shiftwidth.
" N-s   codes inside a namespace do not indent. (Not applied)
set cinoptions=g0,l1,(0,W1s

set fileencodings=ucs-bom,utf8,cp936,gb2312,gbk,gb18030,big5,euc-jp,euc-kr,latin1
set encoding=utf-8
set ambiwidth=double    " Display certain Asian Chars widely
set spell               " Enable spell check
set spellfile=~/work/misc/ubuntu/dict.utf-8.add  " Custom dictionary
set spelllang+=sysdict  " Add dictionary for C/C++ and system headers

set tags+=tags;     " Search for tags along the path to root (/)
set path=.,..,../..,../../..,marine,./marine,../marine,../../marine

" Leader Key: <Space>
let mapleader=" "
let g:mapleader=" "

" ----Begin Vundle---
filetype off   " Disable file type detection, required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'   " let Vundle manage Vundle, required

Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/syntastic'

Plugin 'daidodo/DoxygenToolkit.vim'
Plugin 'scrooloose/nerdcommenter'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'

Plugin 'easymotion/vim-easymotion'
Plugin 'haya14busa/incsearch.vim'
Plugin 'haya14busa/incsearch-fuzzy.vim'
Plugin 'haya14busa/incsearch-easymotion.vim'
Plugin 'vim-scripts/EasyGrep'

Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'

Plugin 'uguu-org/vim-matrix-screensaver'

" All of your Plugins must be added before this line
call vundle#end() " required
filetype plugin indent on " Enable file type detection, plugins and indent loading, required
" Brief help
" :PluginList - lists configured plugins
" :PluginInstall - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ---------- Normal Mode Key Mapping ---------

" Treat long lines as break lines
nmap j gj
nmap k gk

" <leader> m    open compile window
" <leader> c    close compile window
nnoremap <unique> <leader>m :copen<cr>
nnoremap <unique> <leader>c :cclose<cr>

" CTRL-J        switch to previous buffer
" CTRL-L        switch to next buffer
" CTRL-K        unload current buffer
" <leader> O    unload all buffers but current one
nnoremap <unique><silent> <C-j> :bp<cr>
nnoremap <unique><silent> <C-l> :bn<cr>
nnoremap <unique><silent> <C-k> :bd<cr>
nnoremap <unique><silent> <leader>O :call BufOnly()<cr>

" YouCompleteMe
" CTRL-]        goto definition or declaration of current tag
nnorema <unique> <C-]> :YcmCompleter GoToDefinitionElseDeclaration<cr>

" TagBar
" <leader> t    open or close TagBar
nnoremap <unique> <leader>t :TagbarOpenAutoClose<cr>

" fugitive
" <leader> g    git status
" <leader> gd   git diff
nnoremap <unique> <leader>g :Gstatus<cr>
nnoremap <unique> <leader>gd :Gvdiff<cr>

" DoxygenToolkit
" <leader> d    generate doxygen comments for class, func, etc.
" <leader> df   generate doxygen comments for file
" <leader> dl   generate licence statement
" <leader> db   generate block comment
nnoremap <unique> <leader>d :Dox<cr>
nnoremap <unique> <leader>df :DoxAuthor<cr>
nnoremap <unique> <leader>dl :DoxLic<cr>
nnoremap <unique> <leader>db :DoxBlock<cr>

" incsearch-fuzzy-easymotion
" Note: Backward search (?) cannot be fuzzy because of a bug:
" Without {'is_stay': 1}, highlight doesn't function.
noremap <unique><silent><expr> /  incsearch#go(<SID>fuzzysearch())
noremap <unique><silent><expr> ?  incsearch#go(<SID>fuzzysearch({'command': '?'}))
noremap <unique><silent><expr> g/ incsearch#go(<SID>fuzzysearch({'is_stay': 1}))

" NERD Tree
" <leader> n    open file list
nnoremap <unique><silent> <leader>n :NERDTree<cr>

" <leader> S    toggle spell checking for current buffer
nnoremap <unique> <leader>S :set spell!<cr>

" EasyGrep
" <leader> vv    Grep for the word under the cursor, match all occurrences, like |gstar|
" <leader> vV    Grep for the word under the cursor, match whole word, like |star|
" <leader> vr    Perform a global search search on the word under the cursor and prompt for a pattern
"                with which to replace it.
" <Leader> vo    View/change options.

" NERD Commenter
" <leader> cc       Comment out the current line or text selected in visual mode.
" <leader> c<space> Toggles the comment state of the selected line(s). If the topmost selected line
"                   is commented, all selected lines are uncommented and vice versa.
" <leader> cs       Comments out the selected lines with a pretty block formatted layout.
" <leader> cu       Uncomments the selected line(s).

" ---------- Input Mode Key Mapping ---------

" Keys available: (CTRL-) A B F G K L R U X Z @ ] ^

" CTRL-L    add newline prior to current line
" CTRL-K    delete the character under the cursor, same as <Del>
inoremap <unique> <C-l> <C-o>O
inoremap <unique> <C-k> <del>

"---------- Global Variables ---------

" Highlight redundant spaces
if $VIM_HATE_SPACE_ERROR != '0'
  let c_space_errors=1
endif

" YouCompleteMe
let g:ycm_confirm_extra_conf=0
let g:ycm_min_num_of_chars_for_completion=3
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_in_comments=1
let g:ycm_complete_in_strings=1
let g:ycm_global_ycm_extra_conf="~/.ycm_extra_conf.py"
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_key_invoke_completion="<C-n>"

" UltiSnips
" CTRL-B    trigger snippet expand, and jump forward
" CTRL-V    jump backward
let g:UltiSnipsExpandTrigger="<C-b>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-v>"

" vim-airline
let g:airline_theme="base16color"
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1

" Doxygen
let g:load_doxygen_syntax=1
let doxygen_my_rendering=0
let g:DoxygenToolkit_authorName="Zhao DAI"
let g:DoxygenToolkit_authorMail="daidodo@gmail.com"
let g:DoxygenToolkit_licenseFile="COPYING"

" TagBar
let g:tagbar_compact=1
let g:tagbar_iconchars=['+','-']

" CtrlP
let g:ctrlp_match_window="order:ttb"
let g:ctrlp_follow_symlinks=1

" NERD Tree
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeShowHidden=1
let g:NERDTreeMinimalUI=1 
let g:NERDTreeWinPos="right"
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="-"

" NERD Commenter
let g:NERDTrimTrailingWhitespace=1
let g:NERDDefaultNesting=0
let g:NERDDefaultAlign='left'

"---------- Auto Commands ---------

" Delete trailing white space on save for C/C++ source
au BufWrite *.{c,cc,cpp,cxx,h,hh,hpp,hxx} exe "normal mz" | %s/\s\+$//ge | exe "normal `z"

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Start NERD Tree when execute 'vim' or 'vim A_DIR'
au StdinReadPre * let s:std_in=1
au VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
au VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") |
      \ exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Close Vim if the only window left is a NERD Tree
au bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Split help window to the right
au FileType help wincmd L

"---------- Functions ---------

function! BufOnly()
  let buffer = bufnr('%')
  if buffer == -1
    echohl ErrorMsg
    echomsg "No matching buffer for" a:buffer
    echohl None
    return
  endif
  let last_buffer = bufnr('$')
  let delete_count = 0
  let n = 1
  while n <= last_buffer
    if n != buffer && buflisted(n)
      if getbufvar(n, '&modified')
        echohl ErrorMsg
        echomsg 'No write since last change for buffer'
              \ n '(add ! to override)'
        echohl None
      else
        silent exe 'bdel' . '' . ' ' . n
        if ! buflisted(n)
          let delete_count = delete_count+1
        endif
      endif
    endif
    let n = n+1
  endwhile
  if delete_count == 1
    echomsg delete_count "buffer deleted"
  elseif delete_count > 1
    echomsg delete_count "buffers deleted"
  endif
endfunction

function! s:incsearch(...) abort
  return extend(copy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

function! s:fuzzysearch(...) abort
  return s:incsearch(extend(copy({
  \   'converters': [incsearch#config#fuzzyword#converter()],
  \ }), get(a:, 1, {})))
endfunction

" ---------- Experimental ---------

"inoremap <unique> { {};<left><left>
inoremap <unique> {<cr> {<cr>}<C-o>O
inoremap <unique><silent> } <C-r>=ClosePair('}')<cr>
"inoremap <unique> [ []<left>
inoremap <unique><silent> ] <C-r>=ClosePair(']')<cr>
"inoremap <unique> ( ()<left>
inoremap <unique><silent> ) <C-r>=ClosePair(')')<cr>
function! ClosePair(char)
  if getline('.')[col('.')-1] == a:char
    return "\<Right>"
  else
    return a:char
  endif
endfunction

" easymotion
let g:EasyMotion_smartcase=1 

"au Filetype sh,vimrc,bashrc setlocal nospell  " Disable spell check for certain file types
"set completeopt=longest,menu

"Plugin 'fatih/vim-go'
"Plugin 'solarnz/thrift.vim'

"" <leader> t    run GoTest
"nnoremap <leader>t :GoTest<cr>

"" <leader> T    replace all <Tab>s with 4 spaces
"nnoremap <unique><silent> <leader>T :set ts=4<cr> :ret<cr> :set ts=8<cr>

" press P P to show tag preview
" press P C to close tag preview window
"map PP :ptag <C-R><C-W><cr><C-w>k
"nmap PC :pclose<cr>

" CTRL-H    move cursor left
" CTRL-J    move cursor down
" CTRL-K    move cursor up
" CTRL-L    move cursor right
"inoremap <unique> <C-h> <C-o>h
"inoremap <unique> <C-j> <C-o>j
"inoremap <unique> <C-k> <C-o>k
"inoremap <unique> <C-l> <C-o>l

"" <leader> l    list all buffers
"" t NUM jump to buffer NUM
"nnoremap <unique><silent> <leader>l :ls<cr>
"nnoremap <unique> t :b<Space>

"let g:ycm_autoclose_preview_window_after_completion=1
"let g:ycm_collect_identifiers_from_tags_files=0

"let g:airline_powerline_fonts=1

"let g:NERDSpaceDelims=1
"let g:NERDRemoveExtraSpaces=1
"
"set viminfo^=%      " Save buffer list to .viminfo and restore them if vim has no args
"set hlsearch        " Highlight all search results
"ctags -R --c++-kinds=+p --fields=+iaS --extra=+q

"let g:Powerline_symbols = 'unicode'
"let g:Powerline_symbols='fancy'
"set statusline=%<%f%m\ %y%r%w%{fugitive#statusline()}\ %{getcwd()}%=%-14.(%l,%c%V%)\ %p%%
