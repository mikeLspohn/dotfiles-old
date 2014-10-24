" vim mode
set nocompatible
filetype off    " Required
" set for powerline view without split
set laststatus=2

" setup for powerline
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=16
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
let g:ycm_path_to_python_interpreter = '/usr/bin/python'

" omni completion on
filetype plugin on
set omnifunc=syntaxcomplete#Complete

"jslint use vundle
set rtp+={path}/powerline/bindings/vim
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


" plugins section
Plugin 'gmarik/vundle'    " Required
Plugin 'altercation/vim-colors-solarized' 
Bundle "myusuf3/numbers.vim"
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-easymotion'
Bundle "pangloss/vim-javascript"
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern_for_vim' 
Plugin 'terryma/vim-expand-region'
Plugin 'jelera/vim-javascript-syntax'
Bundle 'majutsushi/tagbar'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'Chiel92/vim-autoformat'
Plugin 'Tpope/vim-surround'
Plugin 'tomtom/tcomment_vim'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'

" set code folding for javascript (use zc/zo to toggle fold) 
set foldmethod=syntax
set foldlevelstart=1
let javaScript_fold=1  " JavaScript"

" F8 toggles tagbar
nmap <F8> :TagbarToggle<CR>

" YCM gives you popups and splits by default that some people might not
" like, so these should tidy it up a bit for you.
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

"runs jshint on file open with syntastic plugin 
let g:syntastic_check_on_open=1


filetype plugin indent on " Required

" set tab options
set expandtab
set shiftwidth=2
set softtabstop=2

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

" Some settings to enable the theme:
 set number
 syntax enable
 set background=dark
 "let g:solarized_termcolors=256  
 colorscheme solarized
