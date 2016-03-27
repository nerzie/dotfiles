" Vundle first
" Moving around window
set nocompatible           
filetype off              

"  set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"  let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mileszs/ack.vim'
" Vundle ends here, all plugins must be above
call vundle#end()            
let mapleader=","
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>
set visualbell
set textwidth=80
set colorcolumn=+1

set laststatus=2
filetype plugin indent on   
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
end

" HTML editing
set matchpairs+=<:>
" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

"let g:airline_symbols.space = "\ua0"
let g:airline_theme='base16_solarized'
let g:airline_powerline_fonts=1
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = 'V'
let g:tagbar_usearrows = 0
let g:NERDTreeDirArrows=0

" Moving around windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nmap <F8> :TagbarToggle<CR>
nnoremap <F6> :NERDTreeToggle<CR>
 " Some magic with visual mode
vnoremap . :norm.<CR>
" Paste mode to disable auto-indent
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
" todo: copy/paste with clipboard
set number
"set relativenumber
set ignorecase
set smartcase
 " Common styled regex
nnoremap / /\v
vnoremap / /\v
 " Global search
set gdefault
 " Incremental search
set incsearch
set showmatch
 " Highlight results 
set hlsearch
 " Turn highlighting off
nnoremap <leader><space> :noh<cr>
 " Clear search
nnoremap <tab> %
vnoremap <tab> %
inoremap jk <ESC>
 " Make a vertical split and switch
nnoremap <leader>w <C-w>v<C-w>l
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
 " Highlight current line
set cursorline
 " Faster reaction
set ttyfast
 " Show typing command
set showcmd
syntax enable
set background=dark
colorscheme solarized
set encoding=utf-8
set ruler
 " Autocompletion
set wildmenu
 " Autocompletion style
set wildmode=longest:list,full
set laststatus=2 " 
 " Undo history save
set undofile
set autoindent
 " Repeat magic
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
" Temporary files paths 
" Save your backups to a less annoying place than the current directory.
" If you have .vim-backup in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/backup or . if all else fails.
if isdirectory($HOME . '/.vim/backup') == 0
  :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

"statusline setup
"set statusline =%#identifier#
set statusline+=[%f]    "tail of the filename
set statusline+=%*

"display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

"display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*
set statusline+=%h      "help file flag
set statusline+=%y      "filetype

"read only flag
set statusline+=%#identifier#
set statusline+=%r
set statusline+=%*

"modified flag
set statusline+=%#warningmsg#
set statusline+=%m
set statusline+=%*

set statusline+=%{fugitive#statusline()}

"display a warning if &et is wrong, or we have mixed-indenting
set statusline+=%#error#
"set statusline+=%{StatuslineTabWarning()}
set statusline+=%*

"set statusline+=%{StatuslineTrailingSpaceWarning()}

"set statusline+=%{StatuslineLongLineWarning()}

set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"display a warning if &paste is set
"set statusline+=%#error#
"set statusline+=%{&paste?'[paste]':''}
set statusline+=%*

set statusline+=%=      "left/right separator
set statusline+=%{StatuslineCurrentHighlight()}\ \ "current highlight
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set laststatus=2

" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif

"return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    else
        return '[' . name . ']'
    endif
endfunction
