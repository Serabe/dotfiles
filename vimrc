set nocompatible
filetype off
syntax off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'rhysd/committia.vim'

" Zoom into window with <C-w>o
Plugin 'troydm/zoomwintab.vim'

" Ack-like plugin
Plugin 'wincent/ferret'

" Ctrl P
Plugin 'kien/ctrlp.vim'
Plugin 'nickhutchinson/ctrlp-luamatcher'

" Dash
Plugin 'rizzatti/dash.vim'

" Buffergator
Plugin 'jeetsukumaran/vim-buffergator'

" Editor Config
Plugin 'editorconfig/editorconfig-vim'

" Emmet
Plugin 'mattn/emmet-vim'

" Neocomplete
Plugin 'Shougo/neocomplete.vim'

" Syntastic
Plugin 'scrooloose/syntastic'

" Required by some plugins
Plugin 'tomtom/tlib_vim'

" Undo tree visualization
Plugin 'mbbill/undotree'

" More utility functions
Plugin 'vim-scripts/vim-addon-mw-utils'

" Airline
Plugin 'bling/vim-airline'

" fuGITive
Plugin 'tpope/vim-fugitive'

" Cool substitue replacement
Plugin 'osyo-manga/vim-over'

" Makes vim play nicely with iTerm 2 and tmux
Plugin 'sjl/vitality.vim'

" Makes . play nice with other plugins
Plugin 'tpope/vim-repeat'

" Surround text objects
Plugin 'tpope/vim-surround'

" Paper color theme
Plugin 'NLKNguyen/papercolor-theme'

" Better javascript
Plugin 'pangloss/vim-javascript'

" Narrow region
Plugin 'chrisbra/NrrwRgn'

" Official moustache vim plugin
Plugin 'mustache/vim-mustache-handlebars'

" Elixir plugin
Plugin 'elixir-lang/vim-elixir'

" Follow My Lead
" Type <Leader>fml to see the mappings with leader
Plugin 'ktonga/vim-follow-my-lead'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
syntax on

set ruler    " shows ROW,COL at bottom right corner
set number   " shows line numbers
" set nowrap " dissables linewrapping
set background=dark " Soy Darksssss
set guifont=Inconsolata\ for\ Powerline

" Saves time
nmap <space> :

set encoding=utf-8
set showcmd " display incomplete commands

set modelines=0

" Tab settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set backspace=indent,eol,start
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal cinoptions+=+0 tabstop=2 shiftwidth=2 softtabstop=2

" Keep it sane
set scrolloff=3
set autoindent
set showmode
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set laststatus=2
set relativenumber
set undofile

" Paste toggle for large chunks of text
set pastetoggle=<F2>

" Set <leader> key
let mapleader = ","

" Copy and paste to system clipboards
vmap <Leader>y "*y
vmap <Leader>d "*d
nmap <Leader>p "*p
nmap <Leader>P "*P
vmap <Leader>p "*p
vmap <Leader>P "*P

" Map code completion to leader+tab
imap <Leader><tab> <C-x><C-o>

" Configure regexes to use normal ones.
nnoremap / /\v
vnoremap / /\v

" If all letters are lower case, search
" is case-insensitive. Otherwise, search
" is case-sesitive
set ignorecase
set smartcase

" Global substitution by default
set gdefault

" Highlight search result as I type
set incsearch
set showmatch
set hlsearch

" Clear current search with , + space
nnoremap <leader><space> :nohlsearch<cr>:call clearmatches()<cr>

" Use tab instead of % to match bracket pairs
nnoremap <tab> %
vnoremap <tab> %

" Handle long lines
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

" Force me to go back to normal mode
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Auto saving
au FocusLost * :wa " Save after losing focus
set autowrite " write when switching files
set autoread  " read automagically from disk

" Faster escape settings
imap jk <ESC>
imap Jk <ESC>
imap JK <ESC>
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" ,W remove trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Move around splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Red color for trailing spaces in insert mode
if has("autocmd")
  highlight ExtraWhitespace guibg=#330000 ctermbg=52
  au ColorScheme * highlight ExtraWhitespace guibg=#330000 ctermbg=52
  au BufEnter * match ExtraWhitespace /\s\+$/
  au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  au InsertLeave * match ExtraWhiteSpace /\s\+$/
endif

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:→\ ,eol:⁋

"" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
  autocmd bufwritepost vimrc source $MYVIMRC " My vimrc has no point
endif

" CtrlP

"let g:ctrlp_map = '<c-p>' " Mapping
"let g:ctrlp_cmd = 'CtrlP' " Command
:nmap <leader>p :CtrlPBuffer<CR>

" Working directory settings
" 'c' - the directory of the current file.
" 'r' - the nearest ancestor that contains one of these directories or files: .git .hg .svn .bzr _darcs
" 'a' - like c, but only if the current working directory outside of CtrlP is not a direct ancestor of the directory of the current file.
" 0 or '' (empty string) - disable this feature.
let g:ctrlp_working_path_mode = 'ra'
" Ignore some files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/bower_components/*
"let g:ctrlp_match_func = { 'match': 'ctrlp#luamatcher#Match' }

" Color Scheme
set t_Co=256
colorscheme PaperColor

" Remove backup files
set nobackup       " no backup files
set nowritebackup  " only in case you don't want a backup file while editing
set noswapfile     " no swap files

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_theme='molokai'

" Git Gutter
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" Persisten undo
" This makes all *.un~ files to be stored in ~/.undodir
if has("persistent_undo")
    set undodir='~/.undodir/'
    set undofile
endif

" Undotree config
let g:undotree_WindowLayout = 2
let g:undotree_SetFocusWhenToggle = 1
imap <Leader>u :UndotreeToggle<cr>
nmap <Leader>u :UndotreeToggle<cr>
vmap <Leader>u :UndotreeToggle<cr>

" Explorer configuration
map <Leader>k :Vexplore<CR>
let g:netrw_liststyle=3

" neocomplete
let g:neocomplete#enable_at_startup = 1
" use smartcase
let g:neocomplete#enable_smart_case = 1
" minimum syntax keyword length
let g:neocomplete#sources#syntax#min_keyword_length = 3
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Configure Dash lookup
:nmap <silent> <leader>d <Plug>DashSearch

" Configure mustache
let g:mustache_abbreviations = 0

" commitia

" You can get the information about the windows with first argument as a dictionary.
"
"   KEY              VALUE                      AVAILABILITY
"-----------------------------------------------------------------------------------
"   vcs            : vcs type (e.g. 'git')   -> all hooks
"   edit_winnr     : winnr of edit window    -> ditto
"   edit_bufnr     : bufnr of edit window    -> ditto
"   diff_winnr     : winnr of diff window    -> ditto
"   diff_bufnr     : bufnr of diff window    -> ditto
"   status_winnr   : winnr of status window  -> all hooks except for 'diff_open' hook
"   status_bufnr   : bufnr of status window  -> ditto

let g:committia_hooks = {}
function! g:committia_hooks.edit_open(info)
    " Additional settings
    setlocal spell

    " If no commit message, start with insert mode
    if a:info.vcs ==# 'git' && getline(1) ==# ''
        startinsert
    end

    " Scroll the diff window from insert mode
    " Map <C-n> and <C-p>
    imap <buffer><C-n> <Plug>(committia-scroll-diff-down-half)
    imap <buffer><C-p> <Plug>(committia-scroll-diff-up-half)
endfunction

" Over functions
function! VisualFindAndReplace()
    :OverCommandLine%s/
    :w
endfunction
function! VisualFindAndReplaceWithSelection() range
    :'<,'>OverCommandLine s/
    :w
endfunction
nnoremap <Leader>fr :call VisualFindAndReplace()<CR>
xnoremap <Leader>fr :call VisualFindAndReplaceWithSelection()<CR>

" If the value is 0, committia.vim always attempts to open committia's buffer when
" COMMIT_EDITMSG buffer is opened. If you use vim-fugitive, I recommend to set this
" value to 1. The default value is 1.
let g:committia_open_only_vim_starting=0

" Better javascript syntax
let g:javascript_enable_domhtmlcss=1
set cole=1
let g:javascript_conceal_function   = "ƒ"
let g:javascript_conceal_null       = "ø"
let g:javascript_conceal_this       = "@"
let g:javascript_conceal_return     = "⇚"
let g:javascript_conceal_undefined  = "¿"
let g:javascript_conceal_NaN        = "ℕ"
let g:javascript_conceal_prototype  = "¶"
let g:javascript_conceal_static     = "•"
let g:javascript_conceal_super      = "Ω"
