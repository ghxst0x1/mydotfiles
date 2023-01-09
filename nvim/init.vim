:set number
:set mouse=a
:set smarttab

call plug#begin('C:/Users/GhxsT/AppData/Local/nvim/autoload/plugged')

Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'jiangmiao/auto-pairs'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-treesitter/nvim-treesitter'


" Themes
Plug 'folke/tokyonight.nvim'

call plug#end()

colorscheme tokyonight-night

" KeyBinds

"" NERDTree
nnoremap <C-l> :NERDTreeToggle<CR>

"" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

