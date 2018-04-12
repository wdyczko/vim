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

call plug#end()

let mapleader=","

nnoremap <F8> :TagbarToggle<CR>
nnoremap <leader><leader>p gT
nnoremap <leader><leader>n gt

let g:gitgutter_enabled = 1
let g:gitgutter_updatetime = 500

set tabstop=4
set shiftwidth=4
set expandtab
