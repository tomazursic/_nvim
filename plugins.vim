" ============================================================================ "
" ===                               PLUGINS                                === "
" ============================================================================ "

" check whether vim-plug is installed and install it if necessary
let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'
if !filereadable(plugpath)
    if executable('curl')
        let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
        if v:shell_error
            echom "Error downloading vim-plug. Please install it manually.\n"
            exit
        endif
    else
        echom "vim-plug not installed. Please install it manually or install curl.\n"
        exit
    endif
endif

call plug#begin('~/.config/nvim/plugged')

" === Editing Plugins === "

" Comment stuff out
Plug 'tpope/vim-commentary'

" Intellisense Engine
" Plug 'neoclide/coc.nvim', { 'do': 'yarn install' }
" Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Fuzzy search fzf as well using vim-plug
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Snippet support
" Plug 'honza/vim-snippets'

" HTML, ccs, js completion tool
Plug 'mattn/emmet-vim', { 'for': 'html' }

" Distraction-free writing
Plug 'junegunn/goyo.vim'

" Trailing whitespace highlighting & automatic fixing
" Plug 'ntpeters/vim-better-whitespace'

" === Git Plugins === "
" Enable git changes to be shown in sign column
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

" === UI === "
" File explorer
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Colorscheme
Plug 'NLKNguyen/papercolor-theme'

" Customized vim status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" === GO Plugins === "
" https://github.com/fatih/vim-go/wiki/Tutorial#quick-setup
Plug 'fatih/vim-go'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" === Testing Plugins === "
Plug 'vim-test/vim-test'
Plug 'alfredodeza/coveragepy.vim'

" TOML syntax support
Plug 'cespare/vim-toml'

" File overview of the code as a minimap sidebar
" Plug 'wfxr/minimap.vim', {'do': ':!cargo install --locked code-minimap'}

" --- Disabled Plugins --- "

" Quoting & parenthesizing
" Plug 'tpope/vim-surround'

" auto-close plugin
" Plug 'rstacruz/vim-closer'

" Print function signatures in echo area
" Plug 'Shougo/echodoc.vim'

" Write different documentation styles
Plug 'kkoomen/vim-doge'
" Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }

" === Javascript Plugins === "
" Typescript syntax highlighting
" Plug 'HerringtonDarkholme/yats.vim'

" ReactJS JSX syntax highlighting
" Plug 'mxw/vim-jsx'

" Generate JSDoc commands based on function signature
" Plug 'heavenshell/vim-jsdoc'

" === Syntax Highlighting === "

" Syntax highlighting for javascript libraries
" Plug 'othree/javascript-libraries-syntax.vim'

" Improved syntax highlighting and indentation
" Plug 'othree/yajs.vim'


" Initialize plugin system
call plug#end()
