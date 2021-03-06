""Make Vim more useful
 set nocompatible       "disable vi compatible mode
 syntax on              "enable Syntax Highlighting
 let mapleader = "-"    "set <leader> to '-' (:h mapleader)

""Minpac package manager
"{{{
 "Initial installation (requires Linux, git, Vim >= 8.0):
 "  git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac
 "Iniatialize package manager
  packadd minpac
  call minpac#init()

 "add shortcut commands for installing/updating and uninstalling packages
 " to uninstall just remove the respective minpac#add call and run PackClean
  command! PackUpdate call minpac#update()
  command! PackClean  call minpac#clean()

 "define list of packages to be installed
  call minpac#add('k-takata/minpac', {'type': 'opt'})   "(:h minpac.txt)
  call minpac#add('altercation/vim-colors-solarized')   "(:h solarized)
  call minpac#add('tpope/vim-fugitive')                 "(:h fugitive)
  call minpac#add('sjl/gundo.vim')                      "(:h Gundo-contents)
  call minpac#add('preservim/nerdtree')                 "(:h NERDTree-contents)
    call minpac#add('Xuyuanp/nerdtree-git-plugin')
  call minpac#add('SirVer/ultisnips')   "(:h UltiSnips, UltiSnips-basic-syntax)
"}}}

""Settings specific for installed packages
"{{{
 "Map :GundoToggle to <F4>
  if has("python3") | let g:gundo_prefer_python3 = 1 | endif
  nnoremap <F4> :GundoToggle<CR>
 "Map :NERDTreeToggle to <leader>N
  noremap <leader>N :NERDTreeToggleVCS<CR>
"}}}

""An X11-aware Vim provides the two selection registers PRIMARY ("*) and CLIPBOARD ("+)
 "Most applications provide their current selection via PRIMARY "*
 "and use CLIPBOARD "+ for cut/copy/paste operations
 set clipboard=unnamedplus  "use "+ for yank/delete/change/put operations

"Set GUI and terminal appearance
 if has("gui_running")
   colorscheme solarized        "GUI colorscheme
   set background=light         "possible values for solarized: light/dark
   set guifont=Monospace\ 10    "to set interactively type 'set guifont=*' in gvim
 else
   colorscheme elflord          "terminal colorscheme
 endif

""There are three types of options in Vim:
 "{{{
 "All of their values can be queried with "set <name>?"
""Boolean options:
 "         set with "<name>"
 "       unset with "no<name>"
 "      toggle with "<name>!"
""String and numeric options:
 "         set with "<name>=<value>"
""Array options:
 "         set with "<name>=<value>"
 "   add value with "<name>+=<value>"
 "remove value with "<name>-=<value>"
 "}}}

 "Bools
  set wrap           "wrap line at end of window
  set linebreak      "wrap whole words
  set number         "display line numbers
  set splitright     "open new vertical splits on the right
  set showcmd        "display incomplete commands (bottom right)
  set hidden         "don't show an error message when switching from a modified buffer
  set wildmenu       "displays auto-completed command list on pressing wildchar (i.e. tab)
 "set wildignorecase "case insensitive completion in wildmenu
  set visualbell     "flash the buffer when encountering an error (e.g. invalid movement)

 "Search (:h /, magic, pattern-overview)
  set ignorecase     "ignore case when using a search pattern
  set smartcase      "caps sensitive when upper-case in search pattern
  set incsearch      "Incremental search -> search as you type

 "Settings for tabulators and indentation (:h tabstop, autoindent)
  set tabstop=4      "number of spaces a "\t" in the text counts for
  set shiftwidth=4   "number of spaces used for each step of indent (>>,<<,etc.)
  set smarttab       "backspace removes up to <shiftwidth> spaces at start of line
  set expandtab      "expand tabs to spaces
  set autoindent     "copy indent from current line when starting a new line
  set smartindent    "smarter indentation in case of C-like source-code
  set breakindent    "on line wrap the "display-lines" are indented too

 "Show invisibles (e.g. tabs, EOL, etc.) (:h 'list') and provide a list of
 " displayed hidden characters and their accompanying symbols (:h 'listchars')
  set list
  set listchars =tab:--→
  set listchars+=nbsp:␣
  set listchars+=trail:•
  set listchars+=extends:⟩
  set listchars+=precedes:⟨
  "set listchars+=eol:↲

 "Don't flush terminal after closing vim (:h terminal-info, terminal-options)
  set t_ti= t_te=

 "Define how automatic formatting is done (:h 'formatoptions', fo-table)
  set formatoptions=tcrqj

 "Text folding (:h folding, fold-methods, fold-commands)
  set foldmethod=marker   "Set foldmethod to marker (using foldmarker and commentstring)
  set foldcolumn=0        "Show folding column of width <set foldcolumn?> on the left

 "Spell checking (:h spell)
 "Enable spell checking in GUI-Mode
  if has("gui_running") | set spell | else | set nospell | endif
 "Set spell files and accepted languages (:h spell-quickstart)
  set spelllang=en_gb,de_at
  set spellfile=~/.vim/spell/en.utf-8.add,~/.vim/spell/de.utf-8.add

 "Autocompletion settings (:h ins-completion, 'completeopt')
 "Just show completion popup instead of directly inserting the first match
  set completeopt+=longest

 "Display as much as possible of the last line in a window (:h 'display')
  set display+=truncate

 "Increase maximum number of tabs
  set tabpagemax=100

 "Set number formats besides decimal, bin (0b), hex (0x), alpha [a-zA-Z]
  set nrformats=bin,hex,alpha

 "Allow sideways moving keys to move to the next/previous line
  set whichwrap=b,s,<,>,[,]  "traverse line breaks with arrow keys

 "Enable mouse usage (:h mouse)
  set mouse=a        "enable mouse selection in all modes as well as terminal
  set mousefocus     "focus follows mouse in split-view

 "Change cursor shape on mode switch:
  "{{{
  " 1 -> blinking block
  " 2 -> solid block
  " 3 -> blinking underscore
  " 4 -> solid underscore
  " 5 -> blinking vertical bar
  " 6 -> solid vertical bar
  "}}}
  let &t_SI = "\<Esc>[5 q" "SI = INSERT mode
  let &t_SR = "\<Esc>[4 q" "SR = REPLACE mode
  let &t_EI = "\<Esc>[1 q" "EI = NORMAL mode (ELSE)


""Key-maps and key-remaps (:h key-mapping, map-overview) edit vimrc
 "by hitting "<leader>e", "<leader>v" (vsplit) or "<leader>t" (tab)
  nnoremap <leader>e :edit    $MYVIMRC<CR>
  nnoremap <leader>v :vsplit  $MYVIMRC<CR>
  nnoremap <leader>t :tabedit $MYVIMRC<CR>

 "switch cwd to the directory of the open buffer (:h filename-modifiers)
  nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

 "copy to end of line with "Y"
  nnoremap Y y$

 "if in visual mode re-select after using ">" or "<" for visual indentation
  vnoremap < <gv
  vnoremap > >gv

 "automatically close parenthesis, quotes, etc.
  inoremap " ""<left>
 "inoremap ' ''<left>   "interferes with words like e.g. don't
  inoremap ( ()<left>
  inoremap [ []<left>
  inoremap { {}<left>

 "toggle code folding with "<space>" in normal mode
  nnoremap <space> zA

 "close Vim by hitting "<C-d>"
  nnoremap <C-d>      :q!<CR>
  inoremap <C-d> <Esc>:q!<CR>

 "jump to end of previous word with "B"
  noremap B ge

 "use |/_ to set the current window width/height widest/highest possible
  nnoremap \| <C-w>\|
  nnoremap _  <C-w>_

 "evaluate expression with expression register
  nnoremap Q 0yt=f=a<C-r>=<C-r>0<CR><Esc>

 "remove Blank Lines Command
  command! -range=% RBL :<line1>,<line2>g/^\s*$/d

 "faster buffer switching with  <C-p>, <C-n> and gb (bufferlist)
  nnoremap gb              :ls<CR>:b<Space>
   noremap <C-p>           :bp<CR>
   noremap <C-n>           :bn<CR>
   noremap <leader>bp      :bp<CR>
   noremap <leader>bn      :bn<CR>
  "inoremap <leader>bp <Esc>:bp<CR> "annoyingly hitting <leader> stalls input
  "inoremap <leader>bn <Esc>:bn<CR> "annoyingly hitting <leader> stalls input

 "use "<C>" as modifier to work on displayed lines instead of numbered lines
 "<C-^> and <C-$> are not really possible to type therefore, g^ and g$ have to be used
 "{{{
   noremap <C-Up>    gk
   noremap <C-k>     gk
   noremap <C-Down>  gj
   noremap <C-j>     gj
   noremap <C-Home>  g^
   noremap <C-End>   g$
  inoremap <C-Up>    <Esc>gka
  inoremap <C-Down>  <Esc>gja
  inoremap <C-Home>  <Esc>g^i
  inoremap <C-End>   <Esc>g$a
 "}}}

 "move between split-windows by hitting "alt+{arrow-keys}"
 "(unfortunately alt+{h,j,k,l} don't get sent to vim properly)
 "{{{
   noremap <M-Left>       <C-w>h
   noremap <M-Down>       <C-w>j
   noremap <M-Up>         <C-w>k
   noremap <M-Right>      <C-w>l
  inoremap <M-Left>  <Esc><C-w>ha
  inoremap <M-Down>  <Esc><C-w>ja
  inoremap <M-Up>    <Esc><C-w>ka
  inoremap <M-Right> <Esc><C-w>la
 "}}}


""Settings for special circumstances (e.g. specified file-types or file-names)
 if has("autocmd")
 "enable filetype detection
   filetype on

 "automatically source your vimrc when saving files "named vimrc"
   autocmd bufwritepost .vimrc source $MYVIMRC
   autocmd bufwritepost  vimrc source $MYVIMRC

 "change work-dir to current file's parent directory (:h filename-modifiers)
   autocmd VimEnter * cd %:p:h
   autocmd GuiEnter * cd %:p:h

 "special tab behaviour for Filetypes (get Filetype by ":set filetype?")
  "Makefile
    autocmd FileType make setlocal ts=4 sw=4 sts=4 commentstring=#%s noexpandtab
  "LaTeX
   "local settings for tabstop and word wrapping
    autocmd FileType tex  setlocal ts=2 sw=2 sts=2 commentstring=%%s
   "add latex command key-word list
    autocmd FileType tex execute 'setlocal dict+=~/.vim/words/'.&filetype.'.txt'
   "call function to start autocompletion from dictionary file after hitting '\'
    function! OpenCompletion()
     "if popup menu invisible AND prvious char '\'
      if !pumvisible() && (v:char == '\')
       "push  before ("i") the typahead buffer
       "must be before to not break vim makros!
        call feedkeys("\<C-x>\<C-k>", "i")
      endif
    endfunction
    autocmd Filetype tex :autocmd InsertCharPre <buffer> call OpenCompletion()
 endif


""Add persistent undo and swapdir
 "{{{
 "persistent undo
  let vimCache = '$HOME/.cache/vim'
 "keep undo history across sessions by storing it in a file
  if has('persistent_undo')
    let myUndoDir = expand(vimCache . '/undodir')   "define path
    call system('mkdir -p ' . myUndoDir)            "make   path
    let &undodir = myUndoDir                        "set    path
    set undofile
  endif
  set undolevels=10000  "maximum number of changes that can be undone
  set undoreload=10000  "maximum number lines to save for undo on a buffer reload
 "swap dir
  let mySwapDir = expand(vimCache . '/swap//')      "define path
  call system('mkdir -p ' . mySwapDir)              "make   path
  let &directory = mySwapDir                        "set    path
 "}}}
