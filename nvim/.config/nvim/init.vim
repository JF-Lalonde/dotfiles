"
"  __       __ __           __
" |__.-----|__|  |_  .--.--|__.--------.
" |  |     |  |   _|_|  |  |  |        |
" |__|__|__|__|____|__\___/|__|__|__|__|
"
"
"
" source plugin file
so ~/.config/nvim/plugins.vim
" Sensible has some nice defaults, but make sure we load it first
" so everything in this file overrides it
runtime! ~/.local/share/nvim/plugged/vim-commentary/plugin/commentary.vim

" Set leader key to space
let mapleader = " "
" Enter in normal mode saves
nmap <CR> :w!<CR>
" Don't change enter functionality in quickfix window
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

set updatetime=100 " set a fast refresh rate for things like vim-signify

" Hitting esc clears search
nnoremap <esc> :noh<return><esc>

command! Q q " Bind :Q to :q
command! Qa qa " Bind :Qa to :qa

" Use older vim.fugitive syntax
command Gbla Git blame

set wildignore+=*/node_modules/* " Don't search inside Node.js modules

set hlsearch        " highlight search terms
set incsearch       " show search matches as you type
set ignorecase      " turn off case-sensitive default so smartcase can work
set smartcase       " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab        " insert tabs on the start of a line according to shiftwidth, not tabstop
set shiftwidth=2    " Move 2 spaces with < >
set expandtab       " Uses spaces instead of tabs
set tabstop=2       " Move 2 spaces when hitting <Tab>
set autowriteall    " Automatically save files when switching buffers

" Maintain undo history between sessions
set undofile
set undodir=$HOME/tmp/vimundo
set undolevels=1000
set undoreload=10000

" Switch between the last two files
nnoremap <Leader><Leader> <C-^>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Try to show more context when scrolling
set scrolloff=5
set sidescrolloff=10

set mouse=a " Allow mouse functions

" Make yank stick things on the macOS clipboard
let s:uname = system("uname")
if s:uname == "Darwin\n"
  set clipboard=unnamed
else
  set clipboard+=unnamedplus
endif

autocmd BufWritePre * :%s/\s\+$//e " Strip trailing whitespace on save

autocmd VimResized * wincmd = " On window resize, re-balance the splits

" Use jj as alternate to <Esc>
inoremap jj <Esc>

" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
" TODO: Remove these since they are also defined in vimrc file
" nmap <silent> t<C-n> :TestNearest<CR> " t Ctrl+n
" nmap <silent> t<C-f> :TestFile<CR>    " t Ctrl+f
" nmap <silent> t<C-s> :TestSuite<CR>   " t Ctrl+s
" nmap <silent> t<C-l> :TestLast<CR>    " t Ctrl+l
" nmap <silent> t<C-g> :TestVisit<CR>   " t Ctrl+g

" set t_Co=256
" set background=dark
" highlight Normal ctermbg=Red
" highlight nonText ctermbg=Red
"
" "Make highlighting readable
" set hlsearch
" hi Search ctermbg=Red

" FZF
let g:fzf_buffers_jump = 1 " jump to buffer if possible
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'down': '~20%' }
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow -g "!{node_modules/*,.git/*,vendor/**}"' " use ripgrep
nmap <C-t> :FZF<CR>
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Airline
" let g:airline_powerline_fonts=1
" let g:airline_theme='deus'
" let g:airline_solarized_bg='dark'
let g:airline#extensions#tabline#enabled = 1

" Hide the filetype section (section 'y')
let g:airline#extensions#default#layout = [
    \ [ 'a', 'b', 'c' ],
    \ [ 'x',      'z', 'error', 'warning' ]
    \ ]

" Show buffer number, and allow shortcuts to jump to tabs
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>[ <Plug>AirlineSelectPrevTab
nmap <leader>] <Plug>AirlineSelectNextTab


" vim-json
" Disable quote concealing
let g:vim_json_syntax_conceal = 0

" less noisy opposing parens
hi MatchParen cterm=bold ctermbg=none ctermfg=Red

" Turn off vi compatibility
set nocompatible

set smartindent
set autoindent

" load indent file for the current filetype
filetype indent on

"Set up netrw for NERDTree-likeness
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 2
let g:netrw_altv = 1
let g:netrw_winsize = 20

" Disable spellcheck that somehow is turned on by default
" set nospell

" binding.pry shortcut
nmap <leader>d :call pry#insert()<cr>


" ALE linter

let g:airline#extensions#ale#enabled = 1

" Move between linting errors
" nnoremap ]r :ALENextWrap<CR>
" nnoremap [r :ALEPreviousWrap<CR>

" Make ALE highlighting underlined
highlight ALEWarning cterm=underline,bold ctermfg=magenta
highlight ALEError cterm=underline,bold ctermfg=magenta

" Let ALE autocorrect
" let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_ruby_rubocop_auto_correct_all = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
" let g:ale_lint_delay = 0

" cnoreabbrev Fix ALEFix
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   'ruby':       ['rubocop'],
\   'javascript': ['eslint'],
\   'css':        ['prettier']
\}

" let g:ale_linters_explicit = 1
" let g:ale_lint_on_enter = 1
" let g:ale_lint_on_save = 1
" let g:ale_lint_on_insert_leave = 1
let g:ale_linters_ignore = {
\   'ruby':       ['brakeman'],
\}

set termguicolors " support true color terminal
autocmd vimenter * ++nested colorscheme gruvbox

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<Tab>"
    else
        return "\<C-p>"
    endif
endfunction
inoremap <Tab> <C-r>=InsertTabWrapper()<CR>
inoremap <S-Tab> <C-n>

" Make it obvious where 140 characters is
set textwidth=140
set colorcolumn=+1

" set nowrap " Don't wrap lines

" Line Numbers
set number
set numberwidth=5

" Move cursor to new split
set splitbelow
set splitright

" Allow multiple instances of a file to be edited
set noswapfile

 " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

" Ctrl-c deletes buffer without losing split
nnoremap <C-c> :bp\|bd #<CR>

" Spell-check Markdown files and commits
autocmd FileType markdown setlocal spell
autocmd FileType gitcommit setlocal spell

" ack.vim --- {{{

" Use ripgrep for searching ⚡️
" Options include:
" --vimgrep -> Needed to parse the rg response properly for ack.vim
" --type-not sql -> Avoid huge sql file dumps as it slows down the search
" --smart-case -> Search case insensitive if all lowercase pattern, Search case sensitively otherwise
let g:ackprg = 'rg --vimgrep --smart-case -g "!{vendor,yarn.lock}"'

" Auto close the Quickfix list after pressing '<enter>' on a list item
let g:ack_autoclose = 1

" Any empty ack search will search for the work the cursor is on
let g:ack_use_cword_for_empty_search = 1

" Don't jump to first match
cnoreabbrev Ack Ack!

" Maps <leader>/ so we're ready to type the search keyword
nnoremap K :Ack! <cword><cr>
" }}}

" Use backslash for global search w/ripgrep
nnoremap \ :Ack!<SPACE>

" Navigate quickfix list with ease
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_command = "!bundle exec rspec {spec}"

" Auto-create alternate file if it's missing (usually spec file)
command AC :execute "e " . eval('rails#buffer().alternate()')
