" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'junegunn/fzf'                 " Fuzzy finder
Plug 'junegunn/fzf.vim'             " Fuzzy finder for Vim
Plug 'tpope/vim-commentary'         " gcc to comment out code
Plug 'tpope/vim-sensible'           " sensible defaults for vim
Plug 'BlakeWilliams/vim-pry'        " Allows leader + d to place a pry/debugger
Plug 'ludovicchabant/vim-gutentags' " Automatic ctag management
Plug 'rhysd/committia.vim'          " Better commit window management
Plug 'pbrisbin/vim-mkdir'           " Automatically create any non-existent directories before writing the buffer
Plug 'tpope/vim-fugitive'           " All the Git goodies
Plug 'tpope/vim-rhubarb'            " All the Hub goodies
Plug 'tpope/vim-surround'           " Quoting/parenthesizing made simple
Plug 'tpope/vim-endwise'            " Automatically end blocks
Plug 'justinmk/vim-sneak'           " Enhanced navigation
Plug 'AndrewRadev/splitjoin.vim'    " Switch between single-line and multiline forms of code
Plug 'mhinz/vim-signify'            " Show git diff in gutter
Plug 'thoughtbot/vim-rspec'         " Hotkeys to quicklaunch rspec tests
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-eunuch'

Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox' " Color theme

Plug 'dense-analysis/ale' " Async linting and formatting

Plug 'mileszs/ack.vim' " Enhanced search. Populates results in quickfix window

" Plug 'danchoi/ri.vim' " Search ruby docs for word under cursor

" Turn these on as needed
" Plug 'christoomey/vim-run-interactive'
" Plug 'janko-m/vim-test'
" Plug 'kchmck/vim-coffee-script'
" Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'
" Plug 'tpope/vim-bundler'
" Plug 'tpope/vim-projectionist'
" Plug 'tpope/vim-rake'
" Plug 'tpope/vim-repeat'
"
" Plug 'chriskempson/base16-vim'
"
" Plug 'tpope/vim-eunuch' " Vim sugar for unix commands
"
"
" Plug 'brooth/far.vim' " Multi-file search/replace
"
" " Syntax plugins
" Plug 'elzr/vim-json'
" Plug 'hashivim/vim-hashicorp-tools'
" Plug 'elmcast/elm-vim'
" Plug 'ekalinin/Dockerfile.vim'
" Plug 'jez/vim-github-hub'
" Plug 'JamshedVesuna/vim-markdown-preview'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
