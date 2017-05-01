" ~/.vimrc von Julius Plenz, <jp@cvmx.de>, plenz.com
" Version: Sun Apr 30 13:13:55 CEST 2006

" OPTIONS/SETTINGS
" ================

" LaTeX-Suite settings
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Tex_MainFileExpression = 'MainFile(modifier)'
function! MainFile(fmod)
    if glob(expand('%:t:r').'.article.tex') != ''
        return fnamemodify(expand('%:t:r').'.article.tex', a:fmod)
    elseif glob('*.latexmain') != ''
        echo 'foo'
        return fnamemodify(fnamemodify(glob('*.latexmain'), ':r'), a:fmod)
    else
        return fnamemodify(expand('%:t'), a:fmod)
    endif
endfunction

set runtimepath+=~/.vim/lh-vim-lib/

" execute .vimrc in current directory
set exrc
" do not allow shell and other nasty things in these files
set secure
" Continue searching at top when hitting bottom
set wrapscan
" Behave like vi? Hell, no!
set nocompatible
" Always show cursor-position
set ruler
" fancy menu
set wildmenu
" ...and Statusline
set laststatus=2
" Who needs backups?
set nobackup
set whichwrap=b,s,<,>,[,]
" Scroll when 2 lines before bottom of the terminal
set scrolloff=2
set sidescroll=4
" Short the messages
set shortmess=a
" Always show the command
"set showcmd
" do not start at beginning of line
set nosol
" Show all changes
set report=0
" dont warn if unsaved buffers are closed
set hidden
" Blinking shows the matching parantheses
set showmatch
" Which parantheses to match
set matchpairs=(:),{:},[:],<:>
" Do I have a fast terminal?
set ttyfast
" do not insert two spaces after each period on joined lines
set nojoinspaces
" Automatically indent
set autoindent
" Automatically write File on Bufer-Change
set autowrite
" Expand Tabs
set expandtab
" How many spaces for indenting
set shiftwidth=4
" Enumerate Lines relatively
set rnu
" ^N ^P: Complete from dictionary
set cpt+=k
"set dictionary=/usr/share/dict/ngerman,/usr/share/dict/words
"Write Swapfile after typing 50 chars
set uc=50
" Incasesensitive search
set incsearch
set ignorecase
" no Visual Bells
set novb
" That's _really_ cool, try it!
" set list listchars=tab:»·,trail:~,eol:$
set list listchars=tab:»·,trail:~,nbsp:_
set tabstop=8
set smarttab
set smartindent
" Tabs of the other kind
set tabpagemax=50
set fdm=syntax
set fml=10
set fdn=1
" :h 'fo'
set fo=tcrqln " ft=mail?
" Allow the last two lines to be socalled "modelines" in which
" you can type commands vim executes on opening the file.
set modeline
set modelines=2
" Dont automatically wrap
set tw=80
set colorcolumn=+1
" Include @ and dot in word-keys
set iskeyword=@,48-57,_,192-255,-,.,@-@
" <419c9cd0$0$25316$9b4e6d93@newsread2.arcor-online.net>
setlocal cinkeys-=0#  "??

" Colorscheme Murphy looks really cool
" color murphy
" Enable Syntax-Highlighting
syntax on
" Transparent Terminals
hi Normal ctermbg=NONE
" set t_Co=16 to get rid of the bold characters
set background=dark

" Use CSS!
let html_use_css = 1

set viminfo=\"200,%,'200,/200,:200,@100,f1,h

" turn of Vim's own regex interpretation
nnoremap / /\v
vnoremap / /\v

if version>=700
" hi CursorLine ctermfg=black ctermbg=white
" set cursorline

  set pumheight=7

  inoremap j <C-R>=pumvisible() ? "\<lt>C-N>" : "j"<CR>
  inoremap k <C-R>=pumvisible() ? "\<lt>C-P>" : "k"<CR>

  map <Leader>tn :tabnew<CR>
  map <Leader>tc :tabclose<CR>
endif

" Abbreviations and Commands
" ==========================

" Set the leader:
let mapleader = ","

" Go to normal mode
" imap öö <Esc>

map zd :setlocal spell spelllang=de<CR>
map ze :setlocal spell spelllang=en<CR>

" I like tabs!
nmap <F11> <Esc>:tabnew<CR>
nmap <F9> <Esc>:tabprevious<CR>
nmap <F10> <Esc>:tabnext<CR>
imap <F11> <Esc>:tabnew<CR>i
imap <F9> <Esc>:tabprevious<CR>i
imap <F10> <Esc>:tabnext<CR>i

" Fast switching between tw
map _l :set tw=0<CR>
map _L :set tw=80<CR>

" Delete trailing whitespaces
nmap <Leader>tr mm:%s/\s\+$//<CR>`m
vmap <Leader>tr    :s/\s\+$//<CR>

map gn :set nu!<CR>
" map gn :set nu<CR>
" map gN :set nonu<CR>

" LaTeX: Often typed combos
map ,end yyp^ldwiend<Esc>^
map ,End yyp^f}lD^wdwiend<Esc>^

filetype plugin on

" MAN-Pages - ft=man
au FileType man set ai et ts=4 nosm nonu nolist
" LaTeX - ft=latex
au FileType tex set ai et tw=70 sw=2
au FileType tex imap // \
au FileType tex imap << {
au FileType tex imap >> }
au FileType tex imap "" ``''<Left><Left>
au FileType tex set  makeprg=pdflatex\ --interaction=nonstopmode\ \"%\"
au FileType tex imap <Leader>eq \begin{equation*}<CR><CR>\end{equation*}<up>  
au FileType tex imap <Leader>en \begin{eqnarray*}<CR><CR>\end{eqnarray*}<up>  
au FileType tex imap <Leader>al \begin{align*}<CR><CR>\end{align*}<up>  
au FileType tex setlocal spell spelllang=de

" http://larve.net/people/hugo/2001/02/email-uri-refs/
"source ~/.vim/vimurls.vim

" wenn ich gVim nutze... (manchmal nützlich)
if has("gui_running")
    set guioptions-=T
    set guioptions-=m
    set guioptions+=a
    set background=light
    :syntax on
    ":colorscheme darkblue
    ":colorscheme oceandeep
    ":colorscheme murphy
endif

" High bits
" hi    HighBitChars ctermfg=yellow ctermbg=red
" match HighBitChars /[€-ÿ]/

" Verschreiber
iab alos        also
iab aslo        also
iab laso        also
iab acuh        auch
iab becuase     because
iab bianry      binary
iab bianries    binaries
iab charcter    character
iab charcters   characters
iab eig         eigentlich
iab exmaple     example
iab exmaples    examples
iab shoudl      should
iab seperate    separate
" iab teh         the
" iab teil        Teil
iab tpyo        typo
iab bracuht     braucht
iab doer        oder
iab nciht       nicht
iab Dreckfuhler Druckfehler
iab Micheal     Michael
iab Netwokr     Network
iab Srever      Server
iab Standart    Standard
iab standart    standard
iab SIe         Sie
iab ICh         Ich
iab cih         ich
iab shc         sch
iab amchen      machen
iab amche       mache
" iab DU          Du
" iab du          Du
iab DIr         Dir
iab Linx        Linux

" Svens coole Tips:
imap <Leader>** <c-o>B*<c-o>E<right>*
imap <Leader>"" <c-o>B"<c-o>E<right>"
imap <Leader>// <c-o>B/<c-o>E<right>/
imap <Leader>__ <c-o>B_<c-o>E<right>_

" Useful for writing XHTML!
imap <Leader>em <c-o>B<em><c-o>E<right></em>
imap <Leader>st <c-o>B<strong><c-o>E<right></strong>

imap <Leader>li   <Esc>^I<li><Esc>A</li>
imap <Leader>link <Esc>F ld$i<a href="<Esc>pa"><Esc>pa</a>

vmap <Leader><Leader><> :s/</\&lt;/g<CR>gv:s/>/\&gt;/g<CR>

" vmap <Leader>} /\(> ?\)\+<CR>n

imap <Esc>[3~ <C-H>
set backspace=2
fixdel

" Pseudoüberschriften in Textdokumenten
map <Leader>un yyp:s/./=/g<CR>
" Pseduokästen aus #-Zeichen
map <Leader>## ^I#<Esc>yyP:s/./\#/g<CR>yyjpk^l

" für ccal
map <Leader>Cal a,d 00<Esc>:s/-/ /g<CR>A Beschreibung<Esc>^wwww
map <Leader>cal o,d 00<Esc>:s/-/ /g<CR>A Beschreibung<Esc>^wwww

" Paste und Nopaste
 map <Leader>pon  :set paste<CR>
imap <Leader>pon  <Esc>:set paste<CR>a
 map <Leader>poff :set nopaste<CR>
imap <Leader>poff <Esc>:set nopaste<CR>a
" last one is senseless

set pastetoggle=<F12>

" Kommentare einfügen
 map ,mkc O/*<Esc>o*/<Esc>dd

" Riesen-Tab...
imap <Leader>. <Esc>klf wh:se ve=all<CR>jr :set ve=insert<CR>a

" 2005-07-04: http://www.vim.org/tips/tip.php?tip_id=956
" Quote motions for operators: da" will delete a quoted string.
omap i" :normal vT"ot"<CR>
omap a" :normal vF"of"<CR>
omap i' :normal vT'ot'<CR>
omap a' :normal vF'of'<CR>

map #a :$r!agrep -d'^-- $' '.' ~/.sig/signatures<S-Left><S-Left><right>
map #s :$r!agrep -d'^-- $' '.' ~/.sig/signatures<S-Left><S-Left><right>
map #d Go-- <CR>

iab &ndash; &#8211;

" We don't need no flashing cursor
let &guicursor = &guicursor . ",a:blinkon0"

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

" EOF
"
" Prevent various Vim features from keeping the contents of pass(1) password
" files (or any other purely temporary files) in plaintext on the system.
"
" Either append this to the end of your .vimrc, or install it as a plugin with
" a plugin manager like Tim Pope's Pathogen.
"
" Author: Tom Ryder <tom@sanctum.geek.nz>
"

" Don't backup files in temp directories or shm
if exists('&backupskip')
    set backupskip+=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*
endif

" Don't keep swap files in temp directories or shm
if has('autocmd')
    augroup swapskip
        autocmd!
        silent! autocmd BufNewFile,BufReadPre
            \ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*
            \ setlocal noswapfile
    augroup END
endif

" Don't keep undo files in temp directories or shm
if has('persistent_undo') && has('autocmd')
    augroup undoskip
        autocmd!
        silent! autocmd BufWritePre
            \ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*
            \ setlocal noundofile
    augroup END
endif

" Don't keep viminfo for files in temp directories or shm
if has('viminfo')
    if has('autocmd')
        augroup viminfoskip
            autocmd!
            silent! autocmd BufNewFile,BufReadPre
                \ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*
                \ setlocal viminfo=
        augroup END
    endif
endif
