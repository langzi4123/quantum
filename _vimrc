source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set encoding=utf-8
set nocompatible  
set number  
syntax enable  
syntax on "打开高亮  
colorscheme desert  
set nocompatible "不要vim模仿vi模式
behave mswin  

filetype off

set rtp+=$VIM/vimfiles/bundle/Vundle.vim/
call vundle#rc('$VIM/vimfiles/bundle/')
Plugin 'VundleVim/Vundle.vim'
Plugin 'vimcn/vimcdoc'
call vundle#end()
filetype plugin indent on


set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

