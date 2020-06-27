au FileType python
  \ | let b:Comment="#"
  \ | let b:EndComment=""
  \ | runtime! include/spacing/four.vim

au FileType rust
    \ let b:Comment="//"
    \ | let b:EndComment=""
    \ | runtime! include/spacing/four.vim
    \ | syntax sync fromstart

au FileType go
   \ let b:Comment="//"
   \ | let b:EndComment=""
   \ | runtime! include/spacing/eight.vim
   \ | setlocal noexpandtab
   \ | setlocal colorcolumn=100

au FileType conf
  \ let b:Comment="#"
  \ | let b:EndComment=""
  \ | runtime! include/spacing/two.vim
  \ | set indentexpr=
  \ | set smartindent

au FileType toml
  \ let b:Comment="#"
  \ | let b:EndComment=""
  \ | runtime! include/spacing/two.vim
  \ | set indentexpr=
  \ | set smartindent

au FileType yaml
  \ let b:Comment="#"
  \ | let b:EndComment=""
  \ | runtime! include/spacing/two.vim
  \ | set indentexpr=
  \ | set smartindent

au FileType java
  \ let b:Comment="//"
  \ | let b:EndComment=""
  \ | runtime! include/spacing/four.vim

au FileType javascript
  \ let b:Comment="/*"
  \ | let b:EndComment="*/"
  \ | runtime! include/spacing/two.vim

au FileType c
  \ let b:Comment="/*"
  \ | let b:EndComment="*/"
  \ | runtime! include/spacing/four.vim

au FileType cpp
  \ let b:Comment="//"
  \ | let b:EndComment=""
  \ | runtime! include/spacing/four.vim

au FileType nginx
  \ let b:Comment="#"
  \ | let b:EndComment=""
  \ | runtime! include/spacing/four.vim
  \ | set smartindent

au FileType tex
  \ let &mp="clear; pdflatex %"
  \ | let b:Comment="%"
  \ | let b:EndComment=""

au FileType lua
  \ let &mp="clear; lua %"
  \ | let &efm="lua: %f:%l:%m,%-G%.%#"
  \ | let b:Comment="--"
  \ | let b:EndComment=""

au FileType php
  \ let b:Comment="//"
  \ | let b:EndComment=""
  \ | runtime! include/spacing/two.vim

" Make PHP use smartindent dammit!
" (This is so HTML indenting is sane.)
au BufRead,BufNewFile *.html set smartindent
au BufRead,BufNewFile *.php set smartindent
au BufRead,BufNewFile *.jgr set smartindent

au FileType lisp
  \ let b:Comment=";"
  \ | let b:EndComment=""

au FileType sh
  \ let b:Comment="#"
  \ | let b:EndComment=""
  \ | runtime! include/spacing/two.vim

au FileType zsh
  \ let b:Comment="#"
  \ | let b:EndComment=""
  \ | runtime! include/spacing/two.vim

au FileType mako
  \ let b:Comment="<%doc>"
  \ | let b:EndComment="</%doc>"
  \ | set smartindent

au FileType crontab
  \ let b:Comment="#"
  \ | let b:EndComment=""

au FileType conf
  \ let b:Comment="#"
  \ | let b:EndComment=""

au FileType make
  \ let b:Comment="#"
  \ | let b:EndComment=""

au FileType html
  \ let b:Comment="<!--"
  \ | let b:EndComment="-->"

au BufEnter *.html setlocal smartindent
au BufEnter *.tpl setlocal smartindent

au FileType htmldjango
  \ let b:Comment="{% comment %}"
  \ | let b:EndComment="{% endcomment %}"

au FileType css
  \ let b:Comment="/*"
  \ | let b:EndComment="*/"

au FileType vim
  \ let b:Comment='"'
  \ | let b:EndComment=""

au FileType ledger
  \ let b:Comment=";"
  \ | let b:EndComment=""
  \ | runtime! include/spacing/four.vim

au FileType wini
  \ let b:Comment="#"
  \ | let b:EndComment=""
  \ | runtime! include/spacing/two.vim

