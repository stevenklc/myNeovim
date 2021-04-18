call plug#begin('~/AppData/Local/nvim/plugged')

Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
"Plug 'vim-airline/vim-airline'
Plug 'preservim/tagbar'
Plug 'itchyny/lightline.vim'
Plug 'luochen1990/rainbow'
Plug 'neoclide/coc.nvim', {'branch':'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'scrooloose/nerdcommenter' "註解
call plug#end()

"複製貼上功能
set clipboard=unnamed

let g:rainbow_active = 1
let g:rainbow_conf = {
\   'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
\   'ctermfgs': ['lightyellow', 'lightcyan','lightblue', 'lightmagenta'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
\       },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\       },
\       'html': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\       'css': 0,
\   }
\}

"set guifont=Fira\ Code:h29

autocmd BufRead *.py nmap <F5> :w<Esc>G:r!python %<CR>

" 顯示行號
set number
"設定相對行號
"colorscheme gruvbox
set background=dark
"半透明
"hi Normal ctermfg=252 ctermbg=none
highlight Normal guibg=NONE ctermbg=None
set t_Co=256

nmap <F8> :TagbarToggle<CR>



"目錄

autocmd vimenter * NERDTree "自動開啟NERDTree
let NERDTreeShowBookmarks=1 "自動開啟書籤
let g:NERDTreeChDirMode = 2
nnoremap <A-q> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif "剩下最後個視窗時關閉

" Tab設定
set list listchars=tab:»·,trail:·
nnoremap <Tab> >>
nnoremap <S-Tab> <<
inoremap <S-Tab> <C-d>
set tabstop=4
set shiftwidth=4
set shiftround
set expandtab

"自動移除末尾空白
autocmd BufWritePre * :%s/\s\+$//e

:nnoremap <A-x> :tabn<CR>
:nnoremap <A-c> :NERDTree<space>


"開啟Terminal
nnoremap <F3> :terminal<CR>
"退出Terminal
:tnoremap <Esc> <C-\><C-n>
"開啟分頁
nnoremap <F1> :tabe<CR>
"關閉分頁
nnoremap <F2> :close<CR>


" Bar T"H
"let g:lightline = {
      "\ 'colorscheme': 'wombat',
      "\}

let g:coc_global_extensions = [
             \ "coc-lists",
             \ "coc-vimlsp",
             \ "coc-python",
             \ "coc-tasks",
             \ "coc-yank",
             \ "coc-json",
             \ "coc-vimtex",
             \ "coc-css",
             \ "coc-clangd",
             \ "coc-cmake"]




" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
hi CocFloating ctermbg=8
"TEST
