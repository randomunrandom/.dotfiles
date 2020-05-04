" let's live in new century
set nocompatible

""""""""""""""""""""""""
" plugin manager setup "
""""""""""""""""""""""""
" positioned at top to proretize above everything else

" install vim-plug if it's not present
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" add plugins
call plug#begin('~/.local/share/nvim/plugged')
	Plug 'junegunn/vim-plug'		" for documentation only

	Plug 'machakann/vim-highlightedyank'	" highlight yanked area
	Plug 'ryanoasis/vim-devicons'		" adds icons to many plugins

	Plug 'vim-airline/vim-airline'		" improved statusline
		Plug 'vim-airline/vim-airline-themes'	" themes for Airline

	" Plug 'joshdick/onedark.vim'		" OneDark theme
	Plug 'morhetz/gruvbox'			" gruvbox theme

	Plug 'scrooloose/nerdtree'		" nvim file browser
		Plug 'Xuyuanp/nerdtree-git-plugin'		" adds git support
		Plug 'tiagofumo/vim-nerdtree-syntax-highlight'	" adds color highlighting
	Plug 'preservim/nerdcommenter'		" commenter

"	=== external tools suport ===
	Plug 'airblade/vim-gitgutter'		" show git per line status
	Plug 'tpope/vim-fugitive'		" enchanced git support
	Plug 'edkolev/tmuxline.vim'		" tmux support
	Plug 'editorconfig/editorconfig-vim'	" .editorconfig support
	" preview for markdown
	Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
	" completions from vscode plugins
	" Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" install mising plugins
"autocmd VimEnter *
"	if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
"		PlugInstall --sync | q
"	endif

"""""""""""""""""""
" nvim only setup "
"""""""""""""""""""
" default usefull plugin
filetype plugin on

" show syntax
syntax on

" don't show -- INSERT --
set noshowmode

" add all subdir to search path
set path+=**

" show menu for wildcards
set wildmenu

" add some custom comands
command W w!

" show line numbers
set number relativenumber

" increase update time from 4000 for better async update
set updatetime=500

" set leader to ;, as in :, but without shift
let mapleader = ";"

" show whitespaces
set listchars=eol:$,tab:\|->,trail:~,extends:>,precedes:<
set list

" set encoding, mught be redundant
set encoding=UTF-8

"""""""""""""""""""""""""
" Plugin specific setup "
"""""""""""""""""""""""""
let g:indent_guides_enable_on_vim_startup = 1

let g:NERDTreeIgnore = ['^node_modules$', '^.git$']
let NERDTreeShowHidden=1

let NERDTreeShowBookmarks=1

" launch NERDTree if no files were given
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" show hidden files and bookmarks in NERDTree

" map keybind for NERDTree
nmap <leader>f :NERDTreeToggle<CR>

" close NERDTree buffer it it's the only one left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeShowIgnoredStatus = 1
let g:NERDTreeGitStatusWithFlags = 1

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

let g:NERDSpaceDelims = 1
map <Leader>c NERDCommenterToggle

" theme setup
set termguicolors
set background=dark
colorscheme gruvbox
let g:airline_powerline_fonts = 1
let g:airline_theme='base16_flat'

