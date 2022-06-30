" install plug if it is not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

"########################################################################
" Plug setup

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'
Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'joshdick/onedark.vim'
"Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'fisadev/vim-isort'
Plug 'jiangmiao/auto-pairs'
Plug 'davidhalter/jedi-vim'
Plug 'tmhedberg/SimpylFold'
"Plug 'Vimjas/vim-python-pep8-indent'
"Plug 'liuchengxu/vista.vim'
"Plug 'tpope/vim-sensible'
"Plug 'jeetsukumaran/vim-pythonsense'
"Plug 'junegunn/seoul256.vim'

call plug#end()

"########################################################################
" Default vim configs

map <F5> :setlocal spell!<CR>

set nu       "mostra numeração de linhas
set showmode "mostra o modo em que estamos
set noerrorbells
set ts=4     "tamanho das tabulações
set shiftwidth=4
set noswapfile
set nobackup
syntax on    "habilita cores
set hls      "destaca com cores os termos procurados
set incsearch "habilita a busca incremental
set ai       "auto identação
set smartcase
set ttyfast    "Envia mais caracteres ao terminal, melhorando o redraw de janelas. 
set mousemodel=popup "exibe o conteúdo de folders e sugestões spell

filetype plugin on
set laststatus=2

" Ativable use of the mouse for all modes
set mouse-=a

"########################################################################
" Pluggins specific configs

" map ctrl-/ to toggle comment on selected line
if has_key(plugs, "nerdcommenter")
	map <C-_> <plug>NERDCommenterToggle
endif

" ale setup
if !empty(glob('~/.vim/plugged/ale/autoload/ale.vim'))
	let g:ale_disable_lsp = 1

	let g:ale_linters = {
	\ 	'python': ['pylint'],
	\ 	'javascrip': ['eslint'],
	\}

	let g:ale_fixers = {
	\ 	'python': ['black'],
	\ 	'javascrip': ['prettier'],
	\}

	let g:ale_linters_explicit = 1

	let g:ale_fix_on_save = 1

	map <C-i> :Isort<CR>
endif

" import my plugins configs if they exist
if !empty(glob('~/.vim/plug-config/coc.vim'))
	source $HOME/.vim/plug-config/coc.vim
endif
if !empty(glob('~/.vim/plug-config/nerdtree.vim'))
	source $HOME/.vim/plug-config/nerdtree.vim
endif

if !empty(glob('~/.vim/plug-config/onedark.vim'))
	source $HOME/.vim/plug-config/onedark.vim
	colorscheme onedark
endif
