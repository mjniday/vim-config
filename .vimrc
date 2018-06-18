set nocompatible

call plug#begin('~/.vim/plugged')
 
Plug 'altercation/vim-colors-solarized'
Plug 'airblade/vim-gitgutter'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'
Plug 'dracula/vim'
Plug 'reasonml-editor/vim-reason-plus'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'

call plug#end()

syntax on
set background=dark
colorscheme dracula
set backspace=indent,eol,start
set mouse=a
set guifont=Ubuntu\ Mono\ 9
set ruler
set number
set cursorline
hi CursorLine cterm=NONE ctermbg=black ctermfg=white guibg=black ctermfg=white
inoremap jj <Esc>

" Searching
set ignorecase

" Tab settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set copyindent

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Searching files
set path+=**
set wildignore+=*/node_modules/*,

" Customizing grep
function! SearchQuery(query)
  if !empty(a:query)
    execute 'silent grep -R' a:query | copen
  else
    echo "Empty search term"
  endif
  redraw!
endfunction

command! -nargs=1 Search call SearchQuery(<q-args>)

" vim-javascript
let g:javascript_plugin_jsdoc = 1

" vim-jsx
let g:jsx_ext_required = 0

" ale
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_echo_msg_warning_str = '⚠ Warning'
let g:ale_echo_msg_error_str = '✗ Error'
let g:ale_echo_msg_format = '[%linter% %severity%] %s'
let g:ale_completion_enabled = 1

" ReasonML language support
let g:LanguageClient_serverCommands = {
    \ 'reason': ['ocaml-language-server', '--stdio'],
    \ 'ocaml': ['ocaml-language-server', '--stdio'],
    \ }

let g:LanguageClient_autoStart = 1
