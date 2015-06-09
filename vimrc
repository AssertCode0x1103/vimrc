" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.

"------------------------------------------------------------
" Pathogen {{{1
call pathogen#incubate()
call pathogen#helptags()


"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
syntax on


"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.

" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline


"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Keep 50 lines of command line history
set history=50          

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
"set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F9> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F9>

" Save off temporary and backup files here instead of making a mess all over
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

" Start the Gvim window maximized
"if has("gui_running")
"  " GUI is running or is about to start.
"  " Maximize gvim window.
"  set lines=100 columns=200
"else
"  " This is console Vim.
"  if exists("+lines")
"    set lines=50
"  endif
"  if exists("+columns")
"    set columns=100
"  endif
"endif

"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" two characters wide.
"set shiftwidth=2
"set tabstop=2


"-----------------------------------------------------------
" CTags
"
" Set up recursive upwards tag search
"
set tags=tags;/


"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" When diffing, do the 'put' of the change
map <F12> :diffput<CR>

" Toggle the Tlist plugin
map <F11> :TagbarToggle<CR>

" Toggle the Tlist plugin
map <F10> :NERDTreeToggle<CR>

"This will delete extra spaces at the end of a line and will
"change tabs to spaces
map <F6> :retab<cr>:%s/\s\+$//<cr>
map! <F6> <Esc>:retab<cr>:%s/\s\+$//<cr>

map <F7> :%s/\r\(\n\)/\1/g<cr>
map! <F7> <Esc>:%s/\r\(\n\)/\1/g<cr>

"F5 now toggles binary mode
map <F5> :%!xxd<cr>a
map! <F5> <Esc>:%!xxd -r<cr>

" ROT13 the whole file
map <F4> ggg?G``

"F3 now toggles the show line numbers
map <F3> :set invnumber<cr>a
map! <F3> <Esc>:set invnumber<cr>

" Force Saving Files that Require Root Permission by using 2 !'s
cmap w!! %!sudo tee > /dev/null %

" Lets try out using jj instead of <ESC>
imap jj <esc>

" PasteToggle for weird VIM formatting of pasted data
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" When searching with /, fold everything except for matches to your last search.
" Provides two levels of folding to allow you to show some context around each search match as well.
" http://vim.wikia.com/wiki/Folding_with_Regular_Expression
nnoremap \z :setlocal foldexpr=(getline(v:lnum)=~@/)?0:(getline(v:lnum-1)=~@/)\\|\\|(getline(v:lnum+1)=~@/)?1:2 foldmethod=expr foldlevel=0 foldcolumn=2<CR>

" DiffOrig command (from Vim help)
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif

"------------------------------------------------------------
" Color, Font, etc {{{1
"
" 

" Color Scheme
color desert

" Font
set guifont=Ubuntu\ Mono\ 10,Lucida_Console:h9:cANSI

" Highlight Column 80, and 120+
highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn="80,".join(range(120,999),",")

" Options that may be useful some other time
"set statusline+=ASCII:\%03.3b\                       "ascii of cursor char
"set statusline+=HEX:\%02.2B\                         "hex of cursor char
"set statusline+=%7*\ %h\                             "helpfile

set statusline=
"set statusline+=%6*\%t\                              "tail of the filename
set statusline+=%6*\%f\                              "relative path of filename
set statusline+=%6*\ [%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%6*\ %{&ff}]\                        "file format
set statusline+=%6*\                                 "blank space
set statusline+=%4*%m                                "modified flag
set statusline+=%6*\                                 "blank space
set statusline+=%6*\ %r\                             "read only flag
set statusline+=%5*\ %y\                             "filetype
set statusline+=%*%#error#%{&paste?'[paste]':''}     "Paste mode on/off?
set statusline+=%2*\ %{fugitive#statusline()}\       "fugitive

set statusline+=%6*\ %=                              "left/right separator

set statusline+=%8*\ col:%c\                         "cursor column
set statusline+=%8*\ row:%l/%L\                      "cursor line/total lines
set statusline+=%8*\ (%p%%)\                         "percent through file

hi User1 guifg=#ffdad8  guibg=#880c0e
hi User2 guifg=#000000  guibg=#F4905C
hi User3 guifg=#292b00  guibg=#f4f597
hi User4 guifg=#112605  guibg=#aefe7B
hi User5 guifg=#051d00  guibg=#7dcc7d
hi User7 guifg=#ffffff  guibg=#880c0e gui=bold
hi User8 guifg=#ffffff  guibg=#5b7fbb
hi User9 guifg=#ffffff  guibg=#810085
hi User0 guifg=#ffffff  guibg=#094afe

set laststatus=2

"------------------------------------------------------------
" Restore Cursor when file is reopened
"
" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='30,\"100,:20,%,n~/.viminfo
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

"------------------------------------------------------------
" CScope
"

" Mapping for cscope is done elsewhere in cscope_maps.vim
if has('win32')
   let g:cscope_cmd = "$VIM\vimfiles\bundle\win32\cscope.exe"
endif


"------------------------------------------------------------
" Vim-Signify
"

" Determines the VCS to check for and in what order
let g:signify_vcs_list = [ 'git' ]
" Turn on highlighting of lines by default (Toggle with \gl)
let g:signify_line_highlight = 1
" Turn off signify by default (Toggle on with \gt)
let g:signify_disable_by_default = 1 
" Change git diff to be against upstream version
nnoremap \u :let g:signify_diffoptions = { 'git': '@{u}' }<CR>:SignifyToggle<CR>


"------------------------------------------------------------
" MS-Windows 
"
if has('win32')
    source $VIMRUNTIME/mswin.vim
    behave mswin
    set backupdir=$HOME/vim/backup
    set directory=$HOME/vim/tmp
endif

"------------------------------------------------------------
" Enter and Leave Hex Mode
"

" ex command for toggling hex mode - define mapping if desired
command -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
function ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction

" mappings to Toggle Hex
nnoremap <C-H> :Hexmode<CR>
inoremap <C-H> <Esc>:Hexmode<CR>
vnoremap <C-H> :<C-U>Hexmode<CR>

" autocmds to automatically enter hex mode and handle file writes properly
if has("autocmd")
  " vim -b : edit binary using xxd-format!
  augroup Binary
    au!

    " set binary option for all binary files before reading them
    au BufReadPre *.bin,*.hex setlocal binary

    " if on a fresh read the buffer variable is already set, it's wrong
    au BufReadPost *
          \ if exists('b:editHex') && b:editHex |
          \   let b:editHex = 0 |
          \ endif

    " convert to hex on startup for binary files automatically
    au BufReadPost *
          \ if &binary | Hexmode | endif

    " When the text is freed, the next time the buffer is made active it will
    " re-read the text and thus not match the correct mode, we will need to
    " convert it again if the buffer is again loaded.
    au BufUnload *
          \ if getbufvar(expand("<afile>"), 'editHex') == 1 |
          \   call setbufvar(expand("<afile>"), 'editHex', 0) |
          \ endif

    " before writing a file when editing in hex mode, convert back to non-hex
    au BufWritePre *
          \ if exists("b:editHex") && b:editHex && &binary |
          \  let oldro=&ro | let &ro=0 |
          \  let oldma=&ma | let &ma=1 |
          \  silent exe "%!xxd -r" |
          \  let &ma=oldma | let &ro=oldro |
          \  unlet oldma | unlet oldro |
          \ endif

    " after writing a binary file, if we're in hex mode, restore hex mode
    au BufWritePost *
          \ if exists("b:editHex") && b:editHex && &binary |
          \  let oldro=&ro | let &ro=0 |
          \  let oldma=&ma | let &ma=1 |
          \  silent exe "%!xxd" |
          \  exe "set nomod" |
          \  let &ma=oldma | let &ro=oldro |
          \  unlet oldma | unlet oldro |
          \ endif
  augroup END
endif

highlight ExtraWhitespace guibg=red
match ExtraWhitespace /\s\+$\| \+\ze\t/
"match ExtraWhitespace /\s\+$/

nnoremap <silent> <2-LeftMouse> :let @/='\V\<'.escape(expand('<cword>'),'\').'\>'<cr>:set hls<cr>
"------------------------------------------------------------
