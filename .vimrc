set mouse=a
set number

colorscheme solarized
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h14

set hidden
set autoindent
set copyindent
set showmatch
set ignorecase " ignore case when searching
set smartcase  " ignore case if search pattern is all lowercase
set smarttab "insert tabs on the start of a line according to shiftwidth, not tabstop
set incsearch "show search matches as you type
set colorcolumn=80

set undolevels=1000 " remembers muchos levels of undo
set visualbell "don't beep
set noerrorbells "don't beep
set title "change the terminal title

set nobackup
set nowritebackup

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

set nocompatible              " be iMproved, required
filetype off                  " required

autocmd VimEnter * NERDTree
set background=light

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()
" alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

" The following are examples of different formats supported.
" Keep Plugin commands between here and filetype plugin indent on.
" scripts on GitHub repos
Plugin 'tpope/vim-rails.git'
Plugin 'kchmck/vim-coffee-script'
Plugin 'rking/ag.vim'
Plugin 'itspriddle/vim-stripper'
Plugin 'bkad/CamelCaseMotion'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'kien/ctrlp.vim'
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'scrooloose/syntastic'
Plugin 'drmikehenry/vim-fontsize'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'matze/vim-move'
" Tagbar requires ctags: https://github.com/universal-ctags/ctags
Plugin 'majutsushi/tagbar'
" Install tern server using npm install in ~/.vim/bundle/tern-for-vim
" Install jsctags alongside tern for more useful tagbar info: https://github.com/ramitos/jsctags
Plugin 'ternjs/tern_for_vim'

" scripts from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'The-NERD-tree'
Plugin 'Solarized'

" scripts not on GitHub

" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" ...

filetype plugin indent on     " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin commands are not allowed.
" Put your stuff after this line

set noswapfile
set tabstop=2 shiftwidth=2 expandtab
set hlsearch " turn on search highlighting
syntax enable

" make ctrlp use ag.vim
let g:ctrlp_user_command = 'Ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'

"Open NERDTree on space double-tap
nnoremap <space><space> :NERDTreeToggle<cr>
"Open NERDTree with current file highlighted on space-f
nnoremap <space>f :NERDTreeFind<cr>

"Close a quickfix list (ex: Ag)
nnoremap <Esc><Esc> :ccl<cr>

let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' } "make CtrlP faster with py-matcher
let g:ctrlp_lazy_update = 350 " Set delay to prevent extra search
" Do not clear filenames cache, to improve CtrlP startup
" You can manualy clear it by <F5>
let g:ctrlp_clear_cache_on_exit = 0
" Set no file limit
let g:ctrlp_max_files = 0

" Prevent silver_searcher from auto-opening first result
ca Ag Ag!
ca ag Ag!
ca AG Ag!

""
command Light set background=light
command Dark set background=dark

" Add default mappings
call camelcasemotion#CreateMotionMappings('<leader>')

" Syntastic recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" turn off html syntax warnings
let g:syntastic_html_tidy_quiet_messages = { "level" : ["warnings"] }

" always show status bar (airline)
set laststatus=2
" Airline config
let g:airline_powerline_fonts = 1

" set vim-move key to Ctrl
let g:move_key_modifier = 'C'

" toggle tagbar with space-t
nmap <space>t :TagbarToggle<CR>
