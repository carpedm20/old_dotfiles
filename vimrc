""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Filename: .vimrc                                                         "
" Maintainer: Taehoon Kim <carpedm20@gmail.com>                              "
"        URL: http://github.com/carpedm20/dotfiles                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible         " get rid of Vi compatibility mode. SET FIRST!

filetype plugin indent on " filetype detection[ON] plugin[ON] indent[ON]

set ofu=syntaxcomplete#Complete

set t_Co=256              " enable 256-color mode.
syn sync fromstart
syntax enable             " enable syntax highlighting (previously syntax on).
colorscheme molokai       " set colorscheme

" Prettify JSON files
autocmd BufRead,BufNewFile *.json set filetype=json
autocmd Syntax json sou ~/.vim/syntax/json.vim

" Prettify Vagrantfile
autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby

" Prettify Markdown files
augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.

set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set smartindent           " automatically insert one extra level of indentation
set smarttab              " use tabs at the start of a line, spaces elsewhere
"set nowrap                " don't wrap text

setlocal spelllang=en_us

au FileType cpp        setl ts=2 sw=2 sts=2
au FileType javascript setl ts=2 sw=2 sts=2
au FileType ruby       setl ts=2 sw=2 sts=2
au FileType xml        setl ts=2 sw=2 sts=2
au FileType yaml       setl ts=2 sw=2 sts=2
au FileType html       setl ts=2 sw=2 sts=2
au FileType htmldjango setl ts=2 sw=2 sts=2
au FileType lua        setl ts=2 sw=2 sts=2
au FileType haml       setl ts=2 sw=2 sts=2
au FileType css        setl ts=2 sw=2 sts=2
au FileType sass       setl ts=2 sw=2 sts=2
au FileType less       setl ts=2 sw=2 sts=2
au Filetype rst        setl ts=3 sw=3 sts=3
au FileType golang     setl noet
au FileType make       setl ts=4 sw=4 sts=4 noet
au FileType python     setl sw=4 ts=4 sts=4
au FileType markdown   setl ts=4 sw=4 sts=4
au FileType md         setl ts=4 sw=4 sts=4
au FileType go         setl ts=4 sw=4 sts=4

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

nmap <F2> :tabprevious<Enter>
nmap <F3> :tabnext<Enter>
nmap <F4> :tabnew<Enter>
nmap <F5> :make <Enter>
nmap <F6> :TlistToggle<Enter>
nmap <F9> :NERDTree<Enter>

ab Wq wq
ab wQ wq
ab WQ wq
ab Q q
ab Set set
ab p set paste
ab W w

filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on
