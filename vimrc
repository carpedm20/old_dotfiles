""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Filename: .vimrc                                                         "
" Maintainer: Taehoon Kim <carpedm20@gmail.com>                              "
"        URL: http://github.com/carpedm20/dotfiles                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible         " get rid of Vi compatibility mode. SET FIRST!

filetype plugin indent on " filetype detection[ON] plugin[ON] indent[ON]

autocmd FileType make setlocal noexpandtab
autocmd FileType ruby setlocal sw=2 ts=2 sts=2
autocmd FileType html setlocal sw=2 ts=2 sts=2
autocmd FileType python setlocal sw=4 ts=4 sts=4

set ofu=syntaxcomplete#Complete

set t_Co=256              " enable 256-color mode.
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
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set smartindent           " automatically insert one extra level of indentation
set smarttab              " use tabs at the start of a line, spaces elsewhere
"set nowrap                " don't wrap text

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

ab W w
ab Wq wq
ab wQ wq
ab WQ wq
ab Q q
ab Set set
ab p set paste
