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
"Plug 'ycm-core/YouCompleteMe', { 'do': 'python3 ./install.py --clang-completer --ts-completer' }
" Use the Tabnine fork - their completion engine is straight fire
" ensure node and npm are installed (or remove ts-completer)
" Deprecated. nvim-only now
"Plug 'tabnine/YouCompleteMe', { 'do': 'python3 ./install.py --clang-completer --ts-completer' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-tsserver', {'do': 'pnpm install'}
Plug 'neoclide/coc-json', {'do': 'pnpm install'}
Plug 'neoclide/coc-yaml', {'do': 'pnpm install'}
Plug 'neoclide/coc-prettier', {'do': 'pnpm install'}
Plug 'neoclide/coc-eslint', {'do': 'pnpm install'}
Plug 'neoclide/coc-snippets', {'do': 'pnpm install'}
Plug 'neoclide/coc-lists', {'do': 'pnpm install'}

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Plug 'arcticicestudio/nord-vim'

Plug 'github/copilot.vim'

Plug 'godlygeek/tabular'
Plug 'Raimondi/delimitMate'
"Plug 'scrooloose/nerdcommenter'
"Plug 'scrooloose/nerdtree'
Plug 'dense-analysis/ale'
Plug 'sjl/gundo.vim'
Plug 'bkad/CamelCaseMotion'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'airblade/vim-gitgutter'
"Plug 'msanders/snipmate.vim'
Plug 'koron/nyancat-vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb' " GBrowse handler (github)
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
" CodeClimate :)
"Plug 'wfleming/vim-codeclimate'
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
"Plug 'rainerborene/vim-reek', { 'for': 'ruby' }
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
"let g:nord_cursor_line_number_background = 1
" Remove the underline from enabling cursorline:
"highlight clear CursorLine

" Reek
let g:reek_always_show = 0
let g:reek_on_loading = 0

""""""""""
" vim-airline
let g:airline_powerline_fonts = 0
let g:airline_theme='deus'
"let g:airline_theme='nord'

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
autocmd FileType javascript let b:delimitMate_matchpairs="(:),[:],{:}"

""""""""""
" Fugitive
"set statusline+=%{fugitive#statusline()}

""""""""""
" ALE
let g:ale_lint_on_text_changed = 'normal' " Only lint while in normal mode
let g:ale_lint_on_insert_leave = 1        " Automatically lint when leaving insert mode
"let g:ale_linters_explicit = 1            " Only use linters that are explicitly set
"let g:ale_fix_on_save = 1                 " Automatically fix files on save

" Override 'prettier' fixer to use prettierd
let g:ale_javascript_prettier_executable = 'prettierd'
let g:ale_typescript_prettier_executable = 'prettierd'
let g:ale_json_prettier_executable = 'prettierd'
let g:ale_yaml_prettier_executable = 'prettierd'

let g:ale_fixers = {
\   'css':  ['prettier'],
\   'json': ['prettier'],
\   'yaml': ['prettier'],
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'typescriptreact': ['prettier'],
\}

"""""""""
" eslint_d
let $ESLINT_D_PPID = getpid()
let g:ale_javascript_eslint_executable = 'eslint_d'
let g:ale_javascript_eslint_use_global = 1

"""""""""
" Copilot
let g:copilot_no_tab_map = v:true " Disable tab mapping for Copilot
inoremap <expr> <C-J> copilot#Accept("\<C-J>")

""""""""""
" COC
let g:airline#extensions#coc#enabled = 1    " Enable airline extension

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
"inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

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

if exists('pastetoggle')
  set pastetoggle=<F3>
endif

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
"colorscheme nord " For vim-airline
colorscheme cotingale
set t_Co=256
set t_ut=


" git stuff
"augroup vim_config
"  autocmd FileType gitrebase call LoadGitrebaseBindings()
"augroup END
