" Setup notes
" 1: Vundle
" 	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" 2: Install all plugins
" 	:PluginInstall
" 1: YouCompleteMe
" 	Compile it using cmake. Details can be found at the GitHub repo
" 2: Breakindent
" 	Use a patched version of Vim. On Ubuntu 14.04:
" 	sudo add-apt-repository ppa:eudoxos/vim-breakindent
" 	sudo apt-get update
" 	sudo apt-get upgrade
" 3: Airline status bar
" 	Get a working powerline font
" 	https://github.com/bling/vim-airline#integrating-with-powerline-fonts
" 4: Solarized color scheme
" 	Configure your terminal emulator with the correct solarized
" 	colorscheme. See:
" 	http://ethanschoonover.com/solarized

set nocompatible              " be iMproved, required
filetype off                  " required

" Vundle Plugin manager
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'		" Autocomplete for C++, C, Python, ...
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<C-Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<C-Up>']
Plugin 'scrooloose/nerdtree'		" File navigator
Plugin 'tikhomirov/vim-glsl'		" Syntax highlighting for GLSL shaders
Plugin 'ervandew/supertab'		" Needed to make Ultsnips compatible with YouCompleteMe.
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
Plugin 'SirVer/ultisnips'		" Snippets (Engine)
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
Plugin 'honza/vim-snippets' 		" Snippets (Some default snippets)
Plugin 'nvie/vim-flake8' 		" Python PEP8 checking
Plugin 'bling/vim-airline' 		" Status line
Plugin 'altercation/vim-colors-solarized' " Solarized colorscheme
Plugin 'tpope/vim-fugitive' 		" Git indicator
Plugin 'bling/vim-bufferline' 		" Keep track of buffers
Plugin 'qpkorr/vim-bufkill' 		" Close buffers
call vundle#end()
filetype plugin indent on
"Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"see :h vundle for more details or wiki for FAQ
"Put your non-Plugin stuff after this line

" Paste-Mode deaktivieren (Probleme mit iremap)
set nopaste

" Farben
set t_Co=16

" Syntaxhighlighting
syntax enable

" Solarized color scheme (dark)
set background=dark
let g:solarized_termcolors=16
colorscheme solarized

" Zeilennummern
set number

" Einrückungen
set autoindent

" Umgebrochene Zeilen richtig einrücken
set breakindent

" YCM - YouCompleteMe - Config
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"

" Pfeiltasten
inoremap <up> <C-o>gk
inoremap <down> <C-o>gj
nnoremap <up> gk
nnoremap <down> gj

" Status bar (airline plugin)
set laststatus=2
set lazyredraw 
let g:airline_powerline_fonts = 1

" Buffers
set hidden

" " Bracket handling
" autocmd FileType c,cpp,hpp,h noremap ( ()<Esc>i
" autocmd FileType c,cpp,hpp,h noremap () ()
" autocmd FileType c,cpp,hpp,h noremap { {<Esc>o}<Esc>kA
" autocmd FileType c,cpp,hpp,h noremap {} {}
" autocmd FileType c,cpp,hpp,h noremap ' ''<Esc>i
" autocmd FileType c,cpp,hpp,h noremap '' ''
" autocmd FileType c,cpp,hpp,h noremap " ""<Esc>i
" autocmd FileType c,cpp,hpp,h noremap "" ""

" Automatically start & quit NERDTree, use <F2> to open/close it
function! StartUp()
	if 0 == argc()
		NERDTree
	end
endfunction
autocmd VimEnter * call StartUp()
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <F2> :NERDTreeToggle<CR>

" Use <F3> to navigate between visible buffers
"map <F3> <C-W>
