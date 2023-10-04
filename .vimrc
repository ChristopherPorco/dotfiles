filetype on        " Enable type file detection. Vim will be able to try to detect the type of file in use
filetype plugin on " Enable plugins and load plugin for the detected file type
filetype indent on " Load an indent file for the detected file type

set mouse=a        " Place cursor on current mouse location
set nocompatible   " Disable compatibility with vi which can cause unexpected issues
set number         " Line numbering
set relativenumber " Relative line numbering, except current line
"set cursorline     " Highlight cursor line underneath the cursor horizontally
"set cursorcolumn   " Highlight cursor line underneath the cursor vertically
set shiftwidth=4   " Set shift width to 4 spaces
set tabstop=4      " Set tab width to 4 columns
set expandtab      " Use space characters instead of tabs
set nowrap         " Do not wrap lines. Allow long lines to extend as far as the line goes
set incsearch      " While searching though a file incrementally highlight matching characters as you type
set showmatch      " Show matching words during a search
set hlsearch       " Use highlighting when doing a search
set history=1000   " Set the commands to save in history (default 20)
set ic             " Ignore case when doing a search

set autoread
au CursorHold * checktime 

" Note - should work if you upgrade vim to latest verson
set shortmess-=S   " Give a count of matches when doing a search

syntax on " Turn syntax highlighting on

" Map U to redo
nnoremap U <C-R> 

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes
Plug 'scrooloose/nerdtree'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
