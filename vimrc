" ==============================================
" dotfiles/vimrc
"
" Author: Hiromasa IWAYAMA
" based on http://github.com/hiwayama/dotfiles
" ==============================================

if 0 | endif

" neobundle
if has('vim_starting')
  if &compatible
    set nocompatible
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Plugin list
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'junegunn/vim-easy-align'

NeoBundleLazy 'kchmck/vim-coffee-script', {'autoload': {'filetypes':['coffee']}}
NeoBundleLazy 'vim-ruby/vim-ruby', {'autoload': {'filetypes':['ruby', 'erb']}}
NeoBundleLazy 'plasticboy/vim-markdown', {'autoload': {'filetypes':['markdown']}}
NeoBundleLazy 'derekwyatt/vim-scala', {'autoload': {'filetypes':['scala']}}
NeoBundleLazy 'vim-perl/vim-perl', {'autoload': {'filetypes':['perl']}}
" NeoBundle 'h1mesuke/unite-outline'
" NeoBundle 'scrooloose/syntastic' 保存が遅くなる...

call neobundle#end()

set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,iso-2022-jp,euc-jp,sjis,cp932,cp20932

filetype plugin indent on

syntax on
set modelines=5
set number
set directory=$HOME/.vim/tmp " Backup Directory
set clipboard=unnamed
set history=100 " keep 100 lines of command line history
set display=lastline

" Search
set hlsearch
set incsearch
nmap <ESC><ESC> :nohlsearch<CR><ESC>

" Cursorline
set cursorline cursorcolumn
highlight clear CursorLine
highlight CursorLine gui=underline ctermbg=black
highlight clear CursorColumn
highlight CursorColumn gui=underline ctermbg=black

" Statusline
set statusline=%F%m%r%h%w\%=%{fugitive#statusline()}[TYPE=%Y]\[ENC=%{&fileencoding}:%{&ff}]\[ROW=%l/%L]
set laststatus=2
highlight StatusLine ctermfg=Green
augroup ch_status_color
  autocmd! ch_status_color
  autocmd InsertEnter * highlight StatusLine ctermfg=Yellow
  autocmd InsertLeave * highlight StatusLine ctermfg=Green
augroup END

" Tab,Indent
set expandtab
set tabstop=2 softtabstop=0
set shiftwidth=2

au BufRead *.pm set noet " 過去のperlファイルはハードタブで開く

" Key bind for Wraparound
set whichwrap=b,s,h,l,[,],<,>,~

" Load Templates
augroup load_templates
  autocmd!
  autocmd BufNewFile *.haml 0r $HOME/.vim/template/template.haml
  autocmd BufNewFile *.rb   0r $HOME/.vim/template/template.rb
  autocmd BufNewFile *.py   0r $HOME/.vim/template/template.py
  autocmd BufNewFile *.pl   0r $HOME/.vim/template/template.pl
  autocmd BufNewFile *.t    0r $HOME/.vim/template/template.t
  autocmd BufNewFile *.pm   0r $HOME/.vim/template/template.pm
  autocmd BufNewFile *.vim  0r $HOME/.vim/template/template.vim
  autocmd BufNewFile *Suite.scala 0r $HOME/.vim/template/template.suite.scala
augroup END

" 行末スペース自動削除
autocmd BufWritePre * :%s/\s\+$//e

" for golang
if $GOROOT != ''
  set rtp+=${GOROOT}/misc/vim
endif

" load key mapping setting
source $HOME/.vim/vimrc.mapping
" load plugin dependent setting file
source $HOME/.vim/vimrc.plugins_setting

let omni_sql_no_default_maps=1
