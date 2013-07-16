" ==============================================
" dotfiles/vimrc
"
" Author: Hiromasa IWAYAMA
" based on http://github.com/ymis1080/dotfiles
" ==============================================

set nocompatible " vi interchange off
filetype off

" dotfiles directory path
" WARN: please change to a suitable path
let s:dotfiles_path='~/dotfiles/'

" neobundle
if has('vim_starting')
  set runtimepath+=~/.vim/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))

" Plugin list
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tpope/vim-fugitive'

NeoBundleLazy 'kchmck/vim-coffee-script', {'autoload': {'filetypes':['coffee']}}
NeoBundleLazy 'vim-ruby/vim-ruby', {'autoload': {'filetypes':['ruby', 'erb']}}
NeoBundleLazy 'plasticboy/vim-markdown', {'autoload': {'filetypes':['markdown']}}
NeoBundleLazy 'derekwyatt/vim-scala', {'autoload': {'filetypes':['scala']}}
NeoBundleLazy 'vim-perl/vim-perl', {'autoload': {'filetypes':['perl']}}
" NeoBundle 'h1mesuke/unite-outline'
" NeoBundle 'mdreves/vim-scaladoc' +pythonでvimをコンパイルしてから...
" NeoBundle 'scrooloose/syntastic' 保存が遅くなる...

syntax on
set number
set directory=$HOME/.vim/tmp " Backup Directory
set clipboard=unnamed
set history=100 " keep 100 lines of command line history

filetype plugin indent on

" Search
set hlsearch
set incsearch
nmap <ESC><ESC> :nohlsearch<CR><ESC>

" Cursorline
set cursorline
highlight clear CursorLine
highlight CursorLine gui=underline ctermbg=black

" Statusline
set statusline=%F%m%r%h%w\%=[TYPE=%Y]\[ENC=%{&fileencoding}:%{&ff}]\[ROW=%l/%L]
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

" Key bind for Wraparound
set whichwrap=b,s,h,l,[,],<,>,~

" Load Templates
augroup load_templates
  autocmd!
  autocmd BufNewFile *.haml 0r $HOME/.vim/template/template.haml 
  autocmd BufNewFile *.rb   0r $HOME/.vim/template/template.rb
  autocmd BufNewFile *.py   0r $HOME/.vim/template/template.py
  autocmd BufNewFile *.pl   0r $HOME/.vim/template/template.pl
  autocmd BufNewFile *.vim  0r $HOME/.vim/template/template.vim
  autocmd BufNewFile *Suite.scala 0r $HOME/.vim/template/template.suite.scala
augroup END

" load key mapping setting
execute "source" s:dotfiles_path.'vimrc.mapping'

" load plugin dependent setting file
execute "source" s:dotfiles_path.'vimrc.plugins_setting'

