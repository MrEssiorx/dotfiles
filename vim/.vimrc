call plug#begin('~/.vim/plugged')

Plug 'cocopon/iceberg.vim'
Plug 'Enonya/yuyuko.vim'
Plug 'ghifarit53/tokyonight-vim'
Plug 'gosukiwi/vim-atom-dark'
Plug 'crusoexia/vim-monokai'

Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'lervag/vimtex'
Plug 'mboughaba/i3config.vim'
" Plug 'christianfosli/wsl-copy'

Plug 'itchyny/lightline.vim'
Plug 'Konfekt/FastFold'
Plug 'jiangmiao/auto-pairs'
Plug 'gabrielsimoes/cfparser.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'

Plug 'ap/vim-css-color'

call plug#end()

" tex settings 
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

set visualbell
set t_vb=

" 055144

" silent exec "!xinput disable 12"

"lightline.vim config
" set laststatus=2

set t_Co=256
set encoding=utf8
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" visual stuff
set guioptions=
set cursorline

let &t_SI.="\e[5 q" 
let &t_SR.="\e[3 q"
let &t_EI.="\e[1 q"

" custom settings
set number
set tabstop=4
set shiftwidth=4
set smarttab
set smartindent
set cin
set autowriteall
set mouse=
set linebreak
if has('syntax')
	syntax on
endif

set foldmethod=indent
set foldlevel=99

set nohlsearch

" ---------------------------- VIM COLORS -----------------------------

set termguicolors

" >>> color iceberg 
" colorscheme iceberg
" let g:lightline = {'colorscheme' : 'iceberg'}


" >>> color tokyonight
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
let g:lightline = {'colorscheme' : 'tokyonight'}
colorscheme tokyonight


" >>> atom-dark
" color atom-dark-256


" >>> yuyuko
" let g:lightline = {'colorscheme' : 'yuyuko'}
" colorscheme yuyuko
" set nocursorline


" ---------------------------- CUSTOM HOTKEYS -------------------------

let uname = substitute(system('uname'),'\n','','')
if uname == 'Linux'
	let lines = readfile("/proc/version")
	if lines[0] =~ "Microsoft"
		" using WSL
		" WSL-specific maps
		
		" copy file to clipboard
		nmap <silent> <C-a> GVgg:Wsly<CR> 
	else
		" using non-WSL Linux
		" maps, not usable in WSL
		
		" copy file to clipboard (requires gvim/vim-gnome/vim-gtk)
		nmap <silent> <C-a> :%y+ <CR>
	endif
endif

nmap <silent> <C-h> :tabp <CR>
nmap <silent> <C-l> :tabn <CR>

imap jj <Esc>
vmap ;; <Esc>

" ------------------ LANGUAGE OR SITATION SPECIFIC PRESETS ------------

function! SetupCpp()
	silent exec("!mkdir -p %:h/.bin")
	" comment all cerr outputs
	nmap <F4> :g/cerr/norm gcc <CR>
	let g:exe_file = "%:h/.bin/%:t:r"
	nmap <F1> :w <bar> !clear; echo "Compiling...";
				\ g++ -std=c++2a
				\ -DDEBUG
				\ -ulimit -O2
				\ % -o %:h/.bin/%:t:r <CR>
	nmap <F2> :!clear;"%:h/.bin/%:t:r" <CR>
	nmap <F3> :w <bar> exe "!clear; echo \"Debug-Mode Compiling...\";
				\ g++ -std=c++2a 
				\ -DDEBUG -D_GLIBCXX_DEBUG
				\ -fsanitize=address -fsanitize=undefined
				\ -Wall -Wextra
				\ -ulimit -g
				\ % -o " . g:exe_file <CR>
	nmap <F5> :CF <CR><CR>
endfunction

function! SetupPython()
	set noexpandtab
	nmap <F2> :w <bar> :!clear;python3 % <CR>
	nmap <F4> :g/print(f'db/norm gcc <CR>
endfunction

function! SetupVim()
	nmap <F2> :w <bar> :source % <CR>
endfunction

function! SetupRust()
	nmap <F2> :w <bar> :!clear; cargo run <CR>
endfunction

function! SetupLua()
	nmap <F2> :w <bar> :!clear;lua % <CR>
endfunction

function! SetupTxt()
	set linebreak
	set wrap
	" set columns=100
	set textwidth=0
endfunction

function SetupCS() " which stands for C# 
	" set syn=cs
endfunction

command! SetupCS		:call SetupCS()
command! SetupCpp		:call SetupCpp()
command! SetupPython	:call SetupPython()
command! SetupVim		:call SetupVim()
command! SetupTxt		:call SetupTxt()
command! SetupRust		:call SetupRust()
command! SetupLua		:call SetupLua()

" autocmd FileType cs		set syn=javascript
autocmd FileType cs		SetupCS
autocmd FileType text	SetupTxt
autocmd FileType python	SetupPython 
autocmd FileType vim	SetupVim
autocmd FileType cpp	SetupCpp
autocmd FileType rust	SetupRust
autocmd FileType lua	SetupLua

" ---------------------------- CUSTOM FUNCTIONS -----------------------

function! ClearFile()
	:0
	norm dG
endfunction

function! CopyAndFormat()
	" .--------------------------------------------------.
	" | save and copy current .cpp file into a ./format/ |
	" | folder and reformat it to fit algocode.ru        |
	" | code-styling requirements with help of 'algform' |
	" | binary (//link to the algform git page//)        |
	" '--------------------------------------------------'
	:w
	silent exec('!mkdir -p formated')
	silent exec('!algform % %:h/formated/%:t')
	" exec('!cp % %:h/formated/%:t;sed -i \d;format %:h/formated/%:t')
endfunction

function! ReadTemplate()
	let ext = expand("%:e")
	let template_file = expand("$HOME/templates/") . ext . "." . ext 
	if filereadable(template_file)
		exec("0r " . template_file)
	endif
endfunction

function! CloneBufferToFile(new_file)
    let l:current_content = getline(1, '$')
    execute 'edit ' . fnameescape(a:new_file)
    silent! %delete _
    call setline(1, l:current_content)
endfunction

command! Dopen	:!xdg-open %
command! Clearf	:call ClearFile()
command! CF		:call CopyAndFormat()

command! -nargs=1 -complete=file Fork call CloneBufferToFile(<q-args>)

" ---------------------------- TEMPLATES ------------------------------

" autocmd BufNewFile *.cpp	0r ~/templates/cpp.cpp		| 21
" autocmd BufNewFile *.py		0r ~/templates/py.py	| 8
" autocmd BufNewFile *.cs		0r ~/templates/cs.cs

autocmd BufNewFile *			:call ReadTemplate()

command! Cpp	:call ClearFile() | 0r ~/templates/cpp.cpp	| 21
command! Cpp2	:call ClearFile() | 0r ~/templates/cpp2.cpp	| 21
command! Gen	:call ClearFile() | 0r ~/templates/gen.cpp
command! Py		:call ClearFile() | 0r ~/templates/py.py
" command! Canv	:call ClearFile() | 0r ~/templates/canv_cs.cs
" command! Cs		:call ClearFile() | 0r ~/templates/cs.cs

command! Rand	:r ~/templates/rand.cpp
command! Sparse	:r ~/templates/sparse.cpp
