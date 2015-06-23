" vim mode
set nocompatible
filetype off    " Required
" set for powerline view without split
set laststatus=2

"Locations for swp and backup files
set backupdir=~/dotfiles/vim/backup//
set directory=~/dotfiles/vim/swap/
set undodir=~/dotfiles//vim/undo//

" setup for powerline
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set termencoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
"Match tmux screen (can use xterm but tmux.conf needs changed if so)
set term=screen-256color
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
let g:ycm_path_to_python_interpreter = '/usr/bin/python'

" omni completion on
filetype plugin on
set omnifunc=syntaxcomplete#Complete

"ejs syntax set to html
au BufNewFile,BufRead *.ejs set filetype=html

"autocomplete filepaths
set wildmode=longest,list,full
set wildmenu

"jslint use vundle
set rtp+={path}/powerline/bindings/vim
set rtp+=~/.vim/bundle/Vundle/
call vundle#begin()


" plugins section
Plugin 'gmarik/vundle'    " Required
Bundle "myusuf3/numbers.vim"
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-easymotion'
Bundle "pangloss/vim-javascript"
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jelera/vim-javascript-syntax'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'Chiel92/vim-autoformat'
Plugin 'Tpope/vim-surround'
Plugin 'tomtom/tcomment_vim'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'briancollins/vim-jst'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'digitaltoad/vim-jade'
Plugin 'Yggdroot/indentLine'
Plugin 'othree/html5.vim'

call vundle#end()

hi link EasymMotionTarget ErrorMsg
hi link EasyMotionShade comment

" set code folding for javascript (use zc/zo to toggle fold) 
set foldmethod=syntax
set foldlevelstart=1
let javaScript_fold=1  " JavaScript"


"CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"syntastic check with ctrl w
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

" YCM gives you popups and splits by default that some people might not
" like, so these should tidy it up a bit for you.
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

"runs jshint on file open with syntastic plugin 
let g:syntastic_check_on_open=1
let g:syntastic_javascript_checkers = ['eslint'] " syntasic use eslint


filetype plugin indent on " Required
:let g:html_indent_inctags = "body,head,tbody"
:let g:php_indent_inctags = "html,body,head"

" set tab options
set expandtab
set tabstop=4
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent

" key remappings 

"toggle relative numbers with F3
nnoremap <F3> :NumbersToggle<CR>

" set remap esc to jk 
:inoremap jk  <esc>

" toggle nerdtree with ctrl-e
nnoremap <C-e> ::NERDTreeToggle<cr>

" ctrl-c split lines between braces
imap <C-c> <CR><Esc>O

"js-beautify (html,css also) f2
noremap <F2> :Autoformat<CR><CR>

"remap : to ; for easier :Commands
nnoremap ; :

"Easy motion key mappings
nmap s <Plug>(easymotion-s)

" hotkey to run php in terminal for easy output
map ,p :! clear && php %<CR>

" Some settings to enable the theme:
set number
syntax enable
set background=dark
"let g:solarized_termcolors=256  
colorscheme beekai
