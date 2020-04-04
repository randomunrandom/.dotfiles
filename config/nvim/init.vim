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
	" preview for markdown
	" build from source Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
	Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
"	=== special case
	Plug 'ryanoasis/vim-devicons'		" adds icons to many plugins

call plug#end()

autocmd VimEnter * " install mising plugins
	if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
		PlugInstall --sync | q
	endif

" default updatetime 4000ms is not good for async update
set updatetime=100

let mapleader = ";"
set encoding=UTF-8

" launch NERDTree
autocmd vimenter * NERDTree
" show hidden files and bookmarks in NERDTree
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
" map keybind for NERDTree
nmap <Leader>f :NERDTreeToggle<CR>
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>
" close NERDTree buffer it it's the only one left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
	exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
	exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')


" show line numbers
set number

" theme setup
set termguicolors
colorscheme onedark
let g:airline_powerline_fonts = 1
let g:airline_theme='base16_atelierlakeside'

" show whitespaces
set listchars=eol:$,tab:\|->,trail:~,extends:>,precedes:<
set list

