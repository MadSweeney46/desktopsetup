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
	Plug 'norcalli/nvim-colorizer.lua'
	"Powerline for vim
	Plug 'vim-airline/vim-airline'
	"Powerline themes for vim
	Plug 'vim-airline/vim-airline-themes'
	"Oceanic-Next theme
	Plug 'mhartington/oceanic-next'
	"Nord theme
	Plug 'arcticicestudio/nord-vim'
	"Forest night theme
	Plug 'sainnhe/forest-night'
	"Vim-Colors-XCode Theme
	Plug 'arzg/vim-colors-xcode'
	"Dart support for vim
	Plug 'dart-lang/dart-vim-plugin'
	"For dart autocompletion
	Plug 'natebosch/vim-lsc'
	Plug 'natebosch/vim-lsc-dart'
	"Dart intelli sense
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	"Start screen for neovim
	Plug 'mhinz/vim-startify'
	"VimDevicons shows the filetype icons in NERDTree or Startify
	Plug 'ryanoasis/vim-devicons'
        "Jsonc support since Coc does only supports Json
        Plug 'kevinoid/vim-jsonc'
        "Adds commas or semicolons to the end of the line
        Plug 'lfilho/cosco.vim'
        "Automatic color generation extension for vim
        Plug 'dylanaraps/wal.vim'
        "Dracula theme
        Plug 'dracula/vim',{'as':'dracula'}
        "Code commenting
        Plug 'tpope/vim-commentary'
        call plug#end()
