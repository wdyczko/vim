"This needs plug installed
"
"unix:
"
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
"windows:
"
"md ~\vimfiles\autoload
"$uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"(New-Object Net.WebClient).DownloadFile(
"  $uri,
"    $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath("~\vimfiles\autoload\plug.vim"
")
"          )
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

call plug#end()

noremap <Leader><Leader>n gt
noremap <Leader><Leader>p gT

let g:gitgutter_enabled = 0
