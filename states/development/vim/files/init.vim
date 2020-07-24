if &compatible
  set nocompatible
endif

let mapleader=","

set mouse=""
set encoding=utf-8

let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0

set title
set nowrap

set cursorline
set cursorcolumn

set tabstop=2
set shiftwidth=2
set shiftround
set softtabstop=2
set expandtab

set backspace=indent,eol,start

set autoindent
set copyindent

set number
set relativenumber

set showmatch
set ignorecase
set smartcase
set smarttab
set hlsearch
set incsearch

"
set wildmenu

" Stop creating backup and swap files
set noswapfile
set nobackup
set nowb

nnoremap <esc> :noh<return>

" Required:
set runtimepath+={{ grains.homedir }}/.dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('{{ grains.homedir }}/.dein')
  call dein#begin('{{ grains.homedir }}/.dein')

  " Let dein manage dein
  " Required:
  call dein#add('{{ grains.homedir }}/.dein/repos/github.com/Shougo/dein.vim')

  " The Shougo collection
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/neomru.vim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/unite.vim')

  " Tabs & Panes
  call dein#add('christoomey/vim-tmux-navigator')

  " VimFiler
  call dein#add('Shougo/vimfiler.vim')

  " UI
  call dein#add('mhinz/vim-startify')
  call dein#add('chriskempson/base16-vim')
  call dein#add('arcticicestudio/nord-vim')
  call dein#add('altercation/vim-colors-solarized')
  call dein#add('mhinz/vim-janah')
  call dein#add('dracula/vim')
  call dein#add('morhetz/gruvbox')
  call dein#add('romainl/flattened')

  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')

  call dein#add('ntpeters/vim-better-whitespace')
  call dein#add('junegunn/goyo.vim')
  call dein#add('junegunn/limelight.vim')

  " Finders
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })

  " Fluent Editing
  call dein#add('editorconfig/editorconfig-vim')
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-repeat')
  call dein#add('Valloric/MatchTagAlways')
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('tpope/vim-endwise')
  call dein#add('easymotion/vim-easymotion')
  call dein#add('haya14busa/incsearch.vim')
  call dein#add('haya14busa/incsearch-easymotion.vim')

  call dein#add('elzr/vim-json')

  call dein#add('mileszs/ack.vim')

  " Git
  call dein#add('tpope/vim-fugitive')
  call dein#add('lambdalisue/gina.vim')
  call dein#add('jreybert/vimagit')

  call dein#add('mhinz/vim-signify')
  call dein#add('mattn/gist-vim')

  " Only load language files when inside a file of that language
  call dein#add('sheerun/vim-polyglot')

  "
  call dein#add('xolox/vim-misc')

  call dein#add('craigemery/vim-autotag')
  call dein#add('xolox/vim-easytags')

  " Ale
  call dein#add('w0rp/ale')

  " Elixir
  call dein#add('elixir-lang/vim-elixir')
  call dein#add('slashmili/alchemist.vim')
  call dein#add('c-brenn/phoenix.vim')

  " Pony
  call dein#add('jakwings/vim-pony')

  " Go
  call dein#add('fatih/vim-go')

  " Docker
  call dein#add('ekalinin/dockerfile.vim')

  " GraphQL
  call dein#add('jparise/vim-graphql')

  " SaltStack
  call dein#add('saltstack/salt-vim')
  call dein#add('lepture/vim-jinja')

  " PHP / Symfony
  call dein#add('StanAngeloff/php.vim')
  call dein#add('lumiliet/vim-twig')
  call dein#add('Glench/Vim-Jinja2-Syntax')
  call dein#add('2072/PHP-Indenting-for-VIm')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif

" Automatically strip trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end
" tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

" GitGutter
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1
let g:gitgutter_max_signs = 1500
let g:gitgutter_diff_args = '-w'

" custom symbols
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = ':'

" color overrrides
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green ctermbg=237
highlight GitGutterChange ctermfg=yellow ctermbg=237
highlight GitGutterDelete ctermfg=red ctermbg=237
highlight GitGutterChangeDelete ctermfg=red ctermbg=237

" Fuzzy-find with fzf
"""
" fzf
"""
let $FZF_DEFAULT_COMMAND= 'ag -g ""'

let g:fzf_buffers_jump = 1
nnoremap <Leader><TAB> :Buffers<CR>

nmap <Leader>c  :Commits<cr>
nmap <Leader>bc :BCommits<cr>
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(blue)%C(bold)%cr%C(white)"'

let g:fzf_tags_command = 'ctags -R --exclude deps,vendor,_build'

map <C-p> :GFiles<cr>
nmap <C-p> :GFiles<cr>

map <C-r> :BTags<cr>
nmap <C-r> :BTags<cr>

set background=dark
syntax enable
" Only turn this on for base16 themes
let base16colorspace=256
colorscheme base16-materia

" Spelling
set spell spelllang=en_gb
set complete+=kspell

" VimFiler
call vimfiler#custom#profile('default', 'context', { 'safe' : 0 })
let g:loaded_netrwPlugin = 1
nnoremap <leader>t :VimFilerExplorer -winwidth=45<CR>
nnoremap <leader>f :VimFilerExplorer -find -winwidth=45<CR>

let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '↯'
let g:vimfiler_tree_closed_icon = '➟'
let g:vimfiler_file_icon = '•'
let g:vimfiler_marked_file_icon = '✓'
let g:vimfiler_readonly_file_icon = '✗'

autocmd! FileType vimfiler call s:my_vimfiler_settings()
function! s:my_vimfiler_settings()
  nmap <buffer> <Space> <Plug>(vimfiler_expand_tree)
  nmap <buffer> <Right> <Plug>(vimfiler_expand_or_edit)
  nmap <buffer> <Left>  <Plug>(vimfiler_smart_h)
  nmap <buffer> `       <Plug>(vimfiler_toggle_mark_current_line)
endfunction

" Gina
nnoremap <buffer> <leader>gs :Gina status<cr>
nnoremap <buffer> <leader>gc :Gina commit<cr>
nnoremap <buffer> <leader>gp :Gina push<cr>

" Goyo & Limelight
let g:goyo_width="60%"
let g:goyo_height="80%"
let g:limelight_paragraph_span = 0

" Ag / Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Better Splits
set splitbelow
set splitright

let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-Left> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-Down> :TmuxNavigateDown<cr>
nnoremap <silent> <C-Up>   :TmuxNavigateUp<cr>
nnoremap <silent> <C-Right> :TmuxNavigateRight<cr>

" Startify
let g:startify_list_order = ['dir', 'commands']

" IncSearch
set hlsearch
let g:incsearch#auto_nohlsearch = 1

map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

set noshowmode
set laststatus=2
let g:airline#extensions#tabline#enabled = 0
let g:airline_powerline_fonts = 1
let g:airline_theme = "base16"

let g:vimfiler_safe_mode_by_default = 0
let g:rainbow_active = 1
let g:vim_json_syntax_conceal = 0

" tmux like commands
nmap <C-a>n :tabnew term://$SHELL<cr>i
nmap <leader>n :tabnew<cr>

nmap <leader><right> :vs<cr>
nmap <leader><down> :sp<cr>

nmap <C-a><right> :vs term://$SHELL<cr>i
nmap <C-a><down> :sp term://$SHELL<cr>i

nmap <C-S-left> :tabprevious<cr>
nmap <C-S-right> :tabnext<cr>

" Neosnippets
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" Neovim's Terminal Mode
nmap <leader>z :below 10sp term://$SHELL<cr>i