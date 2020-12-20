"Show relative line numbers
set number relativenumber
"Ignore case sensitivity for commands
set ic
"Show partial search matches
"set is
"Enable filetype detection
filetype on
"Vim Plugins
source $HOME/.config/nvim/vim-plug/plugins.vim
"Remap the leader key to the Space-key
:let mapleader = "\<Space>"
"Remap Colon key to ö
noremap ö :

"Map C-c to leader-ö
imap <Leader>ö <C-c>

"Fix indentation. The default is just too much
set expandtab
set shiftwidth=2

"toggle NerdTree on and of. Has little use on directly opened files since
"nerdtree doesn't know the directory so it starts in $HOME
noremap TT :NERDTreeToggle<CR>
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber
"Starts Nerdtree only if a directory is chosen. Vim does'n show up if its a
"simple file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
"Starts Nerdtree only if a directory is chosen. Vim does'n show up if its a
"simple file end

"Split navigation shortcuts
"Remapped from <C-w>+{split direction key} to <C-{split direction key}
"This comes in handy for e.g. NerdTree Navigation
map <Leader>wh <C-w>h
map <Leader>wj <C-w>j
map <Leader>wk <C-w>k
map <Leader>wl <C-w>l

"Shortcuts for switching between buffers
map gh :bn<cr>
map gl :bp<cr>

"Quickly insert an empty new line without entering insert mode
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>

"Closes the vim editor if the only open window is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"Closes the vim editor if the only open window is nerdtree end

"Colorizer and general colortheme
colorscheme wal
"lua require'colorizer'.setup()

" Theme
syntax enable
let g:forest_night_enable_italic = 1
"let g:forest_night_disable_italic_comment = 1
"let g:forest_night_diagnostic_line_highlight = 1
let g:airline_theme = 'forest_night'

"Colorizer and general colortheme end


"Vim Powerline theme
"let g:airline_theme='forest-night'


" unicode symbols for airline
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'


"Some coc stuff (used for flutter development) start
"default keymaps for lsc (needed for flutter development)
let g:lsc_auto_map = v:true

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
"set nobackup
"set nowritebackup
" check for and load file changes
autocmd WinEnter,BufWinEnter,FocusGained * checktime

" disable swapfile to avoid errors on load
set noswapfile


" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
"The two inoremaps below aren't really necessary. If the code completion
"dropdown list is visiple we can navigate in there with the Tab key wich goes
"the list of values down or Tab key + shift key which goes the dropdown list
"up. The same can be accomplished with Ctrl+n which does the same as the Tab
"key and with the Ctrl+p wich does the same as the Tab key + super key
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

"gy and gv don't work. maybe they can be removed
nmap <silent> gt <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gv <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"Show documentation in preview window
nnoremap <silent> D :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
" Can be removed in my opinion
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
" The two commands below can be removed in my opinion
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json,dart setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>d  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"Using CocCommand
"Flutter run
nnoremap <leader>fr :<C-u>CocCommand flutter.run<cr>
"Flutter hot restart
nnoremap <leader>fhr :<C-u>CocCommand flutter.dev.hotRestart<cr>
"Flutter open/close console
nnoremap <leader>fsl :<C-u>CocCommand flutter.dev.openDevLog<cr>
nnoremap <leader>fel :<C-u>execute "bd! " "output:///flutter-dev"<cr>
"Flutter dev tools
nnoremap <leader>fd :<C-u>CocCommand flutter.dev.openDevToolsProfiler<cr>

"Startify stuff start
let g:startify_bookmarks = [ {'f': '~/development/projects/flutter/life_manager/lib/'} ]

"Updates Startify page on the fly and not only, when Vim exits
let g:startify_update_oldfiles = 0
"Automatically update sessions in two cases:

"    - Before leaving Vim
"    - Before loading a new session via :SLoad
let g:startify_session_persistence = 0

let g:startify_lists = [
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'files',     'header': ['   Recent files']            },
          \ { 'type': 'dir',       'header': ['   CWD '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'commands',  'header': ['   Commands']       },
          \ ]
let g:startify_custom_header = [
	     \ '                        ',
	     \ '                        ',
	     \ '   /$$   /$$  /$$$$$$   ',   
             \ '   | $$  | $$ /$$__  $$ ',
             \ '   | $$  | $$| $$  \__/ ',
             \ '   | $$$$$$$$| $$$$$$$  ',
             \ '   |_____  $$| $$__  $$ ',
             \ '         | $$| $$  \ $$ ',
             \ '         | $$|  $$$$$$/ ',
             \ '         |__/ \______/  ',
	     \ ]       
let g:airline_powerline_fonts = 1
"Startify stuff end

"Cosco
autocmd FileType dart nmap <silent> <C-c> <Plug>(cosco-commaOrSemiColon)
"autocmd FileType dart imap <silent> <Leader>; <c-o><Plug>(cosco-commaOrSemiColon)
"Cosco end
