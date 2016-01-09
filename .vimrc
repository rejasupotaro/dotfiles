" basic settings {{{
syntax on
filetype on
filetype indent on
filetype plugin on

set title
set nocompatible                 " use Vim default instead of 100% vi compativility
set backspace=indent,eol,start   " more powerful backspacing
set clipboard+=unnamed
set history=100                  " keep 100 lines of command line history
set viminfo='100,<100,s10        " reffer: http://vimwiki.net/?'viminfo'
set ruler                        " show the cursor position all the time
set expandtab                    " change tab into space
set tabstop=2                    " tab width
set softtabstop=2                " tab width
set shiftwidth=2                 " tab width
set textwidth=0                  " prevent auto linebreak
set shiftround                   " round indent
set modelines=1                  " line num in :set
set number                       " show line num
set autoindent                   " auto indent
set cursorline                   " highlight cursor line
set colorcolumn=80               " highlight border of 'long line'
set clipboard+=unnamed           " clipboard <=> yank
set list                         " highlight space/tab at the end of line
set listchars=tab:^\ ,trail:~    " highlight space/tab at the end of line
set visualbell t_vb=             " kill beep flash
set t_vb=                        " kill beep sound
set formatoptions=q              " disable auto-insert line feeds
set noswapfile                   " do not create .*.swp
set ignorecase
set smartcase                    " do not ignorecase if keyword contains uppercase
set wrapscan
set incsearch                    " use 'incremental search'
set hlsearch                     " highlight search result
set number                       " show number of line on left
set showmatch
set showcmd                      " show what keys input for command, but too slow on terminal
set smartindent                  " auto indent for C-like code with '{...}' blocks
set shiftround                   " round indent when < or > is used
set cmdheight=1                  " set height of command line
set wildmode=longest,list,full   " command line completion order
set completeopt=menuone,preview
set hidden
set foldmethod=marker            " use '{{{' and '}}}' for marker
set foldlevelstart=0             " Start with all folds closed
if has("mouse")                  " use mouse
  set mouse=a
end

autocmd FileType * setlocal formatoptions-=ro
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" off IME on escape from insert mode
inoremap <Nul> <esc>
vnoremap <Nul> <esc>
nnoremap <Nul> <esc>
" }}}

" filetype specific indent {{{
autocmd BufNewFile,BufRead *.md   set filetype=markdown
autocmd BufNewFile,BufRead *.sass set filetype=sass
autocmd BufNewFile,BufRead *.json set filetype=json

" 2-space indent
autocmd FileType
    \ html,scss,javascript,ruby,tex,xml
    \ setlocal shiftwidth=2 softtabstop=2 nosmartindent
" 4-space indent
autocmd FileType c,cpp,java setlocal cindent
" * }}}

" statusline {{{
let &statusline =
      \  ''
      \. '%<'
      \. '%m'
      \. '%{&filetype}'
      \. '%{",".(&fenc!=""?&fenc:&enc).",".&ff.","}'
      \. '[%{GetB()}]'
      \. '(%3l,%3c)'

function! GetB()
  let c = matchstr(getline('.'), '.', col('.') - 1)
  let c = iconv(c, &enc, &fenc)
  return String2Hex(c)
endfunction

" The function String2Hex() converts each character in a string to a two
" character Hex string.
func! String2Hex(str)
  let out = ''
  let ix = 0
  while ix < strlen(a:str)
    let out = out . Nr2Hex(char2nr(a:str[ix]))
    let ix = ix + 1
  endwhile
  return out
endfunc
" :help eval-examples
" The function Nr2Hex() returns the Hex string of a number.
func! Nr2Hex(nr)
  let n = a:nr
  let r = ""
  while n
    let r = '0123456789ABCDEF'[n % 16] . r
    let n = n / 16
  endwhile
  return r
endfunc

highlight statusline term=NONE cterm=NONE guifg=blue ctermfg=white ctermbg=blue " default statusline
augroup InsertHook
autocmd!
autocmd InsertEnter * highlight statusline term=NONE cterm=NONE guifg=red ctermfg=white ctermbg=red
autocmd InsertLeave * highlight statusline term=NONE cterm=NONE guifg=blue ctermfg=white ctermbg=blue
augroup END

set laststatus=2                 " always show statusline
" }}}

" general keymap {{{
map Y y$

nmap <space>p :set paste<CR>I<CR>
"nmap <C-w>r :source $HOME/.vimrc<CR>
nmap <space>n :call <SID>toggle_show_number()<CR>
nmap <C-w>c :tabnew<CR>:VimFiler<CR>
nmap <C-w><C-w> gt
nmap <C-w>n gt
nmap <C-w>p gT
nmap <C-w>" :sp<CR>
nmap <C-w>% :vsp<CR>

nnoremap J <C-D>
nnoremap K <C-U>
nnoremap <space>m  :<C-u>marks<CR>
nnoremap <space>r  :<C-u>registers<CR>

function! s:toggle_show_number()
  set number!
endfunction
" }}}

" syntax check {{{
"augroup rbsyntaxcheck
"  autocmd!
"  autocmd BufWrite *.rb w !ruby -c
"augroup END
" }}}

" neobundle plugins {{{
if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
\   'build' : {
\     'windows' : 'echo "Sorry, cannot update vimproc binary file in Windows."',
\     'cygwin'  : 'make -f make_cygwin.mak',
\     'mac'     : 'make -f make_mac.mak',
\     'unix'    : 'make -f make_unix.mak',
\   },
\ }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'tpope/vim-endwise'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck
" }}}

" unite {{{
"noremap <space>ub :Unite buffer<CR>
nmap <C-w>b :Unite buffer<Cr>
"noremap <space>uf :Unite file<CR>
" }}}

" vimfiler {{{
let g:vimfiler_as_default_explorer=1
let g:vimfiler_safe_mode_by_default=0

nmap <C-w>f :VimFiler -buffer-name=explorer -split -winwidth=48 -toggle -no-quit<Cr>
"nmap <C-w>f :VimFiler<Cr>

autocmd! FileType vimfiler call g:setup_vimfiler()
function! s:setup_vimfiler()
  nnoremap <buffer>s :call vimfiler#mappings#do_action('open_split')<Cr>
  nnoremap <buffer>v :call vimfiler#mappings#do_action('open_vsplit')<Cr>
endfunction

let s:vimfiler_open = { 'is_selectable' : 1 }
function! s:vimfiler_open.func(candidates)
  wincmd p
  exec 'split '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'open_split', s:vimfiler_open)

let s:vimfiler_open = { 'is_selectable' : 1 }
function! s:vimfiler_open.func(candidates)
  wincmd p
  exec 'vsplit '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'open_vsplit', s:vimfiler_open)

let g:vimfiler_default_columns = "type:size"
" }}}

" vimshell {{{
noremap <C-w>s :VimShell<CR>
"noremap <C-w>vp :VimShellPop<CR>
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt = "(*ﾂｴﾏ会ｽ*) " . " $ "
" }}}

" neocomplcache {{{
let g:neocomplcache_enable_at_startup = 1             " use neocomplcache
let g:neocomplcache_enable_smart_case = 1             " use smartcase
let g:neocomplcache_enable_camel_case_completion = 1  " use camel case completion
let g:neocomplcache_enable_underbar_completion = 1    " use underbar completion
let g:neocomplcache_min_syntax_length = 4             " set minimum syntax keyword length
if !exists('g:neocomplcache_keyword_patterns')        " define keyword
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
" }}}

" ctrlp {{{
noremap <C-w>p :CtrlP<CR>
let g:ctrlp_use_migemo = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_mruf_max = 500
let g:ctrlp_open_new_file = 1
" }}}

" quickrun {{{
" change quickrun execution key
noremap <C-w>r :QuickRun<CR>

set splitbelow
set splitright

" show execution time
let g:quickrun_config = {
\   "_" : {
\       "hook/time/enable": "1",
\       "runner" : "vimproc",
\       "runner/vimproc/updatetime" : 40,
\       "outputter/buffer/split" : ":botright 12sp",
\   }
\}
" }}}

" endwise {{{
let g:endwise_no_mappings = 1
autocmd FileType lua,ruby,sh,zsh,vim imap <buffer> <CR> <CR><Plug>DiscretionaryEnd
" }}}

" indent-guides {{{
"let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#121212 ctermbg=233
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#262626 ctermbg=235
"let g:indent_guides_enable_on_vim_startup=1
" }}}

" vim-colors-solarized {{{
"syntax enable
"set background=light
"let g:solarized_termcolors=256
"colorscheme solarized
" }}}

" Type tab key to insert <TAB> or complement a word depending on the cursor position {{{
imap <S-Tab> <c-r>=InsertTabOrComplement()<cr>
function! InsertTabOrComplement()
  let col = col('.') - 1
  if col == 0 || getline('.')[col - 1] !~ '\k'
    return "\<TAB>"
  else
    return "\<C-N>"
  endif
endfunction
" }}}
