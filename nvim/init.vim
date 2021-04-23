syntax on
filetype plugin indent on

set exrc
set encoding=UTF-8
filetype indent on
filetype plugin on
set guicursor=
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
let mapleader = " "
call plug#begin('~/.vim/plugged')

"Snippets
Plug 'epilande/vim-es2015-snippets'
" React code snippets
Plug 'epilande/vim-react-snippets'
" Ultisnips
Plug 'SirVer/ultisnips'


"Better commenter
Plug 'preservim/nerdcommenter'

"Git Plugins
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'

"Formating the code with prettier
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" FZF - The notorious fuzzy finder;)- 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'junegunn/fzf.vim'

" Auto-suggestions
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Theme install
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }
"Nerd Tree, for directories and icons on the tree
Plug 'preservim/nerdtree'    
Plug 'ryanoasis/vim-devicons'
" Initialize plugin system
call plug#end()

"Initializing the color theme
colorscheme dracula
set background=dark

"FzF binds and settings
nnoremap <C-p> :GFiles<CR>
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_branch_actions = {
      \ 'rebase': {
      \   'prompt': 'Rebase> ',
      \   'execute': 'echo system("{git} rebase {branch}")',
      \   'multiple': v:false,
      \   'keymap': 'ctrl-r',
      \   'required': ['branch'],
      \   'confirm': v:false,
      \ },
      \ 'track': {
      \   'prompt': 'Track> ',
      \   'execute': 'echo system("{git} checkout --track {branch}")',
      \   'multiple': v:false,
      \   'keymap': 'ctrl-t',
      \   'required': ['branch'],
      \   'confirm': v:false,
      \ },
      \}

"Make searches faster, ignores your .gitingnore
if executable('rg')
    let g:rg_derive_root='true'
endif

"Toggling the nerdtree, with ctrl n
nnoremap <C-n> :NERDTreeToggle<CR>

" use <tab> for trigger completion and navigate to the next complete item coc
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
"Coc config
let g:coc_global_extensions = [
            \ 'coc-snippets',
            \ 'coc-pairs',
            \ 'coc-tsserver',
            \ 'coc-eslint',
            \ 'coc-prettier',
            \ 'coc-json',
            \ ]

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

"To jump to different sides of the screen
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

"Aut source init.vim
autocmd! BufWritePost $MYVIMRC source $MYVIMRC | echom "Reloaded $NVIMRC"

"Saving on ctr + s 
:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>

"nvim keybinds for the git plugins
nmap <leader>gh :diffget //2<CR>
nmap <leader>gu :diffget //3<CR>
nmap <leader>gs :G<CR>

"Remapping esc to ii to get into insert mode
imap ii <Esc>

"Formatitng on save with prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
"Formating code on leadre F
nmap <leader>f  <Plug>(coc-format-selected)

"NerdCommenter, better comments 
let g:NERDSpaceDelims = 1 
let g:NERDCompactSexyComs = 1

"Mapping the capslock key to esc
"setxkbmap -option caps:swapescape
