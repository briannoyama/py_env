"Based off of https://github.com/mbrochh/vim-as-a-python-ide/blob/master/.vimrc

"Copy and paste from same clipboard as OS
set clipboard=unnamed
"Turn on mouse
set mouse=a
"Make backspace normal
set bs=2

"Move through split screens easier.
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

"Move through tabs easier.
map <c-,> :tabprevious<CR>
map <c-.> :tabnext<CR>

"Indent more easily
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

"Highlight extra spaces as red.
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

"Color theme
set t_Co=256
color seoul256

"Syntax highlighting
filetype off
filetype plugin indent on
syntax on

"Line numbers, width of document
set number
set tw=79
set nowrap
set fo-=t
set colorcolumn=80
highlight ColorColumn ctermbg=233

"numbers for help
autocmd FileType help setlocal number

"More history
set history=512
set undolevels=512

"Make tabs into spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

"Search options
set hlsearch
set incsearch

"Remove backup and swap files
set nobackup
set nowritebackup
set noswapfile

"Start pathogen
call pathogen#infect()
call pathogen#helptags()

"For powerline
set laststatus=2
set encoding=utf-8

"Settings for Jedi 
let g:jedi#usages_command = "<leader>z"
let g:jedi#popup_select_first = 0

"Easier navigation through autocomplete.
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

"Python folding
set nofoldenable
