" supposedly changes stuff based on filetype
filetype on
filetype plugin on

" something for python comments
autocmd FileType python set commentstring=#\ %s

" fixes colors for dark background
set background=dark

" leader
let mapleader=","

" switch between buffers 
nnoremap <leader><leader> <c-^>

" Syntax highlighting
syntax on

" autoindent
filetype indent on
set autoindent

" line numbers
set nu

" Highlight search
set hlsearch
set incsearch

" Highlight search off
:nmap <leader>q :nohlsearch<CR>

" pathogen (plugins in folders)
execute pathogen#infect()

" ctrlp 
set runtimepath^=~/.vim/bundle/ctrlp.vim

" nerd tree
:nmap nt :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 30
let g:NERDTreeIgnore = ['\.pyc$']

" closetag
" :au Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim
:let g:closetag_html_style=1
:source ~/.vim/bundle/closetag.vim

" escape key
:imap jj <Esc>

" spaces not tabs
set tabstop=4
set shiftwidth=4
set expandtab

" no line wrap
set nowrap

" save/restore folding
autocmd BufWinLeave .* mkview
autocmd BufWinEnter .* silent loadview

" folding
:set foldmethod=indent
" nnoremap <Space> za " space toggles fold

" run flake8 (pep8 + pyflakes) on save
" autocmd BufWritePost *.py call Flake8()
 let g:syntastic_check_on_open=1
 let g:syntastic_python_checkers=["flake8"]
 let g:syntastic_always_populate_loc_list=1

" vim-less support
nnoremap ,m :w <BAR> !lessc % > %:t:r.css<CR><space>

" LaTeX rubber macro for compiling with errors
autocmd filetype tex nnoremap <leader>ce :w<CR>:!rubber --pdf --warn all %<CR>

" LaTeX rubber macro for compiling with no errors
autocmd filetype tex nnoremap <leader>cne :w<CR>:!rubber --pdf %<CR><CR>

" LaTeX PDF macro
autocmd filetype tex nnoremap <leader>v :!evince %:r.pdf &<CR><CR>

" spellcheck for LaTeX and txt
autocmd BufNewFile,BufRead *.tex setlocal spell spelllang=en_us
autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en_us

" vim-airline
" let g:airline_powerline_fonts = 1

" powerline
"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup
"set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

" split navigation
nmap <silent> <c-k> :wincmd k<CR>                                                                                                                       
nmap <silent> <c-j> :wincmd j<CR>                                                                                                                       
nmap <silent> <c-h> :wincmd h<CR>                                                                                                                       
nmap <silent> <c-l> :wincmd l<CR>
