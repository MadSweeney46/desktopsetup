set number

source $HOME/.config/nvim/vim-plug/plugins.vim

:let g:colorizer_auto_color = 1

"Starts Nerdtree only if a directory is chosen. Vim does'n show up if its a
"simple file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
"Starts Nerdtree only if a directory is chosen. Vim does'n show up if its a
"simple file end

"toggle NerdTree on and of. Has little use on directly opened files since
"nerdtree doesn't know the directory so it starts in $HOME
map <C-n> :NERDTreeToggle<CR>
"toggle NerdTree on and of. Has little use on directly opened files since
"nerdtree doesn't know the directory so it starts in $HOME end


"Closes the vim editor if the only open window is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"Closes the vim editor if the only open window is nerdtree end

"Vim Powerline theme
let g:airline_theme='badwolf'
