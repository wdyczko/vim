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
" Status line
Plug 'bling/vim-airline'
" Tagbar that groups functions, variables etc.
Plug 'majutsushi/tagbar'
" Easy motion, shorts command amount to the goal line
Plug 'easymotion/vim-easymotion'
" Git wrapper to ease workflow
Plug 'tpope/vim-fugitive'
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

call plug#end()


" Map <leader> to ;
let mapleader=";"

" Normal mapping, no remap if exists
" Map ;$number to tab jump nnoremap <leader>1 1gt
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

hi illuminatedWord term=underline cterm=underline gui=underline

function! QH_command(msg)
    echohl PreProc
    echon a:msg
    echon "\t"
    echohl None
endfunction

function! QH_description(msg)
    echon "->\t"
    echon a:msg
    echon "\n"
endfunction

function! QH_precondition(msg)
    echohl Identifier
    echon "\n["
    echon a:msg
    echon "]\n"
    echohl None
endfunction

function! QH_surround()
    echo "\n\n"
    call QH_command("cs\"'")
    call QH_description("change \" to ' in current context")
    call QH_command("ds\"")
    call QH_description("delete \" in current context")
    call QH_command("ysiw)")
    call QH_description("create () in current context, iw is motion command full word")
    call QH_command("S)")
    call QH_description("create () on selected text")
    call QH_command("yss\"")
    call QH_description("create \" on current line")
endfunction

function! QH_easymotion()
    call QH_precondition("<leader><leader> = ;;")
    call QH_command("backward/forward")
    call QH_description("description")
    call QH_command("b\t/\tw")
    call QH_description("Beginning of word")
    call QH_command("ge\t/\te")
    call QH_description("End of word")
    call QH_command("F\t/\tf")
    call QH_description("Find {char}")
    call QH_command("s\t\t")
    call QH_description("Find {char} both direction")
endfunction

function! QH_line(command, description)
    call QH_command(a:command)
    call QH_description(a:description)
endfunction

function! QH_fugitive()
    call QH_precondition("Useful only on git projects")
    call QH_line(":Glog", "show logs - git log")
    call QH_line(":Gstatus", "show current changes - git status")
    call QH_line(":Gdiff", "diff with the top of working tree - git diff")
    call QH_line(":Ggrep", "grep working tree - git grep")
    call QH_line(":Gread", "revert changes - git checkout -- filename")
    call QH_line(":Gwrite", "stage file - git add")
    call QH_line(":Gblame", "blame somebody - git blame")
    call QH_line(":Gcommit", "commit current changes - git commit")
endfunction

function! QH_ctrlp()
    call QH_precondition("Fuzzy search")
    call QH_line("ctrl+p", "open searching")
    call QH_line("ctrl+d", "toggle fullpath/filename")
    call QH_line("ctrl+r", "toggle string/regexp")
    call QH_line("ctrl+f", "next search mode")
    call QH_line("ctrl+b", "previous search mode")
    call QH_line("shift+tab", "switch focus")
    call QH_line("ctrl+k/ctrl+j", "selection up/down")
    call QH_line("<cr>/ctrl+t/ctrl+v/ctrl+x", "open current/tab/vertical/horizontal")
    call QH_line("ctrl+z", "mark file")
    call QH_line("ctrl+o", "open marked files")
endfunction

function! QH_multicursor()
    call QH_precondition("Multiple cursors")
    call QH_line("ctrl+b", "mark all words")
    call QH_line("ctrl+n", "mark next word")
    call QH_line("ctrl+x", "skip word")
endfunction

function! QH_autoformat()
    call QH_precondition("Autoformatter, external tools needs to be installed")
    call QH_line(":Autoformat", "format with default formatter")
    call QH_line(":Autoformat json", "format with json")
endfunction

function! QH_diff()
    call QH_precondition("Difference mode")
    call QH_line(":diffs {filename}", "diff current to the {filename}")
    call QH_line(":diffupdate", "force update if changes does not match")
    call QH_line("[c/]c", "backward/forward diff")
    call QH_line(":diffget/do", "diff obtain")
    call QH_line(":diffput/dp", "diff put")
endfunction

function! QH_misc()
    call QH_precondition("Misc")
    call QH_line(":copen", "open quick fix list")
    call QH_line(":lopen", "open location fix")
endfunction

function! QuickHelp()
    echo "1. surround \n"
    echo "2. easymotion \n"
    echo "3. fugitive \n"
    echo "4. ctrlp \n"
    echo "5. multicursors \n"
    echo "6. formatting \n"
    echo "7. diff \n"
    echo "0. misc \n"
    let l:choose = input('Choose quickhelp: ', '')
    if l:choose == 1
        call QH_surround()
    elseif l:choose == 2
        call QH_easymotion()
    elseif l:choose == 3
        call QH_fugitive()
    elseif l:choose == 4
        call QH_ctrlp()
    elseif l:choose == 5
        call QH_multicursor()
    elseif l:choose == 6
        call QH_autoformat()
    elseif l:choose == 7
        call QH_diff()
    elseif l:choose == 0
        call QH_misc()
    endif
endfunction

