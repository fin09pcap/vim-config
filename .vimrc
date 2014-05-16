set nocompatible

"--[ Pathogen Setup ] --"
call pathogen#infect()


"--[ Vundle Setup ]--"
"Auto installs Vundle and activates it, then it installs all your bundles"

  let has_vundle=1
  if !filereadable($HOME."/.vim/bundle/vundle/README.md")
    echo "Installing Vundle"
    echo ""
    silent !git clone https://github.com/gmarik/vundle $HOME/.vim/bundle/vundle
    let has_vundle=0
  endif
  filetype on
  filetype off
  set rtp+=$HOME/.vim/bundle/vundle
  call vundle#rc()

"--[ Vundle Packages ]--"

  "--[ Recursive Vundle! ]--"
  Bundle 'gmarik/vundle'

  "--[ Solarized Color Schemes ]--"
  Bundle 'altercation/vim-colors-solarized'

  "--[ Git Integration ]--"
  Bundle 'tpope/vim-fugitive'

  "--[ Autocomplete/Snippets ]--"
  Bundle 'Shougo/neocomplcache'
  Bundle 'Shougo/neosnippet'
  Bundle 'Shougo/neosnippet-snippets'
  Bundle 'honza/vim-snippets'

  "--[ Surround ]--"
  Bundle 'tpope/vim-surround'

  "--[ Syntastic ]--"
  Bundle 'scrooloose/syntastic'

  "--[ Gists ]--"
  Bundle 'mattn/webapi-vim'
  Bundle 'mattn/gist-vim'

  "--[ NerdTree ]--"
  Bundle 'scrooloose/nerdtree'

  "--[ Markdown ]--"
  Bundle 'plasticboy/vim-markdown'

set laststatus=2
set rtp+=/home/finges/.local/lib/python3.3/site-packages/powerline/bindings/vim
"-- [GUI setup ]--"
syntax on                   " Set syntax highlighting on
set backspace=indent,eol,start  " Backspace
set number                  " Set Linenumbers on
set linespace=0             " No Extra spaces between rows
set showmatch               " Show matching Paren/brackets
set hlsearch                " Highlight Search Terms
set incsearch               " Hightlight search while typing
set ignorecase              " Case insensitive search
set smartcase               " Case sensitive when uppercase present
set wildmenu                " Show list instead of just completing
set colorcolumn=85          " Show column boundary
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set scrolljump=5            " Lines to scroll when cursor leaves screen
set scrolloff=3             " Minimum lines to keep above/below cursor
set background=dark         " Set a dark background
colorscheme solarized       " Set colorscheme to Solarized Dark


"-- [ Formatting ]--"
set nowrap                  " Do not wrap long lines
set autoindent              " Indent at the same level as previous line
set shiftwidth=2            " Use indents of 2 spaces (Ruby)
set tabstop=2               " An indentation every 2 columns
set expandtab               " Tabs are spaces not tabs
set nojoinspaces            " Prevents 2 spaces after a join
set splitright              " Puts new vsplit window to the right
set splitbelow              " Puts new hsplit window to the bottom
set cursorline              " Highlight current line

"-- [ Set tabs for python ] --"
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4

filetype plugin indent on



"-- [ Keybindings ] --"
  let mapleader = ','        " Change mapleader to
  noremap ; :

  "Remap keys to use screen lines instead of file lines. Usefull if wrapping
  "line

  nnoremap j gj
  nnoremap k gk
  nnoremap $ g$
  nnoremap 0 g0
  nnoremap <end> g<end>
  nnoremap <home> g<home>
  nnoremap ^ g^

  " Hide search highlighting
  nmap <silent> <leader>/ :set invhlsearch<cr>

  " Visual mode shifting - no exit
  vnoremap < <gv
  vnoremap > >gv

  "-- [ Fugitive ]--"
    nnoremap <silent> <leader>gs :Gstatus<CR>
    nnoremap <silent> <leader>gd :Gdiff<CR>
    nnoremap <silent> <leader>gc :Gcommit<CR>
    nnoremap <silent> <leader>gb :Gblame<CR>
    nnoremap <silent> <leader>gl :Glog<CR>
    nnoremap <silent> <leader>gp :Git push<CR>
    nnoremap <silent> <leader>gr :Gread<CR>
    nnoremap <silent> <leader>gw :Gwrite<CR>
    nnoremap <silent> <leader>ge :Gedit<CR>

  "-- [ NeoCompleCache ]--"
    let g:acp_enableAtStartup = 0
    let g:neocomplcache_enable_at_startup = 1
    let g:neocomplcache_enable_camel_case_completion = 1
    let g:neocomplcache_enable_smart_case = 1
    let g:neocomplcache_enable_underbar_completion = 1
    let g:neocomplcache_enable_auto_delimiter = 1
    let g:neocomplcache_max_list = 15
    let g:neocomplcache_force_overwrite_completefunc = 1

    " Define dictionary.
    let g:neocomplcache_dictionary_filetype_lists = {
          \ 'default' : '',
          \ 'vimshell' : $HOME.'/.vimshell_hist',
          \ 'scheme' : $HOME.'/.gosh_completions'
          \ }

    " Define keyword.
    if !exists('g:neocomplcache_keyword_patterns')
      let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns._ = '\h\w*'

    " Plugin key-mappings {
    " These two lines conflict with the default digraph mapping of <C-K>
    imap <C-k> <Plug>(neosnippet_expand_or_jump)
    smap <C-k> <Plug>(neosnippet_expand_or_jump)
    if exists('g:spf13_noninvasive_completion')
      iunmap <CR>
      " <ESC> takes you out of insert mode
      inoremap <expr> <Esc>   pumvisible() ? "\<C-y>\<Esc>" : "\<Esc>"
      " <CR> accepts first, then sends the <CR>
      inoremap <expr> <CR>    pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
      " <Down> and <Up> cycle like <Tab> and <S-Tab>
      inoremap <expr> <Down>  pumvisible() ? "\<C-n>" : "\<Down>"
      inoremap <expr> <Up>    pumvisible() ? "\<C-p>" : "\<Up>"
      " Jump up and down the list
      inoremap <expr> <C-d>   pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
      inoremap <expr> <C-u>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"
    else
      imap <silent><expr><C-k> neosnippet#expandable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ?
            \ "\<C-e>" : "\<Plug>(neosnippet_expand_or_jump)")
      smap <TAB> <Right><Plug>(neosnippet_jump_or_expand)

      inoremap <expr><C-g> neocomplcache#undo_completion()
      inoremap <expr><C-l> neocomplcache#complete_common_string()
      inoremap <expr><CR> neocomplcache#complete_common_string()

      " <CR>: close popup
      " <s-CR>: close popup and save indent.
      inoremap <expr><s-CR> pumvisible() ? neocomplcache#close_popup()"\<CR>" : "\<CR>"
      inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"

      " <C-h>, <BS>: close popup and delete backword char.
      inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
      inoremap <expr><C-y> neocomplcache#close_popup()
    endif
    " <TAB>: completion.
    inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"
    " }

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
    autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

    " Enable heavy omni completion.
    if !exists('g:neocomplcache_omni_patterns')
      let g:neocomplcache_omni_patterns = {}
    endif
    let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
    let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'

  "--[ NerdTree ]--"
  map <C-e> :NERDTreeToggle<CR>
  map <leader>nt :NERDTreeFind<CR>

  let NERDTreeShowBookmarks=1
  let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git$']
  let NERDTreeChDirMode=0
  let NERDTreeQuitOnOpen=1
  let NERDTreeMouseMode=2
  let NERDTreeShowHidden=1
  let NERDTreeKeepTreeInNewTab=1
