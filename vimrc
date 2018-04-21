" author: Stephen Kim
" my vim configuration file

" showing line numebrs
set number

" tabs become 4 spaces
" set shiftwidth=4
" set softtabstop=4
" set expandtab

" enables syntax
syntax on

" newline character will bring me to the same spot that i began
set autoindent

" mouse support
set mouse=a

" bindings for Java using abbreviations
ab sout System.out.println("");
ab souf System.out.printf("");
ab psvm 
\<CR>public static void main(String[] args){
\<CR>
\<CR>}

ab fori 
\<CR>for ( int i = 0; i < ; i++){
\<CR>
\<CR>}

vnoremap <C-c> "*y

" restore cursor when re-editing a file
augroup JumpCursorOnEdit
  au!
    autocmd BufReadPost *
        \ if expand(":p:h") !=? $TEMP |
        \   if line("'\"") > 1 && line("'\"") <= line("$") |
        \     let JumpCursorOnEdit_foo = line("'\"") |
        \     let b:doopenfold = 1 |
        \     if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
        \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
        \        let b:doopenfold = 2 |
        \     endif |
        \     exe JumpCursorOnEdit_foo |
        \   endif |
        \ endif
      " Need to postpone using "zv" until after reading the modelines.
    autocmd BufWinEnter *
        \ if exists("b:doopenfold") |
        \   exe "normal zv" |
        \   if(b:doopenfold > 1) |
        \       exe  "+".1 |
        \   endif |
        \   unlet b:doopenfold |
        \ endif
        augroup END

match ErrorMsg '\%>75v.\+'
