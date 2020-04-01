" vim-plug setup (https://github.com/junegunn/vim-plug)
" install vim-plug if it's not present
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')
	Plug 'junegunn/vim-plug'		" for documentation only
	Plug 'vim-airline/vim-airline'		" improved statusline
	Plug 'vim-airline/vim-airline-themes'	" themes for Airline
	Plug 'joshdick/onedark.vim'		" OneDark theme
call plug#end()

autocmd VimEnter * " install mising plugins
	if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
		PlugInstall --sync | q
	endif

" theme setup
set termguicolors
colorscheme onedark
let g:airline_theme='base16_atelierlakeside'

" show whitespaces
set listchars=eol:$,tab:\|->,trail:~,extends:>,precedes:<
set list

