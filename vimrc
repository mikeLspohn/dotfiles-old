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
  "set term=xterm-256color
  "set termguicolors
  
  " highlight Normal ctermbg=NONE
  " highlight nonText ctermbg=NONE
  set incsearch   " Find as you type search
  set hlsearch    " Highlight search terms
  set ignorecase  " Case insensitive search
  set smartcase   " Case sensitive when upper case characters are present
  
  " omni completion on
  set omnifunc=syntaxcomplete#Complete
  
  " ejs syntax set to html
  au BufNewFile,BufRead *.ejs set filetype=html
  
  " autocomplete filepaths
  set wildmode=longest,list,full
  set wildmenu
  
  "allow backspace in insert mode
  set backspace=indent,eol,start

  " Something weird is going on when I switch from insert to normal mode.
  " TODO: Figure out what's wrong and fix it without the hack
  set whichwrap=
  
  set rtp+=~/.vim/bundle/vundle/
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
  
    " git
    Plugin 'mhinz/vim-signify'

    Plugin 'majutsushi/tagbar'
    Plugin 'ternjs/tern_for_vim'
    Plugin 'moll/vim-node'
    Plugin 'mhinz/vim-startify'

    " Syntax/Formatting
    Plugin 'scrooloose/syntastic'
    Plugin 'jelera/vim-javascript-syntax'
    Bundle "pangloss/vim-javascript"
    Plugin 'briancollins/vim-jst'
    Plugin 'digitaltoad/vim-jade'
    Plugin 'othree/html5.vim'
    Plugin 'Chiel92/vim-autoformat'
    Plugin 'heartsentwined/vim-emblem'
    Plugin 'leafgarland/typescript-vim'
    Plugin 'isRuslan/vim-es6'
    Plugin 'fatih/vim-go'
    Plugin 'mxw/vim-jsx'
    Plugin 'elixir-lang/vim-elixir'
    Plugin 'slashmili/alchemist.vim'
    Plugin 'elmcast/elm-vim'
    Plugin 'reasonml-editor/vim-reason'
    Plugin 'prettier/vim-prettier'
    
    " Utilities
    Plugin 'mattn/emmet-vim'
    Plugin 'tomtom/tcomment_vim'
    Plugin 'janko-m/vim-test'
    Bundle "myusuf3/numbers.vim"
    Plugin 'Raimondi/delimitMate'
    Plugin 'JamshedVesuna/vim-markdown-preview'
    Plugin 'diepm/vim-rest-console'
    Plugin 'benmills/vimux'
    Plugin 'thoughtbot/vim-rspec'
    Plugin 'tpope/vim-dispatch'
    Plugin 'rizzatti/dash.vim'

    " Snippets
    Plugin 'justinj/vim-react-snippets'
    Plugin 'MarcWeber/vim-addon-mw-utils'
    Plugin 'tomtom/tlib_vim'
    Plugin 'garbas/vim-snipmate'
    Plugin 'SirVer/ultisnips'
  
    " Git
    Plugin 'tpope/vim-fugitive'
    
    " Rails/Ruby
    Plugin 'tpope/vim-rails'
    
    " Colors/UI
    Plugin 'NLKNguyen/papercolor-theme'
    Plugin 'gorodinskiy/vim-coloresque'
    Plugin 'zanglg/nova.vim'
    
    " Airline/TMUX
    Plugin 'bling/vim-airline'
    Plugin 'edkolev/tmuxline.vim'
    Plugin 'christoomey/vim-tmux-navigator'

    " Code Analysis/Linters
    Plugin 'wfleming/vim-codeclimate'
    " Plugin 'wookiehangover/jshint.vim'

    " Notes
    Plugin 'vimwiki/vimwiki'
    Plugin 'xolox/vim-notes'
    Plugin 'xolox/vim-misc'
  
  call vundle#end()
  filetype plugin indent on
"}}

" Plugin settings{{
  " Tab completion keys
  " TODO: Not using ycm anymore. Do I need these?
  let g:ycm_key_list_select_completion = ['<C-n>', '<Down>'] " ctrl+n goes down the list
  let g:ycm_key_list_previous = ['<C-p>', '<up>']            " ctrl+p goes up the list
  let g:SuperTabDefaultCompletionType = '<C-n>'              " ctrl+n without ycm

  " Markdown preview
  let vim_markdown_preview_hotkey='<C-m>'
  let vim_markdown_preview_browser='Google Chrome'
  let vim_markdown_preview_github=1

  let g:opamshare = substitute(system('opam config var share'),'\n$','','')
  execute "set rtp+=" . g:opamshare . "/merlin/vim"

  " Javascript linting
  set statusline+=%warningmsg#
  set statusline+=%{SyntasticStatusLineFlag()}
  set statusline+=%*

  let g:syntastic_javascript_checkers = ['standard', 'eslint']
  let g:prettier#config#semi = 'false'
  
  " Easy motion highlight colors
  hi link EasymMotionTarget ErrorMsg
  hi link EasyMotionShade comment
  
  "CtrlP
  let g:ctrlp_map = '<c-p>'
  let g:ctrlp_cmd = 'CtrlP'

  "Ultisnips
  let g:UltiSnipsExpandTrigger="<c-t>"
  let g:UltiSnipsJumpForwardTrigger="<c-f>"
  let g:UltiSnipsJumpBackwardTrigger="<c-z>"
  
  "syntastic check with ctrl y
  let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
  nnoremap <C-y> :SyntasticCheck<CR> :SyntasticToggleMode<CR>
  
  " YCM gives you popups and splits by default that some people might not
  " like, so these should tidy it up a bit for you.
  let g:ycm_add_preview_to_completeopt=0
  let g:ycm_confirm_extra_conf=0
  set completeopt-=preview
  
  " Custom indentations for specified filetypes
  :let g:html_indent_inctags = "body,head,tbody"
  :let g:php_indent_inctags = "html,body,head"
  let g:jsx_ext_required = 0

  nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
  
  "make ctrl-p faster
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
        \ --ignore .git
        \ --ignore .svn
        \ --ignore .hg
        \ --ignore .DS_Store
        \ --ignore "**/*.pyc"
        \ -g ""'
  
  " vim-test
  let test#strategy = "vimux"

  " vim-rspec (using vim-dispatch)
  let g:rspec_command = "Dispatch rspec {spec}"
  map <Leader>T :call RunCurrentSpecFile()<CR>
  map <Leader>t :call RunNearestSpec()<CR>

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

  " go formatting
  au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
  
  " elm formatting
  au BufNewFile,BufRead *.elm setlocal noet ts=4 sw=4 sts=4


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

  set t_Co=256
  set background=dark
  "colorscheme nova
  let g:solarized_termcolors=16
  colorscheme solarized
  " set background=light
  " colorscheme PaperColor
"}}

hi Search cterm=NONE ctermfg=grey ctermbg=blue



" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
