" Plugins declaration {{{
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'lervag/vimtex'
" Plug 'klen/python-mode'
Plug 'flazz/vim-colorschemes'
Plug 'gabrielelana/vim-markdown'
Plug 'bashka/vim_lib'
Plug 'Bashka/vim_git'
Plug 'scrooloose/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
call plug#end()
" }}}

" Vimscript file settings {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Tex file settings {{{
augroup filetype_tex
  autocmd!
  autocmd FileType tex setlocal foldmethod=marker
augroup END
" }}}

" Disable rope plugin for autocompletion
let g:pymode_rope=0

" Enable filetype plugin
filetype plugin on

" Leader buttons settings {{{
let leader = '\'
let g:leader = '\'
" }}}

" Show invisible characters {{{
" Shortcut to rapidly toggle `set list`
nmap <leader>n :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
" }}}

" NERDCommenter settings {{{
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
 let g:NERDTrimTrailingWhitespace = 1
" }}}

" vimtex configuration box {{{
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'mupdf'
nmap <leader>ls :VimtexCompile<cr>
"nmap <leader>lv :VimtexView<cr>
nmap <leader>ss :VimtexCompileSS<cr>
nmap <leader>mv  :!make<cr><cr><leader>lv
" }}}

" aliases for Makefiles processing {{{
nmap <leader>m  :w<cr> :!make<cr><cr>
nmap <leader>mc :!make clean<cr><cr>
" }}}

" Clang-format bindings {{{
map <C-F> :pyf /usr/share/vim/addons/syntax/clang-format-4.0.py<cr>
imap <C-F> <c-o>:pyf /usr/share/vim/addons/syntax/clang-format-4.0.py<cr>
" }}}

" Cscope bindings {{{
if has('cscope')
  set cscopetag cscopeverbose

  if has('quickfix')
    set cscopequickfix=s-,c-,d-,i-,t-,e-
  endif

  cnoreabbrev csa cs add
  cnoreabbrev csf cs find
  cnoreabbrev csk cs kill
  cnoreabbrev csr cs reset
  cnoreabbrev css cs show
  cnoreabbrev csh cs help

  nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>      
  nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>      
  nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>      
  nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>      
  nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>      
  nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>      
  nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
  nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

endif
" }}}

" russian language support {{{
setlocal spell spelllang=ru,en
" :syntax spell toplevel " for tex files 
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan
nmap <leader>spell :setlocal spell spelllang=ru<cr>
" }}}

" General redactor settings {{{
set expandtab
set shiftwidth=2
set softtabstop=2
set cc=80
" }}}

" Color schemes settings {{{
" colorscheme elflord
colorscheme evening
" set color of right margin
hi ColorColumn guibg=#2d2d2d ctermbg=246
" Disable Background Color Erase 
set t_ut=
" }}}

" Moving combination declarations {{{
" move cursor to start of function and scroll it to the top of screen
" supposed that last line of function contains only '}' symbol
nnoremap <leader>fs /^}$<cr>%{zt<c-o><c-o><c-o>
nnoremap <leader>nf /^}$<cr>n%{zt<c-o>
" strong left and right
nnoremap <s-h> ^
nnoremap <s-l> $
" try to forget navigating through arrow keys
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>
" move keys between splits
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
" fast way to write ~ in russian
inoremap <leader>` ~
" }}}

" Text processing commands {{{
" make word a lowercase
inoremap <leader>u <esc>viwui
nnoremap <leader>u viwu
" make word a uppercase
inoremap <leader>U <esc>viw<s-u>i
nnoremap <leader>U viw<s-u>
" abbreviation
iabbrev @@ nurmukhametov.alex@gmail.com
iabbrev @isp@ oleshka@ispras.ru
" quotize the word under cursor
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
" }}}

" Tab/Windows/Modes manipulation {{{
" open split with .vimrc file
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" exit from insert mode
inoremap jk <esc>
inoremap <esc> <nop>
" }}}

" Python code snippet {{{
augroup python_snippets 
  autocmd FileType python iabbrev <buffer> iff if:jkha
  autocmd FileType python iabbrev <buffer> def def():jk3ha
  autocmd FileType python iabbrev <buffer> cls class:jkha
  " run pylint
  autocmd FileType python noremap <leader>l :PymodeLintAuto<cr>
augroup END
" }}}

" vim_git bindings {{{
nmap <leader>gs :call vim_git#status()<cr>
nmap <leader>gl :call vim_git#log()<cr>
nmap <leader>gb :call vim_git#branchList()<cr>
nmap <leader>gt :call vim_git#tagList()<cr>
nmap <leader>ga :call vim_git#addCurrent()<cr>
nmap <leader>gA :call vim_git#addAll()<cr>
nmap <leader>gc :call vim_git#commit()<cr>
nmap <leader>gC :call vim_git#commitAll()<cr>
nmap <leader>go :call vim_git#pushCurrent()<cr>
nmap <leader>gi :call vim_git#pullCurrent()<cr>
nmap <leader>gr :call vim_git#remoteList()<cr>
" }}}

" grep bindings {{{
nnoremap <leader>j :cnext<cr>
nnoremap <leader>k :cprevious<cr>
nnoremap <leader>f :set operatorfunc=GrepOperator<cr>g@
vnoremap <leader>f :<c-u>call GrepOperator(visualmode())<cr>

function! GrepOperator(type)
    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[v`]y
    else
        return
    endif

    silent execute "grep! -R " . shellescape(@@) . " ."
        copen
endfunction
" }}}

