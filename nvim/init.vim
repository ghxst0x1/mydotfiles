:set number
:set mouse=a
:set smarttab

call plug#begin('C:/User/GhxsT/AppData/Local/nvim/autoload/plugged')

Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'jiangmiao/auto-pairs'

" Themes
Plug 'folke/tokyonight.nvim'

call plug#end()

colorscheme tokyonight-night

nnoremap <C-l> :NERDTreeToggle<CR>

