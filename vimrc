"Install plug first:
"
"unix:
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
"windows (power shell):
"md ~\vimfiles\autoload $uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' (New-Object Net.WebClient).DownloadFile( $uri, $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath("~\vimfiles\autoload\plug.vim" ))

call plug#begin('~/.vim/plugged')

" Ack search for vim
Plug 'mileszs/ack.vim'
" Snippets engine
Plug 'SirVer/ultisnips'
" Snippets repository
Plug 'honza/vim-snippets'
" Complete engine
Plug 'valloric/youcompleteme'
" TypeScript syntax
Plug 'leafgarland/typescript-vim'
" Comment lines easily
Plug 'scrooloose/nerdcommenter'
" Help to surround fragments of text with ', ", (), {}, []
Plug 'tpope/vim-surround'
" Status line
Plug 'vim-airline/vim-airline'
" Tagbar that groups functions, variables etc.
Plug 'majutsushi/tagbar'
" Easy motion, shorts command amount to the goal line
Plug 'easymotion/vim-easymotion'
" Git wrapper to ease workflow
Plug 'tpope/vim-fugitive'
" Make and compile
Plug 'tpope/vim-dispatch'
" Test runner
Plug 'janko-m/vim-test'
" Changes from git are marked with +/-/~
Plug 'airblade/vim-gitgutter'
" Fuzzy file search
Plug 'kien/ctrlp.vim'
" Generate tags with ctags automatically
Plug 'craigemery/vim-autotag'
" Grep wrapper
Plug 'vim-scripts/grep.vim'
" Color themes
Plug 'flazz/vim-colorschemes'
" Multiple cursors
Plug 'terryma/vim-multiple-cursors'
" Autoformater
Plug 'chiel92/vim-autoformat'
" Illuminate same words pointed by cursor
Plug 'rrethy/vim-illuminate'
" Show marks
Plug 'kshenoy/vim-signature'
" REST console
Plug 'diepm/vim-rest-console'
" Content alignment
Plug 'godlygeek/tabular'
" Enhanced vim diff
Plug 'chrisbra/vim-diff-enhanced'
" Diff directories
Plug 'will133/vim-dirdiff'
" Keep windows in golden ratio
Plug 'roman/golden-ratio'
" Choose window
Plug 't9md/vim-choosewin'
" Easy swap windows
Plug 'wesq3/vim-windowswap'
" Buffer management
Plug 'jeetsukumaran/vim-buffergator'
" Async run
Plug 'skywind3000/asyncrun.vim'
" Syntastic
Plug 'scrooloose/syntastic'

call plug#end()

if has("cscope")
    set cscopetag

    set csto=0

    if filereadable("cscope.out")
        cs add cscope.out
    elseif $CSCOPEDB != ""
        cs add $CSCOPEDB
    endif

    set cscopeverbose

    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

    nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>

    nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
endif

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<F3>"
let g:UltiSnipsJumpForwardTrigger="<F5>"
let g:UltiSnipsJumpBackwardTrigger="<F4>"

imap <F8> <C-R>=UltiSnips#ListSnippets()<CR>

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:ycm_autoclose_preview_window_after_completion = 1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

nnoremap ,s :SyntasticCheck<CR>
nnoremap ,r :SyntasticReset<CR>
nnoremap ,e :AsyncRun 
nnoremap ,t :Tabularize /

" Map <leader> to ;
let mapleader=";"

nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt

nnoremap * *``

nnoremap <leader>g :ChooseWin<CR>
nnoremap <leader>e :Explore<CR>
nnoremap <leader>t :Texplore<CR>

" Plug 'majutsushi/tagbar' configuration section
nnoremap <F8> :TagbarToggle<CR>

" Plug 'airblade/vim-gitgutter' configuration section
let g:gitgutter_enabled = 1
let g:gitgutter_updatetime = 500

" Plug 'kien/ctrlp.vim' configuration section
let g:ctrlp_working_path_mode = 0

" Plug 'craigemery/vim-autotag' configuration section
let g:autotagTagsFile =".tags"

let test#strategy = "dispatch"

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
silent! colorscheme molokai

hi illuminatedWord term=underline cterm=underline gui=underline
