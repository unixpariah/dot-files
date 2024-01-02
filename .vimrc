packloadall

let mapleader=" " " Map leader key to space

call plug#begin()
Plug 'jiangmiao/auto-pairs'
Plug 'frazrepo/vim-rainbow'
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'evanleck/vim-svelte'
Plug 'rust-lang/rust.vim'
Plug 'sbdchd/neoformat'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'OmniSharp/omnisharp-vim'
Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'tomlion/vim-solidity'
Plug 'mattn/emmet-vim'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
let g:coc_global_extensions = ['coc-tsserver']
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost   l* nested lwindow
call plug#end()
filetype plugin indent on

" Basic settings:
set nocompatible
set encoding=utf-8
set ignorecase
set number relativenumber
filetype on
syntax on
filetype plugin indent on
set clipboard=unnamedplus
let &t_SI ="\e[6 q"
let &t_EI ="\e[2 q"
set textwidth=100

" Enable autocompletion:
set wildmode=longest,list,full

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Splits open to bottom or right:
set splitbelow splitright

" Deletes trailing whitespace on save:
autocmd BufWritePre * %s/\s\+$//e

" Emmet shortcuts:
let g:user_emmet_mode='n'
let g:user_emmet_leader_key=','

" CoC settings:
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "\<Tab>"
set updatetime=300
hi CocInfoFloat guifg=#00ADB5
hi CocErrorFloat guifg=#903749
hi CocWarningFloat guifg=#E38B29
hi CocHintFloat guifg=#272829
let g:coc_global_extensions = ['coc-omnisharp']

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Color scheme
colorscheme molokai
hi Normal ctermbg=NONE
hi Visual term=reverse cterm=reverse

" Prettier settings
let g:prettier#exec_cmd_path = "~/.vim/pack/plugins/start/vim-prettier/node_modules/.bin/prettier"
autocmd BufWritePre *.html,*.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

" Neoformat settings
augroup fmt
  autocmd!
  autocmd BufWritePre *.cs undojoin | Neoformat
augroup END

" Rust lsp
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ }

let g:rustfmt_autosave = 1

" NerdTree settings"
autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-n> :wincmd p<CR>
nnoremap <C-t> :NERDTree<CR>
let g:NERDTreeGitStatusUseNerdFonrs = 1
let g:NERDTreeWinPos = "right"

" rainbow brackets settings
let g:rainbow_active = 1
