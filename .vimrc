"home directory
cd D:/Texte

"pathogen, seems to be the best one, just clone in vimfiles/bundle
execute pathogen#infect()

"vimwiki double leader prefix to avoid conflict
"with window functions
"let g:vimwiki_map_prefix = '<Leader><Leader>w'
let g:vimwiki_map_prefix = '<Leader>v'

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

"statusline
set laststatus=2

"tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

"airline theme
let g:airline_theme='dark'

"turn off netrw
"let g:loaded_netrwPlugin = 1

"copy filename to clipboard
command! CopyBuffer let @+ = expand('%:p')

"turn on NERDtree
"nnoremap <leader>t :NERDTreeToggle<CR>

"omni completion
set omnifunc=syntaxcomplete#Complete

"color scheme
colorscheme Tomorrow-Night-Eighties

"font
if has('gui_running')
	if has('gui_gtk')
		set guifont=Envy\ Code\ R\ for\ Powerline 14
	else
		set guifont=Envy_Code_R_for_Powerline:h14:cDEFAULT
	endif
endif

"window size
set lines=38 columns=120

"warning at column 80, highlight from column 100
let &colorcolumn="80,".join(range(100,999),",")
"color for the column highlight
highlight ColorColumn ctermbg=235 guibg=#3c3d37

"test autonewline
set textwidth=100

"hybrid line numbers
set nu
set rnu
"color for the line numbers in gvim
:highlight LineNr guifg=#8787A5

"insert mode cursor
highlight Cursor guifg=white guibg=slategray
highlight iCursor guifg=black guibg=black

"specify the leader key
let mapleader=" "

"let j and k move across wrapped lines as expected if no count
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
"nnoremap k gk
"nnoremap j gj

"after character search: find next character
nnoremap <leader>n ;
"find next character backwards
nnoremap <leader>N ,

"move lines in normal mode
nnoremap <S-j> :m .+1<CR>==
nnoremap <S-k> :m .-2<CR>==

"move lines in visual 
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv

vnoremap <C-j> J

"edit .vimrc
map <leader>ev :vsplit $MYVIMRC<cr>
"source the .vimrc to see changes
map <leader>sv :source ~/.vimrc

"new pseudotab
nnoremap<leader>T :enew<CR>

"split and vertical split
"nnoremap<leader>ih <C-w>s
"nnoremap<leader>ii <C-w>v
"nnoremap<leader>L <C-w>w
nnoremap<leader>w <C-w>
nnoremap<leader>wc <C-w>c:bd #<cr>

"hide buffers instead of closing them
"set hidden

"close buffer
"nnoremap <leader>cb :bd<cr>
nnoremap <leader>bd :bd!<cr>
nnoremap <silent><leader>bc :bp\|bd #<cr>

"end of line
set list
set listchars=tab:▸\ ,eol:¬

"switch back and forth between last two loaded files
"map <leader><leader> :e#<CR>
"switch between last two open buffers
nnoremap <Backspace> <C-^>
"cycle through buffers
nnoremap <leader>l :bnext<CR>
nnoremap <leader>h :bprevious<CR>

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
"noremap <c-u> 3<c-u>
"noremap <c-d> 3<c-d>

"jump to mark
"nnoremap <leader>j `

"keep n lines around cursor
"set so=6

"search highlight while typing
set incsearch
"search case-insensitive except when using uppercase
set ignorecase
set smartcase
"search highlighting on
set hlsearch
"clear it with esc and mute feedback about it
nnoremap <esc> :noh<return><esc>:<Backspace>

"DrawIt
"characters normal and asterisk
map <leader>d* :call SetDrawIt('*','*','*','*','*','*','*')<CR>

map <leader>dn :call SetDrawIt('\|','-','+','\\','/','X','*')<CR>

"Vimwiki
"vimwiki break multiline list items
let g:vimwiki_list_ignore_newline = 0

"conceallevel
let g:vimwiki_conceallevel = 2

"header colors
hi VimwikiHeader1 guifg=#DD7722
hi VimwikiHeader2 guifg=#7777CC
hi VimwikiHeader3 guifg=#33BB88
hi VimwikiHeader4 guifg=#33BBEE
hi VimwikiHeader5 guifg=#AACCCC
hi VimwikiHeader6 guifg=#777744

"Return instead of : for commands except in vimwiki
"nmap <expr> <cr> (&autowriteall ? '<cr>' : ':')
"alternative return
"nnoremap <leader>r <cr>

"vimwiki
"
let fqwiki = {}
let fqwiki.path = '~/vimwikifq/'
let fqwiki.syntax = 'markdown'
let fqwiki.ext = '.md'
let fqwiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'cs': 'cs'}
let g:vimwiki_list = [{'path': '~/vimwiki/'},
					 \ fqwiki]
"old is better
nmap <cr> :
"vimwiki follow create wiki link
:nmap <leader>j <Plug>VimwikiFollowLink

"vimwiki experimental
"
"open index
:nmap <Leader>vv <Plug>VimwikiIndex
"List and select available wikis.
:nmap <Leader>vs <Plug>VimwikiUISelect

"optional [count] prefix for the next 2 to chose wiki
"Open diary index
:nmap <Leader>dt <Plug>VimwikiDiaryIndex
"Open diary wiki-file for today
:nmap <Leader>dm <Plug>VimwikiMakeDiaryNote
"Open diary wiki-file for yesterday
:nmap <Leader>dy <Plug>VimwikiMakeYesterdayDiaryNote

"open index in new tab
:nmap <Leader>vt <Plug>VimwikiTabIndex
"Open diary wiki-file for today in new tab
:nmap <Leader>v<Leader>t <Plug>VimwikiTabMakeDiaryNote

"diary update from index
:nmap <Leader>du <Plug>VimwikiDiaryGenerateLinks

"disable all blinking:
set guicursor+=a:blinkon0

inoremap <A-n> <C-w>
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

"select all (visual)
map <leader>a ggvG$
"copy selected to global buffer
vmap <leader>c "*y
"paste selected from global buffer
map <leader>p "+p

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

"autoindent
set autoindent

"autoexpanding {
inoremap {<cr> <cr>{<cr>}<esc>O<tab>

"close pointy bracket
inoremap < <><Left>
"jump to end of line while in insert mode
inoremap <S-Tab> <C-o>$

"recognize md as markdown (should be obsolete in newer vim?)
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

"function! g:LoadPluginScript ()
"    " Tabularize {{{
"    if exists(":Vimwiki")
"        nnoremap <CR> :Vimwiki <Leader><CR>
"    endif
"    " }}}
"endfunction

"find and replace
nnoremap <leader>fr :%s/\<<C-r><C-w>\>/<C-r><C-w>/g

"airline gui
" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"hello
