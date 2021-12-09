let mapleader = "\<Space>"

" auto install vim-plug and plugins
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" https://github.com/chrisbra/matchit extends % funcs for if, else if, else, endif keywords in vary p. languages
:packadd! matchit

call plug#begin('~/.vim/plugged')

"" MUST BE

Plug 'honza/vim-snippets'
" advanced welcome screen
Plug 'mhinz/vim-startify'

Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-repeat'

" colorscheme
Plug 'morhetz/gruvbox'

Plug 'dyng/ctrlsf.vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-projectionist'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-endwise'
Plug 'rlue/vim-barbaric'

"" PROBABLY USEFULL
" multi cursor

Plug 'AndrewRadev/splitjoin.vim'
" database access
Plug 'tpope/vim-dadbod'
Plug 'jpalardy/vim-slime', {'branch': 'main'}
Plug 'editorconfig/editorconfig-vim'
Plug 'puremourning/vimspector'
Plug 'wellle/targets.vim'

Plug 'nvim-lua/plenary.nvim'
Plug 'windwp/nvim-spectre'


""LANGAUGE SPECIFIC

Plug 'sheerun/vim-polyglot'

Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'

Plug 'dhruvasagar/vim-table-mode'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

Plug 'ekalinin/Dockerfile.vim'

" \ 'coc-docker', https://github.com/neoclide/coc.nvim/pull/2756
" \ 'coc-tabnine',
" https://github.com/phpactor/coc-phpactor use when become popular
let g:coc_global_extensions = [
      \ 'coc-cspell-dicts',
      \ 'coc-markdownlint',
      \ 'coc-tsserver',
      \ 'coc-prettier',
      \ 'coc-html',
      \ 'coc-lists',
      \ 'coc-xml',
      \ 'coc-sh',
      \ 'coc-css',
      \ 'coc-stylelintplus',
      \ 'coc-vimlsp',
      \ 'coc-json',
      \ 'coc-eslint',
      \ 'coc-pyright',
      \ 'coc-jest',
      \ 'coc-solargraph',
      \ 'coc-yaml',
      \ 'coc-highlight',
      \ 'coc-snippets',
      \ 'coc-diagnostic',
      \ 'coc-yank',
      \ 'coc-git',
      \]

call plug#end()

syntax on
filetype plugin on

" https://github.com/vim/vim/blob/master/runtime/doc/russian.txt
" Enable hotkeys for Russian layout
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

silent! colorscheme gruvbox


if has('mouse')
  set mouse=a
endif

" if has("clipboard")
"   set clipboard=unnamed " copy to the system clipboard

"   if has("unnamedplus") " X11 support
"     set clipboard+=unnamedplus
"   endif
" endif


set number
set hlsearch
set ignorecase



" set showcmd       " display incomplete commands
" set autowrite     " Automatically :write before running commands

" Use one space, not two, after punctuation.
" set nojoinspaces

" set softtabstop=4
" new line indent: use spaces instead of tab
" set smarttab
" set smartindent
" set expandtab

" set softtabstop=2
" set tabstop=2
" new line indent: how many spaces for one tab
" set shiftwidth=2
"set tabstop=2
" current line indent: how many spaces for one tab
"set softtabstop=2

" set updatetime=300
" set splitbelow
" set cmdheight=2
" " TODO: replace with "number" when new neovim will be released
set signcolumn=yes
set scrolloff=3

" Keep undo history across sessions, by storing in file.
"silent !mkdir /tmp/.vim/backups > /dev/null 2>&1
set undodir=/tmp/.vim/backups
set undofile

""" Basics Keymaps

" Turn off linewise keys. Normally, the `j' and `k' keys move the cursor down one entire line. with line wrapping on, this can cause the cursor to actually skip a few lines on the screen because it's moving from line N to line N+1 in the file. I want this to act more visually -- I want `down' to mean the next line on the screen
" nmap j gj
" nmap k gk
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')

" TODO: improve n+1 line moving by russian keys
nnoremap <expr> л (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> о (v:count == 0 ? 'gj' : 'j')

noremap <C-m> :make<CR>

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

vmap "y "*y
nmap "y "*y
nmap "Y "*Y
nmap "p "*p
nmap "P "*P

" highlight last inserted text
nnoremap gV `[v`]

noremap <Leader>s :update<CR>

" Edit .vimrc
map <leader>vl :vsp $MYVIMRC<CR>
map <leader>vr :source $MYVIMRC<CR>

vmap gcc <plug>NERDCommenterToggle
nmap gcc <plug>NERDCommenterToggle

let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1

" https://github.com/tpope/vim-endwise/issues/11
execute "inoremap {<CR> {<CR>}<ESC>O"

autocmd FileType scss setl iskeyword+=@-@

let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toc_autofit = 1

let g:slime_target = "neovim"

" nmap     <C-F>f <Plug>CtrlSFPrompt
" vmap     <C-F>f <Plug>CtrlSFVwordPath
" vmap     <C-F>F <Plug>CtrlSFVwordExec
" nmap     <C-F>n <Plug>CtrlSFCwordPath
" nmap     <C-F>p <Plug>CtrlSFPwordPath
" nnoremap <C-F>o :CtrlSFOpen<CR>
" nnoremap <C-F>t :CtrlSFToggle<CR>
" inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

let g:vim_markdown_folding_disabled = 1

" format the entire file
" nnoremap ff :normal! gg=G``<CR>

" set text wrapping toggles
" nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

" find merge conflict markers
" nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

nmap <silent> // :nohlsearch<CR>
" noremap <leader>hl :set hlsearch! hlsearch?<CR>

" Allows you to enter sudo pass and save the file
" " when you forgot to open your file with sudo
" cmap w!! %!sudo tee > /dev/null %

nmap     <leader>fr <Plug>CtrlSFPrompt

nnoremap <leader>S :lua require('spectre').open()<CR>

"set spell spelllang=en_us,ru_ru

source ~/dotfiles/files/vim-configs/ale.vim
source ~/dotfiles/files/vim-configs/coc.vim
source ~/dotfiles/files/vim-configs/fzf.vim
source ~/dotfiles/files/vim-configs/nerdtree.vim
source ~/dotfiles/files/vim-configs/coc-fzf.vim
source ~/dotfiles/files/vim-configs/coc-plugins.vim
source ~/dotfiles/files/vim-configs/test.vim
