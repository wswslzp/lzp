" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim
set nu
set mouse=
autocmd GUIEnter * set shortmess=atI
syntax on
set tabstop=2
set shiftwidth=2
set ai!
set nocompatible 
set cul
filetype off
set encoding=utf-8

" mapping keyboard
let mapleader=" "
" move 
nnoremap <Leader><Leader>u <C-u>
nnoremap <Leader><Leader>d <C-d>
nnoremap <Leader><Leader>f <C-f>
nnoremap <Leader><Leader>b <C-b>
" visual mode search
vnoremap <Leader>vf y/<C-R>"<CR>
" write
nnoremap <unique> ZW :wa<cr>
nnoremap <unique> ZA :xa<cr>
nnoremap <silent> <C-s> :silent w<cr>
" window operation
nnoremap <Leader>w <C-w>
" insert mode 
inoremap <silent> <C-s> <esc>:w<cr>a
imap <C-a> <esc>0i
imap <C-e> <esc>$a
"imap <C-p> <esc>ka
"imap <C-n> <esc>ja
"imap <C-f> <esc>la
"imap <C-b> <esc>ha
imap <C-w> <esc>wi
imap <M-w> <esc>bi
" tab
nnoremap <Leader>tv :tabe $VIM/_vimrc<cr>
nnoremap <Leader>td :tabnew .<cr>
nnoremap <Leader>th :tab help 
nnoremap <Leader>te :tabe 
nnoremap <Leader>vd :vsp .<cr>

set rtp+=C:\Vim\vimfiles\bundle\Vundle.vim
call vundle#begin('C:\Vim\vimfiles\bundle')

Plugin 'VundleVim/Vundle.vim'
	nnoremap <Leader>bl :BundleList<cr>
	nnoremap <Leader>bi :BundleInstall<cr>
	nnoremap <Leader>bc :BundleClean<cr>
	nnoremap <Leader>bu :BundleUpdate<cr>

Plugin 'Valloric/YouCompleteMe'

Plugin 'vim-airline/vim-airline'
	let g:airline_powerline_fonts = 1
	let g:airline#extensions#tabline#show_close_button = 0
	let g:airline#extensions#ycm#enabled = 1
	let g:airline#extensions#branch#enabled = 1
	let g:airline#extensions#vimagit#enabled = 1
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#tabline#buffer_idx_mode = 1
	let g:airline#extensions#tabline#tab_nr_type = 2 " splits and tab number
	let g:airline#extensions#tabline#show_buffers = 0
	"let g:airline#extensions#tabline#buffer_nr_show = 1
	"let g:airline#extensions#tabline#show_tabs = 0

Plugin 'vim-airline/vim-airline-themes'

Plugin 'chrisbra/unicode.vim'

Plugin 'scrooloose/nerdtree'

Plugin 'jistr/vim-nerdtree-tabs'
	let g:nerdtree_tabs_open_on_gui_startup = 0
	nnoremap <silent> <F2> :NERDTreeTabsToggle<cr>

Plugin 'Xuyuanp/nerdtree-git-plugin'
	let g:NERDTreeIndicatorMapCustom = {
			\ "Modified"  : "✹",
			\ "Staged"    : "✚",
			\ "Untracked" : "✭",
			\ "Renamed"   : "➜",
			\ "Unmerged"  : "═",
			\ "Deleted"   : "✖",
			\ "Dirty"     : "✗",
			\ "Clean"     : "✔︎",
			\ 'Ignored'   : '☒',
			\ "Unknown"   : "?"
			\ }

Plugin 'SirVer/ultisnips'
	let g:UltiSnipsExpandTrigger="ii"
	let g:UltiSnipsListSnippets="iI"
	let g:UltiSnipsJumpForwardTrigger="II"
	let g:UltiSnipsJumpBackwardTrigger="OO"

Plugin 'honza/vim-snippets'

Plugin 'vim-latex/vim-latex'
	nnoremap <Leader>ts :Tshortcuts<cr>

Plugin 'jreybert/vimagit'

Plugin 'tpope/vim-fugitive'
	nnoremap <Leader>g :G<cr>

Plugin 'airblade/vim-gitgutter'

Plugin 'jiangmiao/auto-pairs'

Plugin 'nachumk/systemverilog.vim'

Plugin 'majutsushi/tagbar'
	nnoremap <silent> <F8> :TagbarToggle<cr>

Plugin 'vhda/verilog_systemverilog.vim'

Plugin 'ludovicchabant/vim-gutentags'

call vundle#end()
filetype plugin indent on

set shellslash
let g:tex_flavor='latex'
let g:XkbSwitchLib = 'C:\Vim\libxkbswitch64.dll'
let g:XkbSwitchEnabled = 1
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
colorscheme evening
set guifont=YaHei_Mono_For_Powerline:h14:cANSI:qDRAFT
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>= <Plug>AirlineSelectNextTab
set tags=./tags
let g:easytags_dynamic_files=2

if has("gui_running") 
	au GUIEnter * simalt ~x
	set guioptions-=m " 隐藏菜单栏
	set guioptions-=T " 隐藏工具栏 
	set guioptions-=L " 隐藏左侧滚动条 
	set guioptions-=r " 隐藏右侧滚动条 
	set guioptions-=b " 隐藏底部滚动条 
	"set showtabline=0 " 隐藏Tab栏 
endif

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

