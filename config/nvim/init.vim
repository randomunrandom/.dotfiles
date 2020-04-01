" vim-plug setup (https://github.com/junegunn/vim-plug)
" install vim-plug if it's not present
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')
	Plug 'junegunn/vim-plug'		" for documentation only
	Plug 'machakann/vim-highlightedyank'	" highlight yanked area
	Plug 'vim-airline/vim-airline'		" improved statusline
	Plug 'vim-airline/vim-airline-themes'	" themes for Airline
	Plug 'joshdick/onedark.vim'		" OneDark theme
	Plug 'scrooloose/nerdtree'		" invim file browser
		Plug 'Xuyuanp/nerdtree-git-plugin'	" plugin for nerdtree
	Plug 'mhinz/vim-signify'		" show vcs status
"	=== external tools suport ===
	" Plug 'edkolev/tmuxline.vim'		" tmux support
	Plug 'editorconfig/editorconfig-vim'	" .editorconfig support
	Plug 'tpope/vim-fugitive'		" enchanced git support
"	=== special case
	Plug 'ryanoasis/vim-devicons'		" adds icons to many plugins

call plug#end()

autocmd VimEnter * " install mising plugins
	if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
		PlugInstall --sync | q
	endif

" default updatetime 4000ms is not good for async update
set updatetime=100

set encoding=UTF-8

" launch NerdTree
autocmd vimenter * NERDTree

" show line numbers
set number

" theme setup
set termguicolors
colorscheme onedark
let g:airline_theme='base16_atelierlakeside'

" show whitespaces
set listchars=eol:$,tab:\|->,trail:~,extends:>,precedes:<
set list

