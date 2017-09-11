set nocompatible              " be iMproved, required
filetype off                  " required

" schema config
syntax enable
scriptencoding utf-8
set encoding=utf-8
set t_Co=256
colorscheme breezy
set background=light
set termguicolors " if you want to run vim in a terminal
colorscheme breezy
" end schema config

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Bundle 'gmarik/Vundle.vim'
Bundle 'tpope/vim-pathogen'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'andviro/flake8-vim'
Plugin 'davidhalter/jedi-vim'
" Keep Plugin commands between vundle#begin/end.
" Plugin vim-airline
Plugin 'bling/vim-airline'
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" Plugin syntastic
Plugin 'scrooloose/syntastic'
" Plugin nerdtree
Plugin 'scrooloose/nerdtree'
let NERDTreeShowHidden=1
map <F2> :NERDTreeToggle<CR>
map <F3> :NERDTreeFind<CR>    " locates the file in the tree
" Plugin phpcomplete
Plugin 'shawncplus/phpcomplete.vim'
" Plugin supertab
Plugin 'ervandew/supertab'
" Plugin ctrlp
Plugin 'kien/ctrlp.vim.git'
let g:ctrlp_map = '<F4>'
map <F5> :CtrlPMRUFiles <CR>
" Plugin vim-better-whitespace
Plugin 'ntpeters/vim-better-whitespace'
" Plugin gitgutter
if has('signs')
    Plugin 'airblade/vim-gitgutter'
    let g:gitgutter_escape_grep = 1   " Use raw grep
    let g:gitgutter_eager = 0         " Don't run eagerly
endif
" Plugin vim-tmux-navigator
Plugin 'christoomey/vim-tmux-navigator'
" Plugin vim-multiple-cursors
Plugin 'terryma/vim-multiple-cursors'
let g:multi_cursor_start_key='<F6>'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line

let g:PyFlakeOnWrite = 1

let NERDTreeIgnore=['\.pyc$', '__pycache__$', '\.swp$', '\.git$', '.DS_Store', '.pytest_cache', '.tox', 'yarn.lock', 'package-lock.json']
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=0

set number                      " always show line numbers
set mouse=a                     " copy text with the mouse
set nowrap                      " don't wrap lines
set smartindent                 " smart indent script
set tabstop=4                   " a tab is four spaces
set shiftwidth=4                " number of spaces to use for autoindenting
set expandtab                   " convert tabs to spaces
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch                   " set show matching parenthesis
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab                    " insert tabs on the start of a line according to shiftwidth, not tabstop
set hlsearch                    " highlight search terms
set incsearch                   " show search matches as you type
set history=1000                " remember more commands and search history
set undolevels=1000             " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class " ignore this extensions
set title                       " change the terminal's title
set visualbell                  " don't beep
set noerrorbells                " don't beep
set cursorline                  " hightlight current line
set wildmenu                    " visual autocomplete for command menu
set list                        " ordered sequence of items
set listchars=trail:·,tab:»»    " trail: Character to show for trailing spaces, tab: two characters to be used to show a tab.
set colorcolumn=80             " highlights limit 120 characters long
set cursorcolumn
set cursorline
match ErrorMsg '\%>100v.\+'     " message error above 100 characters long

autocmd FileType groovy setlocal noexpandtab copyindent  preserveindent  softtabstop=0  shiftwidth=4  tabstop=4
au BufReadPost *.twig set syntax=html
au BufReadPost *.ejs set syntax=html
au BufReadPost *.ctp set syntax=php

" Mapping
nnoremap <S-u> :red <CR> " redo
" mapping move line
nnoremap <S-k> :m .-2<CR>==
nnoremap <S-j> :m .+1<CR>==
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv
" mapping save
:inoremap <c-s> <Esc>:update<CR>
:inoremap <c-s> <c-o>:update<CR>
nnoremap <C-s> :w<CR>
vmap <C-s> <esc>:w<CR>gv
" mapping change buffer (tab)
set hidden
nnoremap <C-N> :bnext<CR>   " next buffer
nnoremap <C-P> :bprev<CR>   " prev buffer
nnoremap <C-X> :bd<CR>      " close single buffer, if has changes needs ! to force
" mapping yank +
vnoremap <C-c> :yank + <CR> " copy to system clipboard in normal mode
nnoremap <C-c> :yank + <CR> " copy to system clipboard in visual mode
" Commenting blocks of code.
let b:comment_leader = '// '
autocmd FileType c,cpp,java,scala,php    let b:comment_leader = '// '
autocmd FileType sh,ruby,python          let b:comment_leader = '# '
autocmd FileType conf,fstab              let b:comment_leader = '# '
autocmd FileType tex                     let b:comment_leader = '% '
autocmd FileType mail                    let b:comment_leader = '> '
autocmd FileType vim                     let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>
" Insert new-line
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
" mapping join
vnoremap <C-j> :join <CR> " join line in normal mode
nnoremap <C-j> :join <CR> " join line in visual mode

" Add support for custom user settings
if filereadable(glob("~/.vimrc.local"))
    source ~/.vimrc.local
endif

" Add support for project-folder settings
if filereadable(glob(".project.vimrc")) 
    source .project.vimrc
endif

let g:ropevim_autoimport_modules = ["os.*","traceback","django.*"] 

let g:jedi#completions_command = "<C-Space>"
let g:jedi#auto_close_doc = 1

