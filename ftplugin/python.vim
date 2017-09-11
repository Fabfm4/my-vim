" Hightlight after line 80                                                      
set colorcolumn=80

" Regular expresion to highlight
highlight OverLength ctermfg=red guibg=#592929
match OverLength /\%80v.\+/

" To install 'pip install flake8' is required
let g:syntastic_python_checkers = ['flake8']

setlocal expandtab
setlocal shiftwidth=4
setlocal tabstop=4

