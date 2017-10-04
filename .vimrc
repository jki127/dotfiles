set nocompatible " required by vundle
set mouse=a
set number

set guifont=Meslo\ LG\ L\ DZ\ Regular\ for\ Powerline:h18

set hidden
set autoindent
set copyindent
set showmatch
set ignorecase " ignore case when searching
set smartcase  " ignore case if search pattern is all lowercase
set smarttab "insert tabs on the start of a line according to shiftwidth, not tabstop
set incsearch "show search matches as you type
set colorcolumn=80
set backspace=indent,eol,start

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

filetype off " required by vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
"call vundle#rc(path)

" require by vundle
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between here and filetype plugin indent on.
" scripts on GitHub repos
Plugin 'tpope/vim-rails.git'
Plugin 'kchmck/vim-coffee-script'
Plugin 'itspriddle/vim-stripper'
Plugin 'bkad/CamelCaseMotion'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'drmikehenry/vim-fontsize'
Plugin 'neoclide/vim-jsx-improve'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'matze/vim-move'
" Tagbar requires ctags: https://github.com/universal-ctags/ctags
Plugin 'majutsushi/tagbar'
" Install tern server using npm install in ~/.vim/bundle/tern-for-vim
" Install exuberant ctags via `brew install ctags`
" Install jsctags alongside tern for more useful tagbar info: https://github.com/ramitos/jsctags
Plugin 'ternjs/tern_for_vim'
Plugin 'tpope/vim-surround'
Plugin 'mitermayer/vim-prettier'
Plugin 'Shougo/vimfiler.vim'
Plugin 'Shougo/unite.vim' " required by vimfiler
Plugin 'w0rp/ale'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'ervandew/supertab'
Plugin 'mkitt/tabline.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'rakr/vim-one' " OneLight/OneDark Color Scheme
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'

" scripts from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
Plugin 'FuzzyFinder'

" scripts not on GitHub

" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" ...
call vundle#end()

colorscheme one
set background=dark
filetype plugin indent on " required by vundle

set noswapfile
set tabstop=2 shiftwidth=2 expandtab
set hlsearch " turn on search highlighting
syntax enable

" VIMFiler Options
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_tree_leaf_icon = " "
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '✓'
let g:vimfiler_readonly_file_icon = '✗'
let g:vimfiler_time_format = '%m-%d-%y %H:%M:%S'
let g:vimfiler_expand_jump_to_first_child = 0
let g:vimfiler_ignore_pattern = '\.git\|\.DS_Store\|\.pyc'

nnoremap <space><space> :<C-u>VimFilerExplorer -split -simple -parent -winwidth=35 -toggle -no-quit<CR>
nnoremap <space>f :<C-u>VimFilerExplorer -split -simple -parent -winwidth=35 -no-quit -find<CR>
" Expand directory using Enter
autocmd FileType vimfiler nmap <silent><buffer><expr> <CR> vimfiler#smart_cursor_map(
\ "\<Plug>(vimfiler_expand_tree)",
\ "\<Plug>(vimfiler_edit_file)")
autocmd FileType vimfiler nunmap <buffer> x
autocmd FileType vimfiler nmap <buffer> x <Plug>(vimfiler_toggle_mark_current_line)
autocmd FileType vimfiler vmap <buffer> x <Plug>(vimfiler_toggle_mark_selected_lines)
autocmd FileType vimfiler nunmap <buffer> l
autocmd FileType vimfiler nmap <buffer> l <Plug>(vimfiler_cd_or_edit)
autocmd FileType vimfiler nmap <buffer> u <Plug>(vimfiler_switch_to_parent_directory)
autocmd FileType vimfiler nmap <buffer> <C-R> <Plug>(vimfiler_redraw_screen)
" Allow double-click to edit file
autocmd FileType vimfiler nmap <silent><buffer> <2-LeftMouse> <Plug>(vimfiler_expand_or_edit)
" Open files in new split/tab
autocmd FileType vimfiler nnoremap <silent><buffer><expr> s vimfiler#do_switch_action('vsplit')
autocmd FileType vimfiler nnoremap <silent><buffer><expr> h vimfiler#do_switch_action('split')
autocmd FileType vimfiler nnoremap <silent><buffer><expr> t vimfiler#do_action('tabopen')

"Close a quickfix list
nnoremap <Esc><Esc> :ccl<cr>

command Light set background=light
command Dark set background=dark

" Add default mappings
call camelcasemotion#CreateMotionMappings('<leader>')

" Airline config
set laststatus=2 " always show status bar (airline)
let g:airline_powerline_fonts = 1
let g:airline_theme='one'

" set vim-move key to Ctrl
let g:move_key_modifier = 'C'

" toggle tagbar with space-t
nmap <space>t :TagbarToggle<CR>

" Enable JSX Syntax Highlighing in javascript files
let g:jsx_ext_required = 0

" Enable sparkup plugin in JSX
autocmd FileType javascript.jsx runtime! ftplugin/html/sparkup.vim

" Prettier options
let g:prettier#config#single_quote = 'true'
let g:prettier#config#trailing_comma = 'es5'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'false'

" ALE Config
let g:ale_enabled = 0
let g:ale_open_list = 1
let g:ale_set_quickfix = 1
let g:airline#extensions#ale#enabled = 1

let g:javascript_prettier_options = '--single_quote true --trailing-comma es5 --no-bracket-spacing true --jsx-bracket-same-line false'

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'ruby': ['rubocop'],
\}

let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'ruby': ['rubocop'],
\}

"Highlight current line
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" Supertab config
let g:SuperTabDefaultCompletionType = "<c-n>"

" FZF config
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
let g:fzf_buffers_jump = 1
nnoremap <C-p> :FZF<CR>
