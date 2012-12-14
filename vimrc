" 
" Configure vim to suck less
"
let softab    = "on"
let tabsize   = 4
let arrowkeys = "off" 			" Enable this if you like to use the arrow keys to move. I highly discourage you.
let gui_font  = "Monaco:h12"
let mapleader = ","

source ~/.vimrc-defaults

" Feel free to edit the files below (helpers functions, autocommands and key shortcuts)
source ~/.vimrc-helpers
source ~/.vimrc-au
source ~/.vimrc-keymaps

colorscheme ir_black

" Default bundles
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'msanders/snipmate.vim'
Bundle 'godlygeek/tabular'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-surround'
Bundle 'bkad/CamelCaseMotion'

Bundle 'Raimondi/delimitMate.git'
let delimitMate_visual_leader = ","

Bundle 'tpope/vim-fugitive'
"set statusline+=%{fugitive#statusline()}

Bundle 'scrooloose/syntastic'
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
Bundle 'koron/nyancat-vim'


"""
" Custom _m stuff

Bundle 'sjl/gundo.vim'
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

set background=light
set background=dark
set pastetoggle=<F3>
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
"set statusline+=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set shiftwidth=2 tabstop=2 softtabstop=2
set lsp=0
set mouse-=a

" wildmenu
set wildmenu
set wildmode=list:longest
set wildchar=<Tab>
set wildcharm=<C-Z>
nnoremap <F10> :b <C-Z>

" Strip Windows line endings
map <F7> :perldo s/\cM//

" Clear searches with C/
map <C-/> :nohl <CR>

" Highlight the current line in insert mode
autocmd InsertLeave * se nocul 
autocmd InsertEnter * se cul

" automatically return to previous line number
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" extra syntax highlighting
au BufNewFile,BufRead *.mxml set filetype=mxml
au BufNewFile,BufRead *.as set filetype=actionscript

" Improve buffer resizing. alt-shift and hold the key
:nmap <esc>> :vertical res +1^M
:nmap <esc>< :vertical res -1^M
:nmap <esc>+ :res +1^M
:nmap <esc>- :res -1^M

