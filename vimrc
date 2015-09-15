" vim mode
set nocompatible
filetype off    " Required

" set for powerline view without split
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline#extensions#tmuxline#enabled = 0
"let g:tmuxline_powerline_separators=0

"Locations for swp and backup files
set backupdir=~/dotfiles/vim/backup/
set directory=~/dotfiles/vim/swap/
set undodir=~/dotfiles/vim/undo/

" setup for powerline
set guifont=Inconsolata-g\ for\ Powerline:h15
" let g:Powerline_symbols = 'fancy'
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
set omnifunc=syntaxcomplete#Complete

"ejs syntax set to html
au BufNewFile,BufRead *.ejs set filetype=html

"autocomplete filepaths
set wildmode=longest,list,full
set wildmenu

"allow backspace in insert mode
set backspace=indent,eol,start

"jslint use vundle
" set rtp+={path}/powerline/bindings/vim
set rtp+=~/.vim/bundle/Vundle.vim/
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
" Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'Chiel92/vim-autoformat'
Plugin 'Tpope/vim-surround'
Plugin 'tomtom/tcomment_vim'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'briancollins/vim-jst'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'digitaltoad/vim-jade'
" Plugin 'Yggdroot/indentLine'
Plugin 'othree/html5.vim'
Plugin 'bling/vim-airline'
Plugin 'edkolev/tmuxline.vim'
Plugin 'burnettk/vim-angular'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

call vundle#end()
"makes snippets work
filetype plugin indent on

let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous = ['<C-p>', '<up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

let g:UltiSnipsSnippetDirectories = ['~/dotfiles/vim/bundle/vim-snippets/UltiSnips/', './UltiSnips']

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardsTrigger = '<s-tab>'



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

"make ctrl-p faster
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'

" set tab options
set tabstop=4
set shiftwidth=2
set expandtab
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
" map ,p :! clear && php %<CR>

" Some settings to enable the theme:
set number
syntax enable
set background=dark
let g:solarized_termcolors=16  
colorscheme solarized
" colorscheme beekai
