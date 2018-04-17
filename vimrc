"Install plug first:
"
"unix:
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
"windows (power shell):
"md ~\vimfiles\autoload $uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' (New-Object Net.WebClient).DownloadFile( $uri, $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath("~\vimfiles\autoload\plug.vim" ))

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'kien/ctrlp.vim'
Plug 'craigemery/vim-autotag'
Plug 'vim-scripts/grep.vim'
Plug 'flazz/vim-colorschemes'
Plug 'terryma/vim-multiple-cursors'

call plug#end()

let mapleader=";"

nnoremap <F4> :Rgrep 
nnoremap <F8> :TagbarToggle<CR>
nnoremap <leader><leader>p gT
nnoremap <leader><leader>n gt
nnoremap <leader>e :NERDTreeToggle<CR>

let g:gitgutter_enabled = 1
let g:gitgutter_updatetime = 500

let g:autotagTagsFile =".tags"

let g:ctrlp_working_path_mode = 0

let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_start_word_key = '<C-n>'
let g:multi_cursor_select_all_word_key = '<C-b>'
let g:multi_cursor_start_key = 'g<C-n>'
let g:multi_cursor_select_all_key = 'g<C-b>'
let g:multi_cursor_next_key = '<C-n>'
let g:multi_cursor_prev_key = '<C-p>'
let g:multi_cursor_skip_key = '<C-x>'
let g:multi_cursor_quit_key = '<Esc>'

set tabstop=4
set shiftwidth=4
set expandtab

set notagrelative
set tag+=/tmp/tags,/tmp/.tags

colorscheme molokai
