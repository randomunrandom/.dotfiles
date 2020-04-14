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
	Plug 'vim-airline/vim-airline'		" improved statusline
	Plug 'vim-airline/vim-airline-themes'	" themes for Airline
	Plug 'joshdick/onedark.vim'		" OneDark theme
	Plug 'scrooloose/nerdtree'		" invim file browser
	Plug 'Xuyuanp/nerdtree-git-plugin'	" plugin for nerdtree
	Plug 'mhinz/vim-signify'		" show vcs status
"	=== external tools suport ===
	Plug 'edkolev/tmuxline.vim'		" tmux support
	Plug 'editorconfig/editorconfig-vim'	" .editorconfig support
	Plug 'tpope/vim-fugitive'		" enchanced git support
	" preview for markdown
	Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
"	=== special case
	Plug 'ryanoasis/vim-devicons'		" adds icons to many plugins
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

" add all subdir to search path
set path+=**

" show menu for wildcards
set wildmenu

" add some custom comands
command W w!

" show line numbers
set number

" increase update time from 4000 for better async update
set updatetime=1000

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
" might include some nvim configs for better grouping

" launch NERDTree if no files were given
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" show hidden files and bookmarks in NERDTree
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1

" map keybind for NERDTree
nmap <Leader>f :NERDTreeToggle<CR>
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>

" close NERDTree buffer it it's the only one left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg)
	exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermfg='. a:fg .' guifg='. a:fg
	".' ctermbg='. a:bg .' guibg='. a:guibg
	exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

" config like file
call NERDTreeHighlightFile('conf',	'yellow')
call NERDTreeHighlightFile('config',	'yellow')
call NERDTreeHighlightFile('ini',	'yellow')
call NERDTreeHighlightFile('json',	'yellow')
call NERDTreeHighlightFile('yml',	'yellow')

call NERDTreeHighlightFile('md',	'blue')

call NERDTreeHighlightFile('html',	'brown')
call NERDTreeHighlightFile('css',	'cyan')
call NERDTreeHighlightFile('js',	'red')

" theme setup
set termguicolors
colorscheme onedark
let g:airline_powerline_fonts = 1
let g:airline_theme='base16_flat'

