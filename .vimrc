" Plugins
"
" Install vim-plug if it isn't already installed

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Begin plugin section
call plug#begin('~/.vim/plugged')

" Symbol alignment
Plug 'junegunn/vim-easy-align'

" GitHub integration
Plug 'junegunn/vim-github-dashboard'

" File tree explorer
Plug 'preservim/nerdtree'

" Comment/uncomment code
Plug 'tpope/vim-commentary'

" Fuzzy search
Plug 'junegunn/fzf.vim'

" LSP
Plug 'dense-analysis/ale'

" Code completion
Plug 'neoclide/coc.nvim'

" Syntax highlighting for EVERYTHING
Plug 'sheerun/vim-polyglot'

" Git support
Plug 'tpope/vim-fugitive'

" Colour scheme
Plug 'w0ng/vim-hybrid'

" Dim inactive buffers
Plug 'TaDaa/vimade'

" Initialize plugin system
call plug#end()

" Install missing plugins on boot
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
set laststatus=2

" End plugin section

" Colour scheme
set background=dark
colorscheme hybrid

" Line numbers
set nu

" UTF-8 by default
set encoding=utf-8

" Navigate split window
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" File explorer
autocmd VimEnter *
  \ if !argc()
  \| NERDTree
  \| wincmd p 

" Terminal
autocmd VimEnter *
  \ if !argc()
  \| vertical botright terminal
autocmd VimEnter *
  \ if !argc()
  \| wincmd p

