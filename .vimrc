"pathogen
execute pathogen#infect()

"make like vim, not like vi
set nocompatible

"set to unicode if possible
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif
"enable syntax highlighting and file type detection
syntax on

"for vim notes, vim wiki etc.
filetype plugin on

"omni completion
set omnifunc=syntaxcomplete#Complete

"color scheme
colorscheme Tomorrow-Night-Eighties

"font
if has('gui_running')
	if has('gui_gtk')
		set guifont=Envy\ Code\ R\ 14
	else
		set guifont=Envy_Code_R:h14:cDEFAULT
	endif
endif

"window size
set lines=38 columns=120

"warning at column 80, highlight from column 100
let &colorcolumn="80,".join(range(100,999),",")
"color for the column highlight
highlight ColorColumn ctermbg=235 guibg=#3c3d37

"hybrid line numbers
set nu
set rnu
"color for the line numbers in gvim
:highlight LineNr guifg=#8787A5


"specify the leader key
let mapleader=" "

"let j and k move across wrapped lines as expected if no count
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')

"after character search: find next character
nnoremap <leader>n ;
"find next character backwards
nnoremap <leader>N ,

"move lines in normal mode
nnoremap <S-j> :m .+1<CR>==
nnoremap <S-k> :m .-2<CR>==

"move lines in visual mode
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv

vnoremap <C-j> J

"edit .vimrc
map <leader>ev :vsplit $MYVIMRC<cr>
"source the .vimrc to see changes
map <leader>sv :source ~/.vimrc

"hide buffers instead of closing them
set hidden

"close buffer
nnoremap <leader>cb :bd<cr>
nnoremap <leader>db :bd!<cr>

"end of line
set list
set listchars=tab:▸\ ,eol:¬

"switch back and forth between last two loaded files
"map <leader><leader> :e#<CR>
"switch between last two open buffers
nnoremap <Backspace> <C-^>
"cycle through buffers
map <leader>b :bnext<CR>

"open file
map <leader>o :browse confirm edit<CR>

"save as
map <leader>sa :browse confirm sav<CR>

"no error bell
set visualbell t_vb=
if has("autocmd") && has("gui")
    au GUIEnter * set t_vb=
endif

"scroll n lines with <ctrl-d> and <ctrl-u>
"set scroll=3
noremap <c-u> 3<c-u>
noremap <c-d> 3<c-d>

"keep n lines around cursor
set so=6

"search highlight while typing
set incsearch
"search case-insensitive except when using uppercase
set ignorecase
set smartcase
"search highlighting on
set hlsearch
"clear it with esc and mute feedback about it
nnoremap <esc> :noh<return><esc>:<Backspace>

"autowrite for vimwiki
"nnoremap <leader>ww :set autowriteall

"Return instead of : for commands except in vimwiki
nmap <expr> <cr> (&autowriteall ? '<cr>' : ':')
"alternative return
nnoremap <leader>r <cr>

"old
"nmap <cr> :
"vim wiki follow create wiki link
":nmap <Leader><cr> <Plug>VimwikiFollowLink
"
"disable all blinking:
set guicursor+=a:blinkon0

"mark all (visual)
map <leader>a ggvG$ 
"copy selected to global buffer
vmap <leader>c "*y

"make . work with visually selected lines
xnoremap . :norm.<CR>

"quit
map <leader>qu :q<CR>
"quit!
map <leader>qq :q!<CR>


"backspace was weird
set backspace=2
set backspace=indent,eol,start

"tab was to big
set tabstop=4

"autoexpanding {
inoremap {<cr> <cr>{<cr>}<esc>O<tab>

"close pointy bracket
inoremap < <><Left>
"jump to end of line while in insert mode
inoremap <S-Tab> <C-o>$

"function! g:LoadPluginScript ()
"    " Tabularize {{{
"    if exists(":Vimwiki")
"        nnoremap <CR> :Vimwiki <Leader><CR>
"    endif
"    " }}}
"endfunction
