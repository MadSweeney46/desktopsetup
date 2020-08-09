" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
    "File Explorer
    Plug 'scrooloose/NERDTree'
    "Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    "Hex Color
    Plug 'etdev/vim-hexcolor'
    "Hex Color 2
    Plug 'chrisbra/colorizer'
    "Powerline for vim
    Plug 'vim-airline/vim-airline'
    "Powerline themes for vim
    Plug 'vim-airline/vim-airline-themes'
    "Oceanic-Next theme
    Plug 'mhartington/oceanic-next'
    "Nord theme
    Plug 'arcticicestudio/nord-vim'

call plug#end()
