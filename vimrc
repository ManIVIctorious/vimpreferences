""Settings for minpac package manager
 "add minimal package manager and initialize it
  packadd minpac
  call minpac#init()

 "set list of packages to be installed
  call minpac#add('k-takata/minpac', {'type': 'opt'})
  call minpac#add('altercation/vim-colors-solarized')
  call minpac#add('sjl/gundo.vim')
  call minpac#add('SirVer/ultisnips')

 "add shortcut commands for installing/updating and uninstalling packages
 " to uninstall just remove the package from above list and use PackClean
  command! PackUpdate call minpac#update()
  command! PackClean  call minpac#clean()

""Settings specific for installed packages
 "Map :GundoToggle to <F4>
  nnoremap <F4> :GundoToggle<CR>

""Settings for the graphical user interface and syntax highlighting
  syntax on                   "enable Syntax Highlighting
  set background=dark         "possible values: light/dark
  set guifont=Monospace\ 10   "to set interactively type 'set guifont=*' in gvim

 "set used colorscheme for GUI-mode and terminal mode respectively
  if has("gui_running")
    colorscheme solarized
  else
    colorscheme desert
  endif


""Settings applyable to standard/unextended vim

cd %:p:h                    "automatically start in working-directory
"Booleans, set with "<name>", unset with "no<name>" or toggle with "<name>!"
set nocompatible            "disables vi compatibility mode
set wrap                    "wrap line at end of window
set linebreak               "wrap whole words
set wildmenu                "shows auto-complete on command-line.
set wildignorecase          "case insensitive in filename completion
set number                  "Show line Numbers
set visualbell              "Error bells are displayed visually.
set smartindent             "Indenting source-code
set breakindent             "line wraps are indented
set showcmd                 "display incomplete commands (bottom right)
set hidden                  "don't show an error message when switching
                                "from a modified buffer

"Non Boolean Arrays, set with "set <name>=<value>"
set t_ti= t_te=             "don't clear screen after exiting in terminal
set tabpagemax=100          "set maximum of displayed tabs to 100
set encoding=utf-8          "use utf-8
set clipboard=unnamedplus   "Allow yanking and pasting with X11-Clipboard
set display+=lastline       "display lines, even when they don't fit in window
set nrformats=bin,hex,alpha "increment/decrement numbers and chars
                              "octal numbers start with 0 and hex with 0x
"set foldmethod=indent       "fold text on basis of indentation.
                                "hit "zc" to close and "zo" to open folds.
                                "or use "za" to toggle between states.
"set options for "makesession" 
set ssop-=curdir
set ssop+=sesdir

"Settings for persistent undo
set undodir=~/.cache/vim/undodir
set undofile
set undolevels=10000        "maximum number of changes that can be undone
set undoreload=10000        "maximum number lines to save for undo on a buffer reload

"Settings for Tabulators
set smarttab
set expandtab               "expand tabs to spaces
set tabstop=4               "number of spaces a "\t" in the text stands for
set shiftwidth=4            "number of spaces "\t" gets expanded to
"set softtabstop=4           "backspace removes up to 4 spaces
                                "(should be identical to shiftwidth)

"show invisibles (to show tabs, end of lines, etc.)
set list                    "show invisible characters
set listchars=tab:▸\ ,      "the characters which should be shown and which 
                                "symbols should stand for them
 "Search
  set ignorecase              "ignore case when using a search pattern
  set smartcase               "caps sensitive when uppercase in search pattern
  set incsearch               "Incremental search -> search as you type

 "Enable mouse usage
  set mouse=a                 "enable mouse selection
  set mousef                  "focus follows mouse in split-view

""Spell checking
 "Enable spell checking in GUI-Mode
  if has("gui_running")
    set spell
  else
    set nospell
  endif
  
 "Set spell files and accepted languages
 " Typing 'zg' in normal mode adds good words to the first entry
 "  while '2zg' adds them to the second entry, etc.
 " 'zug' undoes the adding into the good-word list.
  set spelllang=de,en
  set spellfile=~/.vim/spell/de.utf-8.add,~/.vim/spell/en.utf-8.add 


"The Following lines contain key-maps and key-remaps to make the work with
    "VIM a lot easier

"set "<leader>" to "-"
  let mapleader = "-"
"Edit vimrc by hitting "<leader>v" (split) or "<leader>t" (tab)
  nnoremap <leader>v :vsplit  $MYVIMRC<CR>
  nnoremap <leader>t :tabedit $MYVIMRC<CR>
"Toggle code folding with "<space>" in normal mode
  nnoremap <space> zA
"To insert timestamp, press "F3"
  nnoremap <F3> a<C-R>=strftime("%Y-%m-%d %a %H:%M %p")<CR><Esc>
  inoremap <F3> <C-R>=strftime("%Y-%m-%d %a %H:%M %p")<CR>
"Refresh with "F5"
  nnoremap <F5> :e!<CR>
  inoremap <F5> <Esc>:e!<CR>
"Stay in visible mode after using ">" or "<" for visual indentation
  "gv reselects the last selection
  vnoremap < <gv
  vnoremap > >gv
"use "<C>" as modifier to work on displayed lines instead of numbered lines
  nnoremap <C-Down>  gj
  nnoremap <C-j>     gj
  nnoremap <C-Up>    gk
  nnoremap <C-k>     gk
  nnoremap <C-^>     g^
  nnoremap <C-0>     g0
  nnoremap <C-$>     g$
  vnoremap <C-Down>  gj
  vnoremap <C-j>     gj
  vnoremap <C-Up>    gk
  vnoremap <C-k>     gk
  vnoremap <C-^>     g^
  vnoremap <C-0>     g0
  vnoremap <C-$>     g$
  inoremap <C-Down>  <Esc>gja
  inoremap <C-Up>    <Esc>gka
  inoremap <C-End>   <Esc>g$a
  inoremap <C-Home>  <Esc>g^i
"Move between split-windows by hitting "alt+{motion}"
  noremap <M-Left>   <C-w>h
  noremap <M-Down>   <C-w>j
  noremap <M-Up>     <C-w>k
  noremap <M-Right>  <C-w>l
  nnoremap <M-h>     <C-w>h
  nnoremap <M-j>     <C-w>j
  nnoremap <M-k>     <C-w>k
  nnoremap <M-l>     <C-w>l
"Copy to end of line with "Y"
  nnoremap Y y$
"Mark everything by hitting "ctrl+a"
  inoremap <C-a> <Esc>ggVG
"Close Vim by hitting "<C-d>"
  nnoremap <c-d> :q!<CR>
  inoremap <c-d> <Esc>:q!<CR>
"Evaluate expression with expression register
  nnoremap Q 0yt=A<C-r>=<C-r>0<CR><Esc>

"User defined "Commands" (command-mode)
"Remove Blank Lines Command
  command! -range=% RBL :<line1>,<line2>g/^\s*$/d
"Reformat text that exceeds the value of ":set columns?"
  command! -range=% Reform let x=&tw | let &tw=&co-5 | :<line1>,<line2>g/^/norm gww | let &tw=x

"Bindsplit[number] function to edit in multiple columns
function! s:bindsplit(...) abort
    if a:0
        let l:count=(a:1 - 1)
    else
        let l:count=1
    endif
    echom l:count
    let l:curwin=winnr()
    for i in range(1, l:count)
        vsplit
        setlocal noscrollbind
        execute "normal! z+"
        setlocal scrollbind
    endfor
    execute l:curwin . "wincmd w"
    setlocal scrollbind
endfunction
command! -nargs=? -bar Bindsplit call s:bindsplit(<args>)

"Special settings for defined circumstances, like specified file-types
    "or file names "(autocommand)".
if has("autocmd")
    "enable Filetype detection
    filetype on

    " Remove ALL autocommands for the current group.
    "autocmd!
    "change to directory of opened file
    "autocmd VimEnter * cd %:p:h
    "autocmd GuiEnter * cd %:p:h
    "special tab behaviour for Filetypes (get Filetype by ":set filetype?")
    autocmd FileType make setlocal ts=4 sw=4 noexpandtab
    autocmd FileType tex  setlocal ts=2 sw=2 sts=2 expandtab wrap 

    "automatically source your vimrc when saving files "named vimrc"
    autocmd bufwritepost .vimrc source $MYVIMRC
    autocmd bufwritepost  vimrc source $MYVIMRC
endif
