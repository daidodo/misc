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

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set nocp		 	" �رպ�vi���ݣ��ܶ๦�ܶ���Ҫ���ѡ�
"set showcmd		" Show (partial) command in status line.
set showmode		" Show the current editing mode
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
"set hidden         " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)
set ls=2			" ������ʾ״̬��
set hlsearch
set nu
set backspace=indent,eol,start
set ruler

" ������ʽ
"set fencs=ucs-bom,prc,latin1
"set enc=prc
"set tenc=prc

set tags=tags,./tags,../tags,../../tags,../../../tags
",/mnt/hgfs/work/system.tags

set path=marine,.,./marine,..,../marine,../..,../../marine,/usr/include,/usr/include/c++/4.3/,/usr/src/linux-headers-2.6.28-11/include

set listchars=tab:>-,trail:- "when you enter 'set list', TAB will shown as '>---'

au Filetype c,cpp,h set tabstop=4 "when you click TAB,indent 4 character in source file
au Filetype sh set tabstop=2 "when you click TAB,indent 2 character in shell scripts
au Filetype c,cpp,h,sh set expandtab "use <space> replace <Tab>

"au Filetype c,cpp,h set tw=80 "warp when more than 80 characters

" �����������������vi�����������������һ�֡���д����ܷ���
set cindent shiftwidth=4
au Filetype sh set cindent shiftwidth=2
filetype indent on

" �� P P ������Ļ���˴�һ��ռ��Ļ1/5�Ĵ��ڣ���ʾ����
" �� P C �رոô���
map PP :ptag <C-R><C-W><cr><C-w>k
nmap PC :pclose<cr>

" �� B �� M ���沢�������
" �� C �رձ���������
"nmap M :w<cr>:!make<cr><Esc>:copen<cr>
nmap M :copen<cr>
nmap C :cclose<cr>
nmap B :w<cr>:call Do_make()<cr><cr><cr>
function Do_make()
    let filename = bufname("%")
    let suffix_pos = stridx(filename, ".c")
    if suffix_pos == -1
        return
    else
        let target = strpart(filename,0,suffix_pos)
    endif
    let target = "make " .  target
    execute target
    execute "copen"
endfunction


" ��ʾc��cpp�ļ��ж���Ŀո�
if $VIM_HATE_SPACE_ERROR != '0'
    let c_space_errors=1
endif

" ������������ݼ�
" ctrl-n �л�����һ������
" ctrl-p �л�����һ������
" ctrl-l ��ʾ���л�����
" ctrl-k ɾ����ǰ������
nmap <silent><C-n> :bn<cr>
nmap <silent><C-p> :bp<cr>
nmap <C-l> :ls<cr>
nmap <C-k> :bd<cr>
"�������ӳ��������ת��ָ��������: ��t�������뻺������ţ��س���������ָ��������
nmap t :b<Space>

" ����ͨģʽ�µ�TAB��ӳ��ɽ�������ģʽ
nmap <tab> a<tab>

" ����ͨģʽ�µ� p ӳ��� P
"nmap p P

" �� ctrl-w ֱ��ӳ����л�����
"nmap <C-w> <C-w>w

" ����ģʽ�µļ�ӳ��
" ctrl-l �ڵ�ǰ�е�ǰ������һ��
imap <C-l> <C-o>O
" ctrl-w �л�����
imap <C-w> <C-o><C-w>w

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
