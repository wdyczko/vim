"Install plug first:
"
"unix:
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
"windows (power shell):
"md ~\vimfiles\autoload $uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' (New-Object Net.WebClient).DownloadFile( $uri, $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath("~\vimfiles\autoload\plug.vim" ))

call plug#begin('~/.vim/plugged')

" NERDTree explorer, visual explorer of file system
Plug 'scrooloose/nerdtree'
" Help to surround fragments of text with ', ", (), {}, []
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
Plug 'chiel92/vim-autoformat'
Plug 'rrethy/vim-illuminate'
Plug 'kshenoy/vim-signature'

call plug#end()


" Map <leader> to ;
let mapleader=";"

" Normal mapping, no remap if exists
" Map ;$number to tab jump
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader>h :call QuickHelp()<CR>
" Search word ticks back to word that you are on
nnoremap * *``

" Plug 'scrooloose/nerdtree' configuration section
" Map ;e to NERDTreeToggle
nnoremap <leader>e :NERDTreeToggle<CR>

" Plug 'tpope/vim-surround' configuration section

" Plug 'bling/vim-airline' configuration section

" Plug 'majutsushi/tagbar' configuration section
" Map <F8> to Tagbar toggle
nnoremap <F8> :TagbarToggle<CR>

" Plug 'easymotion/vim-easymotion' configuration section

" Plug 'tpope/vim-fugitive' configuration section

" Plug 'airblade/vim-gitgutter' configuration section
let g:gitgutter_enabled = 1
let g:gitgutter_updatetime = 500

" Plug 'kien/ctrlp.vim' configuration section
let g:ctrlp_working_path_mode = 0

" Plug 'craigemery/vim-autotag' configuration section
let g:autotagTagsFile =".tags"

" Plug 'vim-scripts/grep.vim' configuration section
" Map <F3> to Rgrep
nnoremap <F3> :Rgrep -I 

" Plug 'flazz/vim-colorschemes' configuration section

" Plug 'terryma/vim-multiple-cursors' configuration section
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_start_word_key = '<C-n>'
let g:multi_cursor_select_all_word_key = '<C-b>'
let g:multi_cursor_start_key = 'g<C-n>'
let g:multi_cursor_select_all_key = 'g<C-b>'
let g:multi_cursor_next_key = '<C-n>'
let g:multi_cursor_prev_key = '<C-p>'
let g:multi_cursor_skip_key = '<C-x>'
let g:multi_cursor_quit_key = '<Esc>'

" Plug 'chiel92/vim-autoformat' configuration section

" Plug 'rrethy/vim-illuminate' configuration section

" Plug 'kshenoy/vim-signature' configuration section

" Global configuration
set tabstop=4 " Tab stop after 4 spaces
set shiftwidth=4 " Length of shifting 4 spaces
set expandtab " Use 4 spaces when using <TAB>

" Set where to find tags, ctags properly generate required
set tag+=/tmp/tags,/tmp/.tags

" Set color scheme
colorscheme molokai

function! QH_surround()
    echo "\ncs\"' -> change \" to ' in current context"
endfunction

function! QuickHelp()
    echo "1. surround \n"
    let l:choose = input('Choose quickhelp: ', '')
    if l:choose == 1
        call QH_surround()
    endif
endfunction

