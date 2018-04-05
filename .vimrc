set sw=4 sts=4 ts=4 et

au Filetype ocaml setlocal ts=2 sw=2 sts=2 et

set nu

set ignorecase

set autoindent
set cindent

set hlsearch

"parenthesis match
set showmatch

set smartcase
set smarttab
set smartindent

set incsearch

set t_Co=256

set autowrite

syntax on

" 마지막으로 수정된 곳에 커서를 위치함
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

"vim-plug
call plug#begin('~/.vim/plugged')

Plug 'beigebrucewayne/subtle_solo'
Plug 'beigebrucewayne/Turtles'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'chase/vim-ansible-yaml'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/rainbow_parentheses.vim'

call plug#end()
filetype plugin indent on

" colorscheme
set background=dark
"colorscheme turtles
"colorscheme subtle_dark
colorscheme thaumaturge

" Indent-Guides
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=244 guibg=red
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=240 guibg=red
autocmd VimEnter,Colorscheme * :IndentGuidesEnable

autocmd VimEnter * RainbowParentheses

" airline
set laststatus=2
set t_Co=256
let g:airline_theme = 'badwolf'
let g:airline_powerline_fonts = 1
let g:airline#extensions#syntastic#enabled = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_min_count = 2

" syntax
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_check_on_wq = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

highlight SyntasticErrorSign guifg=white guibg=red
highlight SyntasticErrorLine guibg=#2f0000

let g:syntastic_c_compiler = 'gcc'

let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++11'

let g:loaded_syntastic_cpp11_gcc_checker = 1
let g:syntastic_cpp11_compiler = executable('g++') ? 'g++' : 'clang++'
let g:syntastic_cpp_include_dirs = [ '../external/glfw-3.0.3/include/GLFW/', 'external/glfw-3.0.3/include/GLFW/', 'external/glm-0.9.4.0/', '../external/glm-0.9.4.0/', 'external/glew-1.9.0/include/' , '../external/glew-1.9.0/include/' ]

" syntastic toggle errors
function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        Errors
    endif
endfunction

" nerdtree
map <F8> :NERDTreeToggle<cr>
