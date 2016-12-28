call plug#begin('~/.config/nvim/plugged')

Plug 'rhysd/committia.vim'

" Paper color theme
Plug 'NLKNguyen/papercolor-theme'

" Zoom into window with <C-w>o
Plug 'troydm/zoomwintab.vim'

" Ack-like plugin
Plug 'wincent/ferret'

" Ctrl P
Plug 'ctrlpvim/ctrlp.vim'

" Dash
Plug 'rizzatti/dash.vim'

" Editor Config
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-scripts/PreserveNoEOL'

" Emmet
Plug 'mattn/emmet-vim'

" Deoplete is similar to neocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'Konfekt/FastFold'

" Syntastic
Plug 'vim-syntastic/syntastic'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Go
Plug 'fatih/vim-go'
Plug 'zchee/deoplete-go'

" Git gutter
Plug 'airblade/vim-gitgutter'

" Find and Replace in project
Plug 'brooth/far.vim'

" Elixir related stuff
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'powerman/vim-plugin-AnsiEsc' " For better documentation display

" Cool substitue replacement
Plugin 'osyo-manga/vim-over'

" Makes . play nice with other plugins
Plugin 'tpope/vim-repeat'

" Surround text objects
Plugin 'tpope/vim-surround'

" Better javascript
Plugin 'pangloss/vim-javascript'

" Narrow region
Plugin 'chrisbra/NrrwRgn'

" Official moustache vim plugin
" Plugin 'mustache/vim-mustache-handlebars'
Plugin 'joukevandermaas/vim-ember-hbs'

" Follow My Lead
" Type <Leader>fml to see the mappings with leader
Plugin 'ktonga/vim-follow-my-lead'

call plug#end()

set ruler    " shows ROW,COL at bottom right corner
set number   " shows line numbers
set relativenumber " shows relative number to simplify movement commands
" set nowrap " dissables linewrapping
set background=dark " Soy Darksssss
set guifont=Inconsolata\ for\ Powerline

" Saves time
nmap <space> :

" Set <leader> key
let mapleader = ","

set encoding=utf-8
set showcmd " display incomplete commands

" Does not recognize lines in file that modify vim behaviour
set modelines=0

" Tab settings
set tabstop=4 " number of visual spaces per TAB
set shiftwidth=4
set softtabstop=4 " number of spaces in tab when editing
set expandtab " tabs are spaces
set backspace=indent,eol,start

" Fix for solidus deface files
" TODO: To be removed completely in a year
" au BufRead,BufNewFile *.deface set filetype=eruby

" Keep it sane
set cursorline " highlight current line
set hidden " allows to open a file in a buffer without saving current one
set scrolloff=3 " number of lines guaranteed below and above cursor
set showmode " shows current vim mode in status line
set undofile
set visualbell
set wildmenu "visual autocomplete for menu
set wildmode=list:longest

" If all letters are lower case, search
" is case-insensitive. Otherwise, search
" is case-sesitive
set ignorecase
set smartcase

" Global substitution by default
set gdefault

" Highlight search result as I type
" hlsearch and incsearch are set by default
set showmatch

" Clear current search with , + space
" clearmatches is needed for region plugin
nnoremap <leader><space> :nohlsearch<cr>:call clearmatches()<cr>

" Paste toggle for large chunks of text
set pastetoggle=<F2>

set lazyredraw " redraw only when need to (i.e. faster long-executed macros)

" Folding
set foldenable " enable folding
set foldlevelstart=10 " first draft
set foldnestmax=10 " max nesting for folding
set foldmethod=syntax

" Copy and paste to system clipboards
vmap <Leader>y "*y
vmap <Leader>d "*d
nmap <Leader>p "*p
nmap <Leader>P "*P
vmap <Leader>p "*p
vmap <Leader>P "*P

" Configure regexes to use normal ones.
nnoremap / /\v
vnoremap / /\v

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
" Any combination of j + k
imap jk <ESC>
imap Jk <ESC>
imap JK <ESC>
" Missed ESC... Ouch!
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

"" Rails es6 files
au BufRead,BufNewFile *.js.es6 setfiletype javascript

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:→\ ,eol:⁋

"" Source the init.vim file after saving it
"" Commented because does not work well with neovim + vim-plug
"if has("autocmd")
"  autocmd bufwritepost init.vim source $MYVIMRC
"endif

" Color Scheme
set t_Co=256
colorscheme PaperColor

" Remove backup files
set nobackup       " no backup files
set nowritebackup  " only in case you don't want a backup file while editing
set noswapfile     " no swap files

" Persistent undo
" This makes all *.un~ files to be stored in ~/.undodir
if has("persistent_undo")
    set undodir='~/.undodir/'
    set undofile
endif

" Explorer configuration
map <Leader>k :Vexplore<CR>
let g:netrw_liststyle=3

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
" If the value is 0, committia.vim always attempts to open committia's buffer when
" COMMIT_EDITMSG buffer is opened. If you use vim-fugitive, I recommend to set this
" value to 1. The default value is 1.
let g:committia_open_only_vim_starting=0

" CtrlP

"let g:ctrlp_map = '<c-p>' " Mapping
"let g:ctrlp_cmd = 'CtrlP' " Command
":nmap <leader>p :CtrlPBuffer<CR>

" Working directory settings
" 'c' - the directory of the current file.
" 'r' - the nearest ancestor that contains one of these directories or files: .git .hg .svn .bzr _darcs
" 'a' - like c, but only if the current working directory outside of CtrlP is not a direct ancestor of the directory of the current file.
" 0 or '' (empty string) - disable this feature.
let g:ctrlp_working_path_mode = 'ra'
" Ignore some files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/bower_components/*,*/dist/*,*/cordova/*,*/public/spree/*
"let g:ctrlp_match_func = { 'match': 'ctrlp#luamatcher#Match' }

" deoplete
let g:deoplete#enable_at_startup = 1
" use smartcase
let g:deoplete#enable_smart_case = 1
" minimum syntax keyword length
let g:deoplete#sources#syntax#min_keyword_length = 3
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags


" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_theme='molokai'

" Cursor shape temporary measure
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Elixir configuration
let g:alchemist#elixir_erlang_src = "~/.config/alchemist/autocomplete"
let g:alchemist_iex_term_size = 15
let g:alchemist_iex_term_split = 'split'

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
