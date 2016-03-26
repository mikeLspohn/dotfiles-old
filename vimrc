"
" Author: Michael Spohn
" File: .vimrc 
" Github: https://github.com/mikeLspohn/dotfiles/vimrc

" Vim Config{{
  " No need for vi compatibility
  set nocompatible
  filetype off    " Required for vundle to run
  
  " Airline and tmuxline config
  set laststatus=2                               " Show filename in statusbar
  let g:airline_powerline_fonts=1                " Enable airline fonts 
  let g:airline#extensions#tmuxline#enabled = 0  " tmuxline extensions
  set guifont=Inconsolata-g\ for\ Powerline:h15  " Patched font for airline
  
  " Locations for swp and backup files
  " TODO: Make sure these are created is this is first time using this vimrc
  set backupdir=~/dotfiles/vim/backup/
  set directory=~/dotfiles/vim/swap/
  set undodir=~/dotfiles/vim/undo/
  
  " encoding
  set encoding=utf-8
  set termencoding=utf-8
  set t_Co=256
  set fillchars+=stl:\ ,stlnc:\
  
  "Match tmux screen (can use xterm but tmux.conf needs changed if so)
  set term=screen-256color
  
  " highlight Normal ctermbg=NONE
  " highlight nonText ctermbg=NONE
  set incsearch   " Find as you type search
  set hlsearch    " Highlight search terms
  set ignorecase  " Case insensitive search
  set smartcase   " Case sensitive when upper case characters are present
  
  " omni completion on
  set omnifunc=syntaxcomplete#Complete
  
  "ejs syntax set to html
  au BufNewFile,BufRead *.ejs set filetype=html
  
  "autocomplete filepaths
  set wildmode=longest,list,full
  set wildmenu
  
  "allow backspace in insert mode
  set backspace=indent,eol,start
  
  set rtp+=~/.vim/bundle/Vundle.vim
"}}
  
" Vundle{{
  call vundle#begin()
  
  " plugins section
  " TODO: Pretty sure I don't use all of these. Need some cleanup
    Plugin 'gmarik/vundle'    " Required
    
    " Navigation
    Plugin 'scrooloose/nerdtree'
    Plugin 'Lokaltog/vim-easymotion'
    Plugin 'kien/ctrlp.vim'
  
    " Syntax/Formatting
    Plugin 'scrooloose/syntastic'
    Plugin 'jelera/vim-javascript-syntax'
    Bundle "pangloss/vim-javascript"
    Plugin 'briancollins/vim-jst'
    Plugin 'digitaltoad/vim-jade'
    Plugin 'othree/html5.vim'
    Plugin 'Chiel92/vim-autoformat'
    Plugin 'heartsentwined/vim-emblem'
    
    " Utilities
    Plugin 'mattn/emmet-vim'
    Plugin 'tomtom/tcomment_vim'
    Plugin 'janko-m/vim-test'
    Bundle "myusuf3/numbers.vim"
    Plugin 'Raimondi/delimitMate'
  
    " Git
    Plugin 'tpope/vim-fugitive'
    
    " Rails/Ruby
    Plugin 'tpope/vim-rails'
    
    " Colors/UI
    Plugin 'NLKNguyen/papercolor-theme'
    "
    " Airline/TMUX
    Plugin 'bling/vim-airline'
    Plugin 'edkolev/tmuxline.vim'
    Plugin 'christoomey/vim-tmux-navigator'
  
  call vundle#end()
  filetype plugin indent on
"}}

" Plugin settings{{
  " Tab completion keys
  " TODO: Not using ycm anymore. Do I need these?
  let g:ycm_key_list_select_completion = ['<C-n>', '<Down>'] " ctrl+n goes down the list
  let g:ycm_key_list_previous = ['<C-p>', '<up>']            " ctrl+p goes up the list
  let g:SuperTabDefaultCompletionType = '<C-n>'              " ctrl+n without ycm
  
  " Easy motion highlight colors
  hi link EasymMotionTarget ErrorMsg
  hi link EasyMotionShade comment
  
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
  
  " Custom indentations for specified filetypes
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
  
  " Let :grep use ack instead so it can be supa fast
  set grepprg=ack
"}}


" set tab options{{
  set tabstop=4
  set shiftwidth=2
  set expandtab
  set softtabstop=2
  set autoindent
  set smartindent
"}}


" key remappings{{
  "toggle relative numbers with F3
  nnoremap <F3> :NumbersToggle<CR>
  
  :inoremap jk  <esc> 
  nnoremap <C-e> ::NERDTreeToggle<cr>
  
  " ctrl-c split lines between braces
  imap <C-c> <CR><Esc>O
  
  "remap : to ; for easier :Commands
  nnoremap ; :
  
  "Easy motion key mappings
  nmap s <Plug>(easymotion-s)
  
  "Vim-test key mappings
  nmap <silent> ,t :TestNearest<CR>
  nmap <silent> ,T :TestFile<CR>

  " remove search hl with backspace
  nmap <silent> <BS> :nohlsearch<CR>
"}}

" Theme settings{{
  set number
  syntax enable
  set background=light
  colorscheme PaperColor
"}}

" I always end up back at solarized, so keep this here
" set background=dark
" let g:solarized_termcolors=16  
" colorscheme solarized

