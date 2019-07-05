" ------------------------------------------------------------------------
"          _
"   __   _(_)_ __ ___  _ __ ___
"   \ \ / / | '_ ` _ \| '__/ __|
"    \ V /| | | | | | | | | (__
"     \_/ |_|_| |_| |_|_|  \___|
"
" ------------------------------------------------------------------------ 


" Character Code
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp,sjis
set fileformats=unix,dos,mac
set fenc=utf-8
scriptencoding utf-8

set nobackup
set noswapfile
set autoread
set hidden
set showcmd

" Views
set number
set nowrap
set laststatus=2
set ruler
set scrolloff=5
set t_Co=256

set autoindent
set smartindent
set shiftwidth=4
set noexpandtab

set tabstop=4
set showmatch
set backspace=2

" Invisible Character Visible
set list
set listchars=tab:\|\_
autocmd VimEnter,Colorscheme * highlight SpecialKey cterm=NONE ctermfg=darkgray ctermbg=NONE


set wildmode=list:longest

set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

autocmd InsertLeave * set nopaste

" auto comment out denable
autocmd Filetype * set formatoptions-=r
autocmd Filetype * set formatoptions-=o

" keymap
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <C-j> 5gj
nnoremap <C-k> 5gk
vnoremap <C-j> 5gj
vnoremap <C-k> 5gk
"noremap! <C-?> <C-h>

inoremap jj <Esc>

" brackets 
inoremap {<Enter> {<Enter>}<Esc>O
inoremap (<Enter> (<Enter>)<Esc>O
inoremap [<Enter> [<Enter>]<Esc>O

" vertical 'f'
command -nargs=1 MyLineSearch let @m=<q-args> | call search('^\s*'. @m)
command -nargs=1 MyLineBackSearch let @m=<q-args> | call search('^\s*'. @m, 'b')
nnoremap <Space>f :MyLineSearch<Space>
nnoremap <Space>F :MyLineBackSearch<Space>

command MyLineSameSearch call search('^\s*'. @m)
command MyLineBackSameSearch call search('^\s*'. @m, 'b')
nnoremap <Space>; :MyLineSameSearch<CR>
nnoremap <Space>, :MyLineBackSameSearch<CR>

" Vundle Basic Setting
if has('vim_starting')
	set nocompatible
	filetype off

	if !isdirectory(expand('~/.vim/bundle/Vundle.vim'))
		echo 'install Vundle.vim...'
		call system('mkdir -p ~/.vim/bundle/')
		call system('git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim')
	endif

	set rtp+=~/.vim/bundle/Vundle.vim
endif
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Plugins URL
Plugin 'https://github.com/scrooloose/nerdtree.git'				" ディレクトリの階層構造
Plugin 'https://github.com/jistr/vim-nerdtree-tabs'				" nerdtreeのtabごとの同期
" Plugin 'https://github.com/scrooloose/nerdcommenter'			" コメントアウトの簡易化
Plugin 'https://github.com/ctrlpvim/ctrlp.vim'					" ファイル検索
Plugin 'https://github.com/easymotion/vim-easymotion.git'		" カーソル移動補助

" Plugin 'https://github.com/tpope/vim-surround'					" テキストオブジェクトの拡張
" langrige Plugins
" Plugin 'https://github.com/mattn/emmet-vim'						" HTML CSS コーディング補助
Plugin 'https://github.com/pangloss/vim-javascript'				" JavaScript Syntax
Plugin 'https://github.com/StanAngeloff/php.vim'				" PHP Syntax
" Views Plugins
Plugin 'https://github.com/vim-airline/vim-airline'				" ステータスライン装飾
Plugin 'https://github.com/vim-airline/vim-airline-themes'		" airlineのテーマ
" ColorScheme Plugins
Plugin 'https://github.com/tomasr/molokai'						" molokai
Plugin 'https://github.com/ErichDonGubler/vim-sublime-monokai'	" sublimemonokai
Plugin 'https://github.com/jacoborus/tender.vim'				" tender
Plugin 'https://github.com/jdkanani/vim-material-theme'			" material-theme

call vundle#end()
filetype plugin indent on

" ------------------------------------------
" Plugins Setting
" ------------------------------------------

" NERDTree Setting
nnoremap <Space>e :NERDTreeToggle<CR>
" autocmd vimenter * NERDTree
let g:NERDTreeShowBookmarks = 1

" NERDTree Tabs
" map <C-n> <plug>NERDTreeTabsToggle<CR>
" let g:nerdtree_tabs_open_on_console_startup=1

" NERDCommenter Setting
" filetype on
" let g:NERDSpaceDelims=1

" CtrlP Setting
let g:ctrlp_match_window = 'max:30'
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*/lib/*,*.so,*.swp,*.zip,*.jpg,*.png,*/cakephp/lib/*
let g:ctrlp_show_hidden = 1

" easy-motion setting
" <Leader>f{char} to move to {char}
map  <Space>f <Plug>(easymotion-bd-f)
nmap <Space>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap <Space>s <Plug>(easymotion-overwin-f2)

" Move to line
map <Space>L <Plug>(easymotion-bd-jk)
nmap <Space>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Space>w <Plug>(easymotion-bd-w)
nmap <Space>w <Plug>(easymotion-overwin-w)

" vim-airline
let g:airline_theme = 'luna'

" ColorScheme Setting
syntax on
colorscheme tender

" MyCustom ColorScheme
" hi Comment ctermfg=blue
" set background=dark
hi LineNr ctermfg=darkgreen guifg=Grey guibg=Grey90
