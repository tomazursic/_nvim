"   ------------------------------------------------------------
"   file: init.vim
"
"   Version: 1.3
"   ------------------------------------------------------------

"{ LOAD PLUGINS
" Activate matchit plugin
runtime! macros/matchit.vim

" Activate man page plugin
runtime! ftplugin/man.vim

" Extra pluggins with plug.vim
source ~/.config/nvim/plugins.vim
"}

"{ BUILTIN OPTIONS AND SE TTINGS
if !has('nvim')
    " Change cursor shapes based on whether we are in insert mode,
    " see https://vi.stackexchange.com/questions/9131/i-cant-switch-to-cursor-in-insert-mode
    let &t_SI = "\<esc>[6 q"
    let &t_EI = "\<esc>[2 q"
    if exists("&t_SR")
        let &t_SR = "\<esc>[4 q"
    endif

    " The number of color to use
    set t_Co=256
endif

filetype plugin indent on
syntax enable

" Set height of status line
set laststatus=2

" Changing fillchars for folding, so there is no garbage characters
set fillchars=fold:\ ,vert:\|

" Split window below/right when creating horizontal/vertical windows
set splitbelow splitright

" Time in milliseconds to wait for a mapped sequence to complete,
" see https://goo.gl/vHvyu8 for more info
set timeoutlen=500

" For CursorHold events
set updatetime=800

" Clipboard settings, always use clipboard for all delete, yank, change, put
" operation, see https://goo.gl/YAHBbJ
set clipboard+=unnamedplus

" Disable creating swapfiles, see https://goo.gl/FA6m6h
set noswapfile

" General tab settings
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " expand tab to spaces so that tabs are spaces

" Set matching pairs of characters and highlight matching brackets
set matchpairs+=<:>,「:」

" Show line numbers
set number

" File and script encoding settings for vim
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
scriptencoding utf-8

" Break line at predefined characters
set linebreak
" Character to show before the lines that have been soft-wrapped
set showbreak=↪

" do not wrap long lines by default
set nowrap

" Don't highlight current cursor line
set nocursorline
" Show current line where the cursor is
" set cursorline

" Minimum lines to keep above and below cursor when scrolling
set scrolloff=3

" Disable line/column number in status line
" Shows up in preview window when airline is disabled if not
" set noruler

" Set a ruler at column 80, see https://goo.gl/vEkF5i
" set colorcolumn=80
nnoremap <silent> <leader>c :execute "set colorcolumn="
                  \ . (&colorcolumn == "" ? "80" : "")<CR>

" Do not show mode on command line since vim-airline can show it
set noshowmode

" Fileformats to use for new files
set fileformats=unix,dos

" The mode in which cursorline text can be concealed
set concealcursor=nc

" The way to show the result of substitution in real time for preview
if exists("&inccommand")
    set inccommand=nosplit
endif

" Ignore certain files and folders when globing
set wildignore+=*.o,*.obj,*.bin,*.dll,*.exe
set wildignore+=*/.git/*,*/.svn/*,*/__pycache__/*,*/build/**
set wildignore+=*.pyc
set wildignore+=*.DS_Store
set wildignore+=*.aux,*.bbl,*.blg,*.brf,*.fls,*.fdb_latexmk,*.synctex.gz,*.pdf

" Ask for confirmation when handling unsaved or read-only files
set confirm

" Do not use visual and error bells
set novisualbell noerrorbells

" The level we start to fold
" zr - open all folds
" zm - folds all
" za - fold current block
" :set nofoldenable - to disable fold on load
set foldlevel=0

" The number of command and search history to keep
set history=500

" Use list mode and customized listchars
set list listchars=tab:▸\ ,extends:❯,precedes:❮,nbsp:+

" Auto-write the file based on some condition
set autowrite

" Show hostname, full path of file and last-mod time on the window title.
" The meaning of the format str for strftime can be found in
" http://tinyurl.com/l9nuj4a. The function to get lastmod time is drawn from
" http://tinyurl.com/yxd23vo8
set title
set titlestring=
set titlestring+=%(%{hostname()}\ \ %)
set titlestring+=%(%{expand('%:p')}\ \ %)
set titlestring+=%{strftime('%Y-%m-%d\ %H:%M',getftime(expand('%')))}

" Persistent undo even after you close a file and re-open it.
" For vim, we need to set up an undodir so that $HOME is not cluttered with
" undo files.
if !has('nvim')
    if !isdirectory($HOME . "/.local/vim/undo")
        call mkdir($HOME . "/.local/vim/undo", "p", 0700)
    endif
    set undodir=~/.local/vim/undo
endif
set undofile

" List all items and start selecting matches in cmd completion
" Enable menu list
" set wildmode=list:full
" set wildmenu

" Completion behaviour
" set completeopt+=menuone  " Show menu even if there is only one item
" set completeopt-=preview  " Disable the preview window

" Settings for popup menu
set pumheight=15  " Maximum number of items to show in popup menu
" if exists("&pumblend")
"     set pumblend=5  " Pesudo blend effect for popup menu
" endif

" Scan files given by `dictionary` option
" set complete+=k,kspell complete-=w complete-=b complete-=u complete-=t

" faster redrawing.
set ttyfast

" only redraw when necessary.
set lazyredraw

" Don't bell or blink
set noerrorbells

" Disable all bells.  I hate ringing/flashing.
set vb t_vb=

" Align indent to next multiple value of shiftwidth. For its meaning,
" see http://tinyurl.com/y5n87a6m
set shiftround

" Virtual edit is useful for visual block edit
set virtualedit=block

" Correctly break multi-byte characters such as CJK,
" see http://tinyurl.com/y4sq6vf3
set formatoptions+=mM

" Tilde (~) is an operator, thus must be followed by motions like `e` or `w`.
set tildeop

" Do not add two space after a period when joining lines or formatting texts,
" see https://tinyurl.com/y3yy9kov
set nojoinspaces

" Text after this column is not highlighted
set synmaxcol=500

" Higlites searches
set hls

" Increment search
set incsearch

" Ignore case in general, but become case-sensitive when uppercase is present
set ignorecase smartcase

" Do not use corsorcolumn
set nocursorcolumn
"}

" { FUNCTIONS
" Adjusting indentation rules manually
command! -nargs=1 Spaces execute "setlocal shiftwidth=" . <args> . " softtabstop=" . <args> . " expandtab" | set shiftwidth? softtabstop? expandtab?
command! -nargs=1 Tabs   execute "setlocal shiftwidth=" . <args> . " softtabstop=" . <args> . " noexpandtab" | set shiftwidth? softtabstop? expandtab?

" Remove trailing white space, see https://vi.stackexchange.com/a/456/15292
" function! StripTrailingWhitespaces() abort
"     let l:save = winsaveview()
"     keeppatterns %s/\v\s+$//e
"     call winrestview(l:save)
" endfunction

" Custom fold expr, adapted from https://vi.stackexchange.com/a/9094/15292
function! VimFolds(lnum)
    " get content of current line and the line below
    let l:cur_line = getline(a:lnum)
    let l:next_line = getline(a:lnum+1)

    if l:cur_line =~# '^"{'
        return '>' . (matchend(l:cur_line, '"{*') - 1)
    else
        if l:cur_line ==# '' && (matchend(l:next_line, '"{*') - 1) == 1
            return 0
        else
            return '='
        endif
    endif
endfunction

" Custom fold text, adapted from https://vi.stackexchange.com/a/3818/15292
" and https://vi.stackexchange.com/a/6608/15292
function! FoldText()
    let line = getline(v:foldstart)
    let folded_line_num = v:foldend - v:foldstart
    let line_text = substitute(line, '^"{\+', '', 'g')
    let fillcharcount = &textwidth - len(line_text) - len(folded_line_num) - 10
    return '+'. repeat('-', 4) . line_text . repeat('.', fillcharcount) . ' ('. folded_line_num . ' L)'
endfunction
"}

"{ VARIABLES
" Action trigger
let mapleader = ','

" === NETWR ===
"   https://wikileaks.org/ciav7p1/cms/page_3375350.html
" Setup for using build-in file explorer
" Set tree mode
let g:netrw_liststyle = 3
" Remove banner
let g:netrw_banner = 0
" Changing how files are opened
" 1 - open files in a new horizontal split
" 2 - open files in a new vertical split
" 3 - open files in a new tab
" 4 - open in previous window
" let g:netrw_browse_split = 1
" let g:netrw_browse_split = 4
"Set the width of the directory explorer
let g:netrw_winsize = 25
" let g:netrw_altv = 1

" Do not load tohtml.vim
let g:loaded_2html_plugin = 1

" Python VirtualEnv
let g:python_host_prog =  expand('/usr/bin/python')
let g:python3_host_prog = expand('/usr/bin/python3')
"}

"{ AUTO COMMANDS
" Do not use smart case in command line mode,
" extracted from https://goo.gl/vCTYdK
if exists("##CmdLineEnter")
    augroup dynamic_smartcase
        autocmd!
        autocmd CmdLineEnter : set nosmartcase
        autocmd CmdLineLeave : set smartcase
    augroup END
endif

" Set textwidth for text file types
augroup text_file_width
    autocmd!
    " Sometimes, automatic filetype detection is not right, so we need to
    " detect the filetype based on the file extensions
    autocmd BufNewFile,BufRead *.md,*.MD,*.markdown setlocal textwidth=79
augroup END

if exists("##TermOpen")
    augroup term_settings
        autocmd!
        " Do not use number and relative number for terminal inside nvim
        autocmd TermOpen * setlocal norelativenumber nonumber
        " Go to insert mode by default to start typing command
        autocmd TermOpen * startinsert
    augroup END
endif

" More accurate syntax highlighting? (see `:h syn-sync`)
augroup accurate_syn_highlight
    autocmd!
    autocmd BufEnter * :syntax sync fromstart
augroup END

" Return to last edit position when opening a file
augroup resume_edit_position
    autocmd!
    autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
        \ | execute "normal! g`\"zvzz"
        \ | endif
augroup END

" Display a message when the current file is not in utf-8 format.
" Note that we need to use `unsilent` command here because of this issue:
" https://github.com/vim/vim/issues/4379. For older Vim (version 7.4), the
" help file are in gzip format, do not warn this.
augroup ugroup non_utf8_file_warn
    autocmd!
    autocmd BufRead * if &fileencoding != 'utf-8' && expand('%:e') != 'gz'
                \ | unsilent echomsg 'File not in UTF-8 format!' | endif
augroup END

augroup vimfile_setting
    autocmd!
    autocmd FileType vim setlocal foldmethod=expr foldlevel=0 foldlevelstart=-1
    \ foldexpr=VimFolds(v:lnum) foldtext=FoldText()
    \ keywordprg=:help formatoptions-=o formatoptions-=r
augroup END

augroup pythonsyntax
    au BufNewFile,BufRead *.py setlocal foldmethod=indent nofoldenable
augroup END
"}

"{ CUSTOM KEY MAPPINGS
" Save key strokes (now we do not need to press shift to enter command mode).

" Forget arrows
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" Get rid of help keys
inoremap <F1> <ESC>
nmap <F1> <ESC>
vnoremap <F1> <ESC>

" Double jj in insert mode act as ESC
inoremap jj <Esc>

" Remap accidentally title W into lower w
noremap :W :w

" Remap accidentally quit from Q into lower q
noremap :Q! :q!
noremap :Qa :qa

" Split navigation - ctrl-jklm changes to that split
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Tabs setup
map <leader>T :tabnew<CR>
map <leader>To :tabonly<CR>
map <leader>Tc :tabclose<CR>
map <A-m> :tabn<CR>
map <A-n> :tabp<CR>

" Clear search matches highlight on CTRL-l (line 30 not working correctly)
nnoremap <silent><C-L> :nohlsearch<CR>
" Toggle search highlight, see https://goo.gl/3H85hh
" nnoremap <silent><expr> <Leader>hl (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"

" Remove trailing whitespace characters
" nmap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>
" nnoremap <silent> <leader>S :call StripTrailingWhitespaces()<CR>
nnoremap <silent> <leader>S :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:retab<CR>

" Remove windows' end of line
nmap <leader>mm :%s/^M$//g<CR>

" Save as sudo :w!!
cmap w!! w !sudo tee % >/dev/null

" Visual select pasted
nmap gV `[v`]

" Execute q macro
nmap Q @q
nmap Y y$

" Make current file executable
nmap <leader>X :!chmod +x %<CR>

" Turn the word under cursor to upper case (in INSET mode CTRL + u)
inoremap <silent> <c-u> <Esc>viwUea

" Turn the current word into title case (in INSET CTRL + t)
inoremap <silent> <c-t> <Esc>b~lea

" Navigation in the location and quickfix list
nnoremap [l :lprevious<CR>zv
nnoremap ]l :lnext<CR>zv
nnoremap [L :lfirst<CR>zv
nnoremap ]L :llast<CR>zv
nnoremap [q :cprevious<CR>zv
nnoremap ]q :cnext<CR>zv
nnoremap [Q :cfirst<CR>zv
nnoremap ]Q :clast<CR>zv

" Close location list or quickfix list if they are present,
" see https://goo.gl/uXncnS
nnoremap <leader>qc :windo lclose <bar> cclose<CR>

" Insert a blank line below or above current line (do not move the cursor),
" see https://stackoverflow.com/a/16136133/6064933
nnoremap <expr> oo 'm`' . v:count1 . 'o<Esc>``'
nnoremap <expr> OO 'm`' . v:count1 . 'O<Esc>``'

" Yank from current cursor position to the end of the line (make it
" consistent with the behavior of D, C)
nnoremap Y y$

" Move the cursor based on physical lines, not the actual lines.
nnoremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <silent> ^ g^
nnoremap <silent> 0 g0

" Do not include white space characters when using $ in visual mode,
" see https://goo.gl/PkuZox
xnoremap $ g_

" Jump to matching pairs easily in normal mode
nnoremap <Tab> %

" Continuous visual shifting (does not exit Visual mode), `gv` means
" to reselect previous visual area, see https://goo.gl/m1UeiT
xnoremap < <gv
xnoremap > >gv

" Brings up configuration with ,ev
map <leader>ev :tabnew $HOME/.config/nvim/init.vim<CR>
" Reload configuration ,sv
map <silent><leader>sv :source $HOME/.config/nvim/init.vim <CR> :echo 'Reloaded init.vim!'<CR>

" Search and replace visual selected trigger CTRL-r
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" search and replace CTRL + s
nnoremap <C-s> :'{,'}s/\<<C-r>=expand("<cword>")<CR>\>/

" search and replace with confirmation CTRL + h
nnoremap <C-h> :%s/\<<C-r>=expand("<cword>")<CR>\>//gc<left><left><left>

" toggle wrap mode
nmap <leader>wr :setlocal wrap!<CR>:setlocal wrap?<CR>

" CHECK this if its working
" Change current working directory locally and print cwd after that,
" see https://vim.fandom.com/wiki/Set_working_directory_to_the_current_file
" nnoremap <silent> <leader>cd :lcd %:p:h<CR>:pwd<CR>

" Set working directory to current open file location
nmap <leader>. :lcd %:p:h<CR>:cd .<CR>:pwd<CR>

" Use Esc to quit builtin terminal
if exists(":tnoremap")
    tnoremap <ESC>   <C-\><C-n>
endif

" Decrease indent level in insert mode with shift+tab
inoremap <S-Tab> <ESC><<i

" Change text without putting the text into register,
" see http://tinyurl.com/y2ap4h69
nnoremap c "_c
nnoremap C "_C
nnoremap cc "_cc

" Datetime mappings
nmap <leader>dt i<C-R>=strftime("%Y-%m-%d %H:%m")<CR><Esc>
imap <leader>dt <C-R>=strftime("%Y-%m-%d %H:%m")<CR>

" 'quote' a word
nnoremap <leader>' :silent! normal mpea'<Esc>bi'<Esc>`pl
" "double "quote" a word
nnoremap <leader>" :silent! normal mpea"<Esc>bi"<Esc>`pl
" " remove quotes from a word
nnoremap dq :silent! normal mpeld bhd `ph<CR>

" Autoclose with <TAB> and position cursor inside
inoremap '<tab> ''<left>
inoremap `<tab> ``<left>
inoremap "<tab> ""<left>
inoremap (<tab> ()<left>
inoremap [<tab> []<left>
inoremap {<tab> {}<left>
inoremap <<tab> <><left>

" Create block and auto close brackets with pressing Enter
inoremap {<CR> {<CR>}<c-o><s-o>
inoremap [<CR> [<CR>]<c-o><s-o>
inoremap (<CR> (<CR>)<c-o><s-o>

" Create jinja variable by hitting ,d
nnoremap <leader>bb a{{  }}<Left><Left><Left>
inoremap <leader>bb {{  }}<Left><Left><Left>

" comma then r, writes your current file, and runs python <name of file>, hit
" enter again after script completes to drop back into vim
nnoremap <leader>r :w<CR>:! python %<CR>

" Insert below cursor the python debugger
nnoremap <leader>pd oimport pdb; pdb.set_trace()<Esc>

" Open floating documentation window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Fold text mappings
nnoremap <space> za
vnoremap <space> zf

" Toilet
nmap <leader>8 :.!toilet -w 200 -f standard<CR>
nmap <leader>9 :.!toilet -w 200 -f small<CR>
nmap <leader>0 :.!toilet -w 200 -f term -F border<CR>
"}

"{ CLIPBOARD
" Copy/Paste from system clipboard
" <leader>Y to get current line in clipboard
" <leader>y to get only visual selection in clipboard
" paste it with <SHIFT>Insert
vmap <leader>y "+y
nmap <leader>y "+yy
" nmap <leader>Y "*Y
vmap <leader>d "+d
nmap <leader>p "+p
nmap <leader>P "+P
vmap <leader>p "+p
vmap <leader>P "+P

" Toggle paste
set pastetoggle=<leader>x
"}

"{ BUFFERS

" Back and fort last two buffers
nmap <leader>, <C-^>

" To move between buffers
nmap <leader>n :silent bnext<CR>
nmap <leader>m :silent bprevious<CR>

" Delete current buffer
nmap <leader>q :bd<CR>

" Close a buffer and switching to another buffer, do not close the
" window, see https://goo.gl/Wd8yZJ
nnoremap <leader>Q :bprevious <bar> bdelete #<CR>

" Scratch buffer :SC
command! SC vnew | setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
"}

"{ SPELL CHECKING
" Shortcut to toggle spelling
noremap <leader>s :call Spelling()<CR>
nmap <leader>s :set spell! spelllang=en_us<CR>
nmap <leader>ssi :set spell! spelllang=sl<CR>
nmap <leader>sit :set spell! spelllang=it<CR>
" Add custom words with zg
set spellfile=$HOME/.config/nvim/spell/dict.add
" Shortcuts using <leader>
" Jump to next error
map <leader>sn ]s
" Jump to previous error
map <leader>sp [s
" Add word to dict
map <leader>sa zg
" Show suggestions
map <leader>ss z=
" Select first correction from dict
map <leader>s. 1z=
"}

"{ UI SETTINGS
try
  colorscheme PaperColor
  " Toggle background color dark/light <leader>bg
catch
  colorscheme default
endtry

function! MonochroMe()
    if (&background == "light")
        set background=dark
    endif
    colorscheme monochrome
    :AirlineTheme night_owl
endfunction

" Switch to minimal eye candy
map <silent> <leader>mo :call MonochroMe()<CR>

function! DayNight()
    if (&background == "dark")
        set background=light
        let $BAT_THEME = 'Monokai Extended Light'
    else
        set background=dark
        let $BAT_THEME = 'Monokai Extended'
    endif
endfunction

" Toggle dark/white colorscheme with ,bg
" map <leader>bg :let &background = ( &background == "dark"? "light" : "dark"  )<CR>
map <leader>bg :call DayNight()<CR>
"}

"{ PLUGINS
" =========== "
" === FZF === "
" =========== "

" Floating window
let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }

" Make FZF to use reipgrep
if executable('rg')
  " Include gitignored files
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
endif

" Close fzf preview
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"

" Find files
nmap <leader>f :Files<CR>
" Find inside files content
nmap <leader>F :Find<space>
" Find files inside git project
nmap <leader>fg :GFiles<CR>
" List changed files and diff
nmap <leader>G :GF?<CR>
" Find from history
nmap <leader>: :History:<CR>
nmap <leader>/ :History/<CR>
" Help finder
nmap <leader>H :Helptags!<CR>

" Search inside project recursively the word under cursor (,ff)
nnoremap <silent><leader>ff :Find <C-R>=expand("<cword>")<CR><CR>

" h fzf-vim-commands (Buffers) support this
" Bind to leader + <Enter> the buffer list
nmap <silent> <leader><Enter> :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>

" == FZF FUNCTIONS ==
" Files window with preview
command! -bang -nargs=? -complete=dir Files
        \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Search inside files with reipgrep
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --ignore-file="*env" --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" Advanced grep(faster with preview) and (optinal use 'but' package)
function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)

" Floating fzf window with borders
function! CreateCenteredFloatingWindow()
    let width = min([&columns - 4, max([80, &columns - 20])])
    let height = min([&lines - 4, max([20, &lines - 10])])
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
endfunction

" Show open buffers
function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

" ================ "
" === Coc.nvim === "
" ================ "
" list of the extensions required
" https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions
let g:coc_global_extensions = [
            \'coc-rust-analyzer',
            \'coc-prettier',
            \'coc-python',
            \'coc-emmet',
            \'coc-yaml',
            \'coc-json',
            \'coc-git',
            \'coc-go'
            \]

" Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Use <tab> for trigger completion and navigate to next complete item
" this allow to navigate with tab over autocomplete options
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" coc-python (https://github.com/neoclide/coc-python)
" cmap ww noa w <CR>
" :CocAction('format')
nmap <leader>1 :Format<CR>

" Use command to change python interpreter
" https://github.com/neoclide/coc-python/issues/55
nmap <leader>2 :CocCommand python.setInterpreter<CR>

" Select python linter
nmap <leader>3 :CocCommand python.setLinter<CR>

" Show diganose
nmap <leader>4 :CocList diagnostics<CR>

" Handle filetype for jinja
let g:coc_filetype_map = {
      \ 'htmldjango': 'html',
      \ }

" == Coc FUNCTIONS ==

" Manual format command - don't format code on save
" Set auto format in coc-settings.json "coc.preferences.formatOnSaveFiletypes": ["python", "rust", "javascript", "typescript", "typescriptreact", "json", "javascriptreact"],
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:OR` command for organize imports of the current buffer.
" Set path to isort in coc-settings.json "python.sortImports.path": "/usr/local/bin/isort"
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" coc prettier function
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Show docs on things with K
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" == Coc Go ==
" vim +GoInstallBinaries
" ls -la $GOBIN

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
" This is disabled to allow coc.vim to do the gd resolution.
let g:go_def_mapping_enabled = 0

" Auto insert missing imports on save
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

" == Coc Snippets ==
" " Use <C-j> for jump to next placeholder, it's default of coc.nvim
" let g:coc_snippet_next = '<c-j>'

" " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
" let g:coc_snippet_prev = '<c-k>'

" " Use <C-j> for both expand and jump (make expand higher priority.)
" imap <C-j> <Plug>(coc-snippets-expand-jump)

" ================ "
" === AIRLINE ==== "
" ================ "

" Wrap in try/catch to avoid errors on initial install before plugin is available
try
  " Enable extensions
  let g:airline_extensions = ['branch', 'hunks', 'coc']

  " Disable vim-airline in preview mode
  let g:airline_exclude_preview = 1

  " Set coc.vim Errors and Warnings
  let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
  let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'

  " Configure error/warning section to use coc.nvim
  let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
  let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
catch
  echo 'Airline not installed. It should work after running :PlugInstall'
endtry

" ================ "
" === NERDTree === "
" ================ "

" Remove bookmarks and help text from NERDTree
let g:NERDTreeMinimalUI = 1
" Hide the Nerdtree status line to avoid clutter
let g:NERDTreeStatusline = ''

" Ignore files
let g:NERDTreeIgnore = ['\.pyc$', '^\.DS_Store$', '^tags$', '\.git$[[dir]]', '\.idea$[[dir]]', '\.sass-cache$']

" Automaticaly close nvim if NERDTree is only thing left open
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Custom highlight
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

" Toggle NERDTree on/off
nmap - :NERDTreeToggle<CR>
" Find open file in NERDTree
nmap _ :NERDTreeFind<CR>

" ================ "
" === Vim-Test === "
" ================ "
" Load test runners
let test#enabled_runners = [
            \ "python#pyunit",
            \ "python#pytest",
            \ "python#djangotest",
            \ "go#gotest",
            \ "rust#cargotest"
            \]

nmap <silent><leader>t :TestNearest<CR>
nmap <silent><leader>tf :TestFile<CR>
nmap <silent><leader>ts :TestSuite<CR>
nmap <silent><leader>tl :TestLast<CR>
nmap <silent><leader>tv :TestVisit<CR>
nmap <leader>tt :call ToggleTestOnSave()<CR>

" Toogle auto run tests on file save
function! ToggleTestOnSave()
    if !exists('#TestOnSaveGroup#BufWrite')
        augroup TestOnSaveGroup
            autocmd!
            autocmd BufWrite * if test#exists() |
                        \   TestFile |
                        \ endif
        augroup END
    else
        augroup TestOnSaveGroup
            autocmd!
        augroup END
    endif
endfunction

" If you want to scroll through the test command output, you'll have to first
" switch to normal mode. Remap to CTRL-o for the built-in mapping for exiting
" terminal insert mode is CTRL-\ CTRL-n
if has('nvim')
  tmap <C-o> <C-\><C-n>
endif

" Django related settings - keep databse not recrete
let test#python#djangotest#options = '--keepdb'

let test#strategy = "neovim"

" ==================== "
" === Git Fugitive === "
" ==================== "
" nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gt :Gcommit -v -q %:p<CR>
" nnoremap <leader>gd :Gdiff<CR>
" nnoremap <leader>ge :Gedit<CR>
" nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <leader>0l :silent! 0Glog<CR>
" nnoremap <leader>gp :Ggrep<Space>
" nnoremap <leader>gm :Gmove<Space>
" nnoremap <leader>gb :Git branch<Space>
" nnoremap <leader>go :Git checkout<Space>
" nnoremap <leader>gps :Dispatch! git push<CR>
" nnoremap <leader>gpl :Dispatch! git pull<CR>

" ================ "
" === vim-doge === "
" ================ "
let g:doge_doc_standard_python = 'numpy'
let g:doge_python_settings = {
\  'single_quotes': 0
\}
let g:doge_parsers = ['bash', 'python']

" ============= "
" === EMMET === "
" ============= "
" Default trigger with CTRL + y
"}

"{ ABBREVIATIONS/SNIPPETS
" Oh give me a brake insert me the right interpreter
iabbrev !p #!/usr/bin/env python
"}

"{ CHEAT SHEET
"
"   == Find help ==

"     :help!
"     :help 42
"     :Ni!
"     :help UserGettingBored
"     :help help
"     :help holy-grail
"
"   == Global search and replace ==
"
"     1) Search for files contains pattern
"         <leader>F
"
"     2) Inset pattern
"        :File <search_pattern>
"
"     3) Select all matches
"         Alt + a
"
"     4) Substitute
"        :cfdo %s/foo/baz/g
"
"    == Sort and find duplicates ==
"
"    :s/:/\r/g    <--- split on : and add new line
"    :sort
"    :g/^\(.*\)$\n\1$/p  <--- form sorted lines highlight duplicates

"    == Split all html tags onto their own lines ==
"
"    :s/<[^>]*>/\r&\r/g
"    :g/^$/d
"}
