" sh -c 'curl -fLo \"${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
"" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install

" ctags -R --languages=[language of choice] --exclude=.git --exclude=log .
" echo tags >> .gitignore

set nocompatible                  " Must come first because it changes other options.

" ===========
" Plugins
" ===========

call plug#begin('~/.vim/plugged')


Plug 'HerringtonDarkholme/yats.vim' " Typescript syntax
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'alvan/vim-closetag'

Plug 'Yggdroot/indentLine'

Plug 'andymass/vim-matchup'
"Plug 'ap/vim-buftabline'
Plug 'brooth/far.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'junegunn/gv.vim'
Plug 'junegunn/vim-peekaboo' " @ / \" => show registers
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'machakann/vim-sandwich' " sa-surround add, sd surround delete, sr-surround replace
Plug 'gruvbox-community/gruvbox'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'vim-scripts/ScrollColors'
Plug 'roman/golden-ratio'
Plug 'camspiers/animate.vim'
Plug 'camspiers/lens.vim'
" Plug 'ervandew/supertab'
Plug 'scrooloose/nerdtree'
Plug 'jceb/vim-orgmode'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'
" Plug 'tpope/vim-sensible'
Plug 'valloric/MatchTagAlways'
Plug 'w0rp/ale'
Plug 'wellle/targets.vim' " Extended text objects, i.e., `cin(` = 'change inner next paren'
" Plug 'vim-orgmode' "unsupported
Plug 'mhinz/vim-startify'

Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

Plug 'jlanzarotta/bufexplorer'
Plug 'cakebaker/scss-syntax.vim'


"Plug 'ChristianChiarulli/codi.vim'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes' "call :AirlineTheme to set theme

Plug 'godlygeek/tabular'

Plug 'voldikss/vim-floaterm'

Plug 'ryanoasis/vim-devicons'

" Pandoc/Markdown
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'masukomi/vim-markdown-folding'

Plug 'vimwiki/vimwiki'

Plug 'honza/vim-snippets'

" Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Coc Extensions
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'iamcco/coc-angular', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}

call plug#end()

syntax enable                     " Turn on syntax highlighting.

filetype plugin on

filetype plugin indent on         " Turn on file type detection.
set showcmd                       " Display incomplete commands.

set showmode                      " Display the mode you're in." Use the colorscheme
set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.
set wildmenu                      " Enhanced command line completion.


set termguicolors

set encoding=UTF-8                " need emoji 💯

set clipboard^=unnamed   " Use the system register


let g:closetag_filenames = '*.html,*.xhtml,*.jsx,*.tsx'

" Navigate tabs
nnoremap <C-j> :tabnext<CR>
nnoremap <C-k> :tabprev<CR>
"
" SPLITS
set splitbelow  " open a new vertical split below
set splitright  " open a new horizontal split on the right
set fillchars=vert:│  " Vertical separator between windows"

autocmd FileType javascript setlocal formatprg=prettier
autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript
autocmd FileType html setlocal formatprg=js-beautify\ --type\ html
autocmd FileType css setlocal formatprg=prettier\ --parser\ css
autocmd FileType python setlocal formatprg=yapf

" format file in place
map <F5> magggqG`a


" Linting
let g:ale_linters = {
      \   'python': ['flake8', 'pylint'],
      \   'javascript': ['eslint'],
      \   'typescript': ['tsserver', 'tslint'],
      \   'vue': ['eslint'],
      \   'ruby': ['standardrb'],
      \}
let g:ale_fixers = {
      \    'javascript': ['eslint'],
      \    'typescript': ['prettier', 'tslint'],
      \    'vue': ['eslint'],
      \    'scss': ['prettier'],
      \    'html': ['prettier'],
      \    'reason': ['refmt'],
      \    'ruby': ['standardrb'],
      \}
let g:ale_fix_on_save = 1

" Disable LSP for ale
let g:ale_disable_lsp = 1

nnoremap ]r :ALENextWrap<CR>      " move to the next ALE warning / error
nnoremap [r :ALEPreviousWrap<CR>  " move to the previous ALE warning / erro
nnoremap <leader>d :ALEDetail<cr> " show the full message

" ===========
" NERDTree
" ===========
let NERDTreeShowHidden=1 " Always show dot (hidden) files
let NERDTreeQuitOnOpen=1 " Close the NERDTree after opening a file


" Open files on enter in a new tab
let g:fzf_action = {
      \ 'enter': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }

" Limit the window size to 40% screen from the bottom
let g:fzf_layout = { 'down': '~40%' }

let g:fzf_preview_window = ['right:50%', 'ctrl-/']


command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--prompt=❓', '--pointer=→', '--marker=🔹', '--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}']}, <bang>0)

" Search a file but only within the files that are changed (Git-wise)
command! Fzfc call fzf#run(fzf#wrap( {'source': 'git ls-files --exclude-standard --others --modified'}))

"
" Highlight colors for `matchpairs`
"hi MatchParen guibg=yellow guifg=red

" Match Tag Always filetypes
let g:mta_filetypes = {
      \ 'html' : 1,
      \ 'typescriptreact': 1,
      \}

" Vim-commentary
" %s here holds the content of the line which is being commented out
autocmd FileType javascript setlocal commentstring=/*%s*/  " text => /*test

set ignorecase                    " Case-insensitive searching.

set smartcase                     " But case-sensitive if expression contains a capital letter.


" Better tab indent
vnoremap < <gv
vnoremap > >gv


set relativenumber
set number                        " Show absolute line numbers (cf. relativenumber).

set ruler                         " Show cursor position.

set laststatus=2                  " Always show a status line.

set statusline+=%#warningmsg#

set statusline+=%*

set incsearch                     " Highlight matches as you type.

set hlsearch                      " Highlight matches.


set wrap                          " Turn on line wrapping.

set scrolloff=3                   " Show 3 lines of context around the cursor.

set display+=lastline             " Display as much as possibe of a window's last line.

set smartindent

set shiftwidth=4                  "

set showtabline=2



set title                         " Set the terminal's title



set visualbell                    " No beeping.



set nobackup                      " No backups.


set noswapfile                    " No swap files; more hassle than they're worth.



set tildeop                       " Make tilde command behave like an operator.

set shortmess=atI                 " Avoid unnecessary hit-enter prompts.



set noequalalways                 " Resize windows as little as possible.



set autoread                      " Automatically re-read files changed outside Vim.



"set notimeout                     " Don't time out partially entered mapped key sequences.

set ttimeout                      " But do time out key codes.
set cpo+=J                        " Two spaces delimit my sentences.



set mouse=nicr                    " mouse scroll support



set scrolloff=7                 " when scrolling, 7 lines away from screen border



set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P



set cc=120                         " highlight lines that extend beyond 80 char.

" Set far source to ripgrep
let g:far#source = 'rg'

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set textwidth=80
set autoindent

au BufNewFile,BufRead *.py \ set tabstop=4
      \ set softtabstop=4
      \ set shiftwidth=4

" auto save folding

au BufWinLeave *.* silent mkview

au BufWinLeave *.* silent! loadview

set foldenable                  " enable folding

" set foldcolumn=2                " add a fold column

set foldmethod=syntax

" set foldmethod=indent

set foldlevel=20

highlight clear SpellBad

highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline

highlight clear SpellCap

highlight SpellCap term=underline cterm=underline

highlight clear SpellRare

highlight SpellRare term=underline cterm=underline

highlight clear SpellLocal

highlight SpellLocal term=underline cterm=underline


" Specify the behavior when switching between buffers

try

  set switchbuf=useopen,usetab        " newtab

  set stal=2

catch

endtry


" Default bnetrw view type

let g:netrw_liststyle = 3

" Very magic regexes.

nnoremap / /\v

vnoremap / /\v

nnoremap ? ?\v

vnoremap ? ?\v



" Make Y consistent with D and C (instead of yy)

noremap Y y$

"

" Make * and # work with visual selection.

" For anything more sophisticated, try https://github.com/thinca/vim-visualstar [github.com]

vnoremap <silent> * yq/p<CR>

vnoremap <silent> # yq?p<CR>


" Make + and - increase/decrease the window size.
" deactivated in preference of

" nnoremap + <C-W>+

" nnoremap - <C-W>-



set timeoutlen=250


" Set jk as escape
inoremap jk <Esc>

" Set space as leader

nnoremap <Space> <Nop>

let mapleader = "\<Space>"

let g:mapleader = "\<Space>"

let maplocalleader = "\\"

set list listchars=tab:»·,trail:·,nbsp:· " display trailing chars


" Omnicompletion
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType scss setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

" -------------------------------------------------------------------------
"  " Coc
" -------------------------------------------------------------------------
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" " Use <c-space> to trigger completion.
" if has('nvim')
"   inoremap <silent><expr> <c-space> coc#refresh()
" else
"   inoremap <silent><expr> <c-@> coc#refresh()
" endif

" " Make <CR> auto-select the first completion item and notify coc.nvim to
" " format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" " Use `[g` and `]g` to navigate diagnostics
" " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" " GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" " Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" " Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>




" ---------------------------------------

" vim-leader-guide configuration

" ---------------------------------------

let g:which_key_map =  {}
let g:which_key_sep = '➤'
" let g:which_key_vertical = 1
" let g:which_key_centered = 0
" let g:which_key_position = 'botleft'
let g:which_key_use_floating_win = 0


autocmd! User vim-which-key call which_key#register('<Space>', 'g:which_key_map')

nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
" ---------------------------------------

" buffer mappings

" ---------------------------------------

nnoremap <silent> <leader>fd :e $MYVIMRC<CR>
nnoremap <silent> <leader>fs :so %<CR>
nnoremap <silent> <leader>fS :so $MYVIMRC<CR>
nnoremap <silent> <leader>ff :Files<cr>
nnoremap <silent> <leader>fc :Fzfc<cr>
nnoremap <silent> <leader>fw :w<CR>
nnoremap <silent> <leader>fj :e .<CR>
nnoremap <silent> <leader>fn :NERDtree<CR>

let g:which_key_map['f'] = {'name' : 'File Menu',
      \'d': [':e $MYVIMRC', 'Open vimrc'],
      \'s': [':so %', 'Source current file'],
      \'w': [':w', 'Save current file'],
      \'f': [':Files', 'Fuzzy find a file'],
      \'c': [':Fzfc', 'Find a file changed in this branch'],
      \'S': [':so $MYVIMRC', 'Source vimrc'],
      \'j': [':e .', 'Edit from current directory'],
      \'n': [':NERDTreeToggle', 'Toggle NerdTree'],
      \}


" ---------------------------------------

" buffer mappings

" ---------------------------------------

nnoremap <silent> <leader>bn :bnext<cr>
nnoremap <silent> <leader>bp :bprevious<cr>
nnoremap <silent> <leader>bd :bdelete<cr>
nnoremap <silent> <leader>ba :ba<cr>
nnoremap <silent> <leader>bh :BufExplorerHorizontalSplit<cr>
nnoremap <silent> <leader>bv :BufExplorerVerticalSplit<cr>

let g:which_key_map['b'] = {
      \'name' : 'Buffer Menu',
      \'n': [':bnext', 'Next buffer'],
      \'p': [':bprevious', 'Previous buffer'],
      \'d': [':bdelete', 'Close current buffer'],
      \'o': [':%bd|e#', 'Close all but the current buffer'],
      \'a': [':ba', 'Open all buffers in splits'],
      \'t': [':BufExplorer', 'Toggle BufExplorer'],
      \'h': [':BufExplorerHorizontalSplit', 'Open BufExplorer in horizontal split'],
      \'v': [':BufExplorerVerticalSplit', 'Open BufExplorer in vertical split'],
      \}


" " ---------------------------------------

" " window mappings

" " ---------------------------------------


let g:which_key_map['w'] = {
      \'name' : 'Window Menu',
      \'j': ['<C-w>j', 'Window down'],
      \'k': ['<C-w>k', 'Window up'],
      \'h': ['<C-w>h', 'Window left'],
      \'l': ['<C-w>l', 'Window right'],
      \'s': [':split', 'Create horizontal split'],
      \'v': [':vsplit', 'Create vertical split'],
      \'c': [':close', 'Close current window'],
      \'o': [':only', 'Make only window'],
      \}


" " ---------------------------------------

" " search mappings

" " ---------------------------------------

nnoremap <leader>sw :Rg<cr>
nnoremap <leader>sl :BLines<cr>
nnoremap <leader>sb :Lines<cr>
nnoremap <leader>sc :Commits<cr>
nnoremap <leader>sm :Maps<cr>
nnoremap <leader>ss :Snippets<cr>
nnoremap <leader>sh :History<cr>
nnoremap <leader>sh :noh<cr>
nnoremap <leader>sr :Farr<cr>

let g:which_key_map.s = { 'name' : 'Search Menu'  }
let g:which_key_map.s.w = [':Rg', 'Search in pwd']
let g:which_key_map.s.l = [':BLines', 'Search in current file']
let g:which_key_map.s.b = [':Lines', 'Search in open buffers']
let g:which_key_map.s.c = [':Commits', 'Search in commits']
let g:which_key_map.s.m = [':Maps', 'Search in mappings']
let g:which_key_map.s.s = [':Snippets', 'Search in snippets']
let g:which_key_map.s.h = [':History', 'Search in history']
let g:which_key_map.s.r = [':Farr', 'Search and replace [fix me 😢]']



" ---------------------------------------

" tab mappings

" ---------------------------------------

nnoremap <leader>tt :tabnew<cr>
nnoremap <leader>te :tabedit
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>to :tabonly<cr>
nnoremap <leader>tn :tabnext<cr>
nnoremap <leader>tp :tabprevious<cr>
nnoremap <leader>tf :tabfirst<cr>
nnoremap <leader>tl :tablast<cr>
nnoremap <leader>tm :tabmove

let g:which_key_map.t = { 'name' : 'Tab Menu'  }
let g:which_key_map.t.t = [':tabnew', 'New tab']
let g:which_key_map.t.e = [':tabedit', 'Tab edit']
let g:which_key_map.t.c = [':tabclose', 'Tab close']
let g:which_key_map.t.o = [':tabonly', 'Tab only']
let g:which_key_map.t.n = [':tabnext', 'Next tab']
let g:which_key_map.t.p = [':tabprevious', 'Previous tab']
let g:which_key_map.t.f = [':tabfirst', 'First tab']
let g:which_key_map.t.l = [':tablast', 'Last tab']
let g:which_key_map.t.m = [':tabmove', 'Tab move']


" " ---------------------------------------

" " fugitive mappings

" " ---------------------------------------

let g:which_key_map['g'] = {
      \'name' : 'Git Menu',
      \'s' : ['Gstatus', 'Git Status'],
      \'p' : ['Gpull',   'Git Pull'],
      \'u' : ['Gpush',   'Git Push'],
      \'c' : ['Gcommit', 'Git Commit'],
      \'w' : ['Gwrite',  'Git Write'],
      \'M' : [':Magit',  'Magit'],
      \'v' : [':GV',  'Commit Browser'],
      \'V' : [':GV!',  'Commit Browser for current file'],
      \'h' : {
      \'name': 'Git Gutter Hunk Menu',
      \'p': [':hp', 'Preview Hunk'],
      \'s': [':hs', 'Stage Hunk'],
      \'u': [':hu', 'Undo Hunk'],
      \}
      \}


" ---------------------------------------

" Editor mappings

" ---------------------------------------

" nnoremap <silent> <leader>eh :noh<CR>
" nnoremap <silent> <leader>ew :%s/\s\+$//<CR>
" nnoremap <silent> <leader>fp :let @+ = expand("%")<cr>
" nnoremap <silent> <leader>= mzgg=G`z

let g:which_key_map['B'] = {
      \'name' : 'Bric-a-brac Menu',
      \'h' : [':noh',   'Remove highlights from matches'],
      \'w' : [':%s/\s\+$//<CR>',   'Remove trailing whitespace'],
      \'=' : ['mzgg=G`z', 'Format entire file'],
      \'p' : [':let @+ = expand("%")', 'Copy relative file path to buffer'],
      \}



" " ---------------------------------------

" " Code mappings

" " ---------------------------------------

" Format the whole file
"

let g:which_key_map['a'] = {
      \'name' : 'ALE Menu',
      \'l' : [':ALELint', 'Lint file'],
      \'f' : [':ALEFix',   'Fix linting errors in file'],
      \'g' : [':ALEGoToDefinition',   'Go to definition'],
      \'G' : [':ALEGoToDefinitionInTab',   'Go to definition in new tab'],
      \'r' : [':ALEFindReferences',   'Find references'],
      \'d' : [':ALEDocumentation',   'Find documentation'],
      \'s' : [':ALESymbolSearch',   'Find symbol'],
      \}



" ---------------------------------------

" Editor mappings

" ---------------------------------------

let g:which_key_map['c'] = {
      \'name' : 'CoC Menu',
      \'r' : [':CocListResume',   'CoC List Resume'],
      \'p' : [':CocPrev',   'CoC Previous'],
      \'d' : [':CocList diagnostics',   'CoC List Diagnostics'],
      \'n' : [':CocNext',   'CoC Next'],
      \'s' : [':CocList -I symbols',   'CoC List Symbols'],
      \'o' : [':CocList outline',   'CoC List Outline'],
      \'c' : [':CocList commands',   'CoC List Commands'],
      \'e' : [':CocList extensions',   'CoC List Extensions'],
      \'f' : ['<Plug>(coc-fix-current)',   'CoC Fix Current'],
      \'F' : ['<Plug>(coc-format-selected)',   'CoC Format Selected'],
      \'m' : ['<Plug>(coc-rename)',   'CoC Rename'],
      \'a' : ['<Plug>(coc-codeaction)',   'CoC Code Action'],
      \'A' : ['<Plug>(coc-codeaction-selected)',   'CoC Code Action Selected'],
      \'l' : {
      \'name': 'List Menu',
      \'r' : [':CocListResume',   'CoC List Resume'],
      \'d' : [':CocList diagnostics',   'CoC List Diagnostics'],
      \'s' : [':CocList -I symbols',   'CoC List Symbols'],
      \'o' : [':CocList outline',   'CoC List Outline'],
      \'c' : [':CocList commands',   'CoC List Commands'],
      \'e' : [':CocList extensions',   'CoC List Extensions'],
      \}
      \}


" ---------------------------------------

" VimWiki mappings

" ---------------------------------------
let g:which_key_map['W'] = {
      \'name' : 'VimWiki',
      \'w' : [':VimwikiIndex',   'Index'],
      \'t' : [':VimwikiTabIndex',   'Tab index'],
      \'s' : [':VimwikiUISelect',   'UI select'],
      \'d' : [':VimwikiDiaryIndex',   'Diary index'],
      \'D' : [':VimwikiMakeDiaryNote',   'Make diary note'],
      \'Y' : [':VimwikiMakeYesterdayDiaryNote',   'Make diary note for yesterday'],
      \}





" ---------------------------------------

" Floaterm mappings

" ---------------------------------------

let g:floaterm_width = 0.63
let g:floaterm_height = 0.68

let g:which_key_map['F'] = {
      \'name' : 'Floaterm Menu',
      \'o' : [':FloatermNew', 'Open Floaterm'],
      \'p' : [':FloatermNew ptpython',   'Python REPL (ptpython)'],
      \'g' : [':FloatermNew lazygit',   'LazyGit'],
      \'d' : [':FloatermNew lazydocker',   'LazyDocker'],
      \'n' : [':FloatermNew node',   'Node REPL'],
      \'r' : [':FloatermNew ranger',   'Ranger'],
      \'t' : [':FloatermNew ts-node',   'Typescript REPL'],
      \'y' : [':FloatermNew ytop',   'YTop'],
      \'T' : [':FloatermToggle',   'Floaterm Toggle'],
      \'k' : [':FloatermKill',   'Floaterm Kill'],
      \'z' : [':FloatermNew fzf',   'FZF'],
      \}



" ---------------------------------------

" Ale settings

" ---------------------------------------

let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'typescript': ['prettier', 'eslint'],
      \}

let g:ale_fix_on_save = 1

let g:ale_completion_enabled = 0

let g:ale_sign_error = '✘'

let g:ale_sign_warning = '◉'

let g:ale_echo_msg_error_str = '✘'

let g:ale_echo_msg_warning_str = '◉'

" If I ever move back to emoji, clear the highlights

" highlight clear ALEErrorSign

" highlight clear ALEWarningSign

highlight ALEErrorSign ctermbg=none ctermfg=red

highlight ALEWarningSign ctermbg=none ctermfg=yellow


" ---------------------------------------

" BufExplorer settings

" ---------------------------------------

nmap <script> <silent> <unique> <CR> :BufExplorer<CR>

let g:bufExplorerShowRelativePath=1

let g:bufExplorerShowUnlisted=1


" ---------------------------------------

" Airline settings

" ---------------------------------------

let g:airline_powerline_fonts = 1

let g:airline#extensions#ale#enabled = 1


" ---------------------------------------

" Vim-orgmode settings

" ---------------------------------------

" let g:org_aggressive_conceal = 1

" let g:org_heading_highlight_colors = ['Title', 'Constant', 'Identifier', 'Statement', 'PreProc', 'Type', 'Special']

" let g:org_heading_highlight_levels = len(g:org_heading_highlight_colors)

" let g:org_todo_keywords = [['TODO', 'WAITING', 'INPROGRESS', '|', 'DONE'], ['|', 'CANCELED']]

" let g:org_todo_keyword_faces = [['TODO', 'green'],['WAITING', 'cyan'], ['INPROGRESS', [':foreground lightyellow', ':background black', ':weight bold',
"       \   ':slant italic', ':decoration underline']], ['CANCELED',
"       \   [':foreground red', ':background black', ':weight bold',
"       \   ':slant italic', ':decoration strikethrough']]]



" let g:org_indent = 1

" let g:org_agenda_files = ['~/Documents/notes/*.org', '~/Documents/scratch/*.org']

" ---------------------------------------

" Vim-rooter settings

" ---------------------------------------

let g:rooter_patterns = ['.git', 'package.json']

" ---------------------------------------

" Startify settings

" ---------------------------------------

highlight StartifyHeader  ctermfg=114


let g:ascii = [
      \ ' ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓',
      \ ' ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒',
      \ '▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░',
      \ '▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██ ',
      \ '▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒',
      \ '░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░',
      \ '░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░',
      \ '   ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░   ',
      \ '         ░    ░  ░    ░ ░        ░   ░         ░   ',
      \ '                                ░                  ',
      \ ''
      \]

let g:startify_custom_header =
      \ 'map(g:ascii + startify#fortune#boxed(), "\"   \".v:val")'


" ---------------------------------------

" Abbreviations

" ---------------------------------------

iabbr fucntion function

iabbr funtcion functione

"colorscheme OceanicNext
colorscheme gruvbox
" colorscheme Nord
