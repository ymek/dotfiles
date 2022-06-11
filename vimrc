""""""""""
" Config variables used urrywhurr
let softab    = "on"
let tabsize   = 2
let arrowkeys = "off"
let gui_font  = "Monaco:h12"
let mapleader = ","

" Matchit for better delimiter matching
runtime macros/matchit.vim

source ~/.vimrc-defaults
source ~/.vimrc-helpers
source ~/.vimrc-keymaps


call plug#begin('~/.vim/plugged')

" These need to come first, in this order
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
" Use the Tabnine fork - their completion engine is straight fire
" ensure node and npm are installed (or remove ts-completer)
Plug 'tabnine/YouCompleteMe', { 'do': './install.py --clang-completer --ts-completer' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'arcticicestudio/nord-vim'

Plug 'godlygeek/tabular'
Plug 'Raimondi/delimitMate'
"Plug 'scrooloose/nerdcommenter'
"Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'
Plug 'sjl/gundo.vim'
Plug 'bkad/CamelCaseMotion'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'airblade/vim-gitgutter'
"Plug 'msanders/snipmate.vim'
Plug 'koron/nyancat-vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
" CodeClimate :)
"Plug 'wfleming/vim-codeclimate'
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'rainerborene/vim-reek', { 'for': 'ruby' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee'}
Plug 'Keithbsmiley/swift.vim', { 'for': 'swift' }
Plug 'tbastos/vim-lua', { 'for': 'lua' }
Plug 'mustache/vim-mustache-handlebars', { 'for': 'html.mustache' }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'html'] }

call plug#end()

" Source *after* plugins to ensure local autocmd > plugin autocmd
source ~/.vimrc-au

" default: 'jquery,underscore,backbone'
let g:used_javascript_libs = 'jquery,handlebars'

""""""""""
" Oddly, vim-coffeee-script requires these to be here
" and completely breaks if they're pre-enabled by vimrc-defaults
filetype plugin indent on
syntax on

""""""""""
" vim-nord
let g:nord_cursor_line_number_background = 1

""""""""""
" vim-airline
let g:airline_powerline_fonts = 0
"let g:airline_theme='deus'
let g:airline_theme='nord'

""""""""""
" NetRW
let g:netrw_banner = 1 " enable/disable banner
let g:netrw_liststyle = 3 " tree view
"let g:netrw_browse_split = 2 " open new files in vertical split

""""""""""
" Delimit Mate
let delimitMate_visual_leader = ","
" Ruby-specific(ish); avoids lolwut with '<' and '>'
autocmd FileType ruby let b:delimitMate_matchpairs="(:),[:],{:}"

""""""""""
" Fugitive
"set statusline+=%{fugitive#statusline()}

""""""""""
" ALE
let g:ale_lint_on_text_changed = 'normal' " Only lint while in normal mode
let g:ale_lint_on_insert_leave = 1        " Automatically lint when leaving insert mode

""""""""""
" GUndo
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

""""""""""
" General Config

" Reduce font line height
"set lsp=0

set pastetoggle=<F3>

""""""""""
" Support chruby
set shell=$SHELL

""""""""""
" Support fzf
set rtp+=/usr/local/opt/fzf

" Strip Windows line endings
map <F7> :perldo s/\cM//

" Clear searches with C/
map <C-/> :nohl <CR>

" i_CTRL-X_CTRL-U matchers for minitest
set completefunc=syntaxcomplete#Complete

" Improve buffer resizing. alt-shift and hold the key
:nmap <esc>> :vertical res +1^M
:nmap <esc>< :vertical res -1^M
:nmap <esc>+ :res +1^M
:nmap <esc>- :res -1^M

"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
"set statusline+=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

"colorscheme ir_black
"colorscheme cotingale
colorscheme nord
set t_Co=256
set t_ut=


" git stuff
"augroup vim_config
"  autocmd FileType gitrebase call LoadGitrebaseBindings()
"augroup END
