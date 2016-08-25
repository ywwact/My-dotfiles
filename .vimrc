" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2016 Mar 25
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.


"Change the working dir to 'Documents'
"cd /Users/wanghongkuan/Documents
" 把系统自带vim 主题设置成molokai. Macvim 主题设置在.gvimrc
colorscheme molokai
"--------------------------------------------------
" 基础设置
"--------------------------------------------------
" 调整Tab的空格数
"if has("autocmd")
"    autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab
"    autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
"endif
" 高亮光标
set cursorline
" Tab 空格数为4
set tabstop = 4
" 显示行号
set number
set relativenumber
" 光标位置
set ruler
" 未完成命令
set showcmd
" 语法高亮
syntax on
" 语法漂亮
let python_highlight_all=1
" 历史记录
set history=50
" --------------------------------------------------
" 搜索设置
" --------------------------------------------------
set hlsearch
set incsearch
set wrapscan
" Powerline 设置
set laststatus=2
let g:Powerline_symbols='unicode'
" YouCompleteMe and Ultisnips setting
function! g:UltiSnips_Complete()
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res == 0
    if pumvisible()
      return "\<C-n>"
    else
      call UltiSnips#JumpForwards()
      if g:ulti_jump_forwards_res == 0
        return "\<TAB>"
      endif
    endif
  endif
  return ""
endfunction

function! g:UltiSnips_Reverse()
  call UltiSnips#JumpBackwards()
  if g:ulti_jump_backwards_res == 0
    return "\<C-P>"
  endif

  return ""
endfunction


if !exists("g:UltiSnipsJumpForwardTrigger")
  let g:UltiSnipsJumpForwardTrigger = "<tab>"
endif

if !exists("g:UltiSnipsJumpBackwardTrigger")
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
endif

au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger     . " <C-R>=g:UltiSnips_Complete()<cr>"
au InsertEnter * exec "inoremap <silent> " .     g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"


" Vundle 设置
set nocompatible " be iMproved
filetype off " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
"这是vundle本身的设置
Bundle 'gmarik/vundle'
 
" My Bundles here:
"这里是设置你自己自定义的插件的设置vundle设置，注意：下载的插件git为：https://github.com/godlygeek/tabular.git，则设置为Bundle 'godlygeek/tabular';https://github.com/gmarik/vundle.git设置则为 Bundle 'gmarik/vundle'
" original repos on github
Bundle 'godlygeek/tabular'
Bundle 'matchit.zip'
Bundle 'scrooloose/nerdtree'
Bundle 'Valloric/YouCompleteMe'
" vim-scripts repos，vim-scripts的访问地址，格式则如下:
Bundle 'L9'
Bundle 'FuzzyFinder'
" non github repos ，非git的访问地址的，格式如下:
Bundle 'git://git.wincent.com/command-t.git'
Bundle "Lokaltog/vim-powerline"
" Ultisnips 安装与设置
" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" ...

filetype plugin indent on " required!
"
" Brief help
" :BundleList- list configured bundles
" :BundleInstall(!)- install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)- confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed.. 

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"if has("vms")
"  set nobackup		" do not keep a backup file, use versions instead
"else
"  set backup		" keep a backup file (restore to previous version)
"  set undofile		" keep an undo file (undo changes after closing)
"endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif


" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
packadd matchit
