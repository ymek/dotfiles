""""""""""
" Config variables used urrywhurr
let softab    = "on"
let tabsize   = 2
let arrowkeys = "off"
let gui_font  = "Monaco:h12"
let mapleader = ","
let g:airline_powerline_fonts = 1

" Matchit for better delimiter matching
runtime macros/matchit.vim

source ~/.vimrc-defaults
source ~/.vimrc-helpers
source ~/.vimrc-keymaps


call plug#begin('~/.vim/plugged')

" These need to come first, in this order
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'bling/vim-airline'

Plug 'godlygeek/tabular'
Plug 'Raimondi/delimitMate'
"Plug 'scrooloose/nerdcommenter'
"Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'sjl/gundo.vim'
Plug 'bkad/CamelCaseMotion'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'airblade/vim-gitgutter'
"Plug 'msanders/snipmate.vim'
Plug 'koron/nyancat-vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
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
" Powerline
set rtp+=$HOME/.vim/bundle/powerline/powerline/bindings/vim

""""""""""
" Delimit Mate
let delimitMate_visual_leader = ","

""""""""""
" Fugitive
"set statusline+=%{fugitive#statusline()}

""""""""""
" Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

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
colorscheme cotingale
set t_Co=256
set t_ut=


" git stuff
"augroup vim_config
"  autocmd FileType gitrebase call LoadGitrebaseBindings()
"augroup END
