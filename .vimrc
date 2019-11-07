set nocompatible " required by vundle
set mouse=a
set number

set hidden
set autoindent
set copyindent
set showmatch
set ignorecase " ignore case when searching
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
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'bkad/CamelCaseMotion'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'drmikehenry/vim-fontsize'
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
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-commentary'
Plugin 'fatih/vim-go'
Plugin 'shmup/vim-sql-syntax'
Plugin 'vim-scripts/SQLUtilities'
Plugin 'lervag/vimtex'

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

" set vim-move key to Ctrl
let g:move_key_modifier = 'C'

" toggle tagbar with space-t
nmap <space>t :TagbarToggle<CR>

" Enable JSX Syntax Highlighing in javascript files
let g:jsx_ext_required = 0

" Prettier options
let g:prettier#exec_cmd_async = 1
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
\   'cpp': ['g++'],
\}

let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'ruby': ['rubocop'],
\   'cpp': ['clang-format'],
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
nnoremap K :Ag! <cword><cr>

" vim-one config
let g:airline_theme='one'
let g:one_allow_italics = 1
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif
hi Conceal ctermfg=245 guifg=245

" Enable sparkup in JSX
autocmd FileType javascript,jsx runtime! ftplugin/html/sparkup.vim

" Remove delay before opening newline 'O'
set timeoutlen=1000 ttimeoutlen=0

" Ignore these filetypes for autocomplete
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pdf,*.bak,*.beam,'/\./!d',*.txt,*.rtf

" Disable dynamic sql completion
let g:omni_sql_no_default_maps = 1

" Disable vim-polyglot for specified languages
let g:polyglot_disabled = ['latex']

" vimtex settings
let g:tex_flavor='latex'
let g:vimtex_view_method='skim'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" Settings for Haskell
" Set indentation to 4
autocmd FileType haskell setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
let g:haskell_indent_if = 4
let g:haskell_indent_case = 4
let g:haskell_indent_let = 4
let g:haskell_indent_where = 4
let g:haskell_indent_before_where = 4
let g:haskell_indent_after_bare_where = 4
let g:haskell_indent_do = 4
let g:haskell_indent_in = 4
let g:haskell_indent_guard = 4
let g:haskell_indent_case_alternative = 4

" vim-better-whitespace settings
let g:strip_whitespace_on_save = 1
let g:better_whitespace_enabled=0 " Don't highlight trailing whitespace
let g:strip_whitespace_confirm=0
