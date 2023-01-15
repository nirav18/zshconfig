source ~/.config/vim_config/vimrc_plug.vim
filetype plugin indent on
syntax on
set background=dark
set backspace=indent,eol,start
set laststatus=2
let g:lightline = {'colorscheme' : 'everforest'}
let g:everforest_background = 'hard'
set fileformat=unix
set encoding=utf-8
set fileencoding=utf-8
set wrap
set textwidth=80
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set autoindent
set viminfo='25,\"50,n~/.viminfo
autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType css setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2
" auto-pairs
"au FileType python let b:AutoPairs = AutoPairsDefine({"f'" : "'", "r'" : "'", "b'" : "'"})
" colorscheme theme for vim

set t_Co=256
set background=dark
colorscheme PaperColor 

" word movement
imap <S-Left> <Esc>bi
nmap <S-Left> b
imap <S-Right> <Esc><Right>wi
nmap <S-Right> w

" indent/unindent with tab/shift-tab
nmap <Tab> >>
nmap <S-tab> <<
imap <S-Tab> <Esc><<i
vmap <Tab> >gv
vmap <S-Tab> <gv

" mouse
set mouse=a
let g:is_mouse_enabled = 1
noremap <silent> <Leader>m :call ToggleMouse()<CR>
function ToggleMouse()
    if g:is_mouse_enabled == 1
        echo "Mouse OFF"
        set mouse=
        let g:is_mouse_enabled = 0
    else
        echo "Mouse ON"
        set mouse=a
        let g:is_mouse_enabled = 1
    endif
endfunction

" code folding
set foldmethod=indent
set foldlevel=99



" file browser
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let NERDTreeMinimalUI = 1
let g:nerdtree_open = 0
map <leader>n :call NERDTreeToggle()<CR>
function NERDTreeToggle()
    NERDTreeTabsToggle
    if g:nerdtree_open == 1
        let g:nerdtree_open = 0
    else
        let g:nerdtree_open = 1
        wincmd p
    endif
endfunction

function! StartUp()
    if 0 == argc()
        NERDTree
    end
endfunction
autocmd VimEnter * call StartUp()


" copy, cut and paste
vmap <C-c> "+y
vmap <C-x> "+c
imap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

function! XTermPasteBegin()
    set pastetoggle=<Esc>[201~
    set paste
    return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

"=====================================================
"" TagBar settings
"=====================================================
let g:tagbar_autofocus=0
let g:tagbar_width=42
" autocmd BufEnter *.py :call tagbar#autoopen(0)


"=====================================================
"" GitGutter settings
"=====================================================

let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
let g:gitgutter_override_sign_column_highlight = 2
highlight SignColumn guibg=bg
"highlight SignColumn ctermbg=bg
set updatetime=250
nmap <Leader>gn <Plug>GitGutterNextHunk  " git next
nmap <Leader>gp <Plug>GitGutterPrevHunk  " git previous



"=====================================================
"" UltiSnippet settings
"=====================================================

let g:UltiSnipsExpandTrigger="<c-u>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

"=====================================================
"" VIM PYTHON SYNTAX
"=====================================================
let g:python_highlight_all = 1


hi Pmenu ctermfg=green ctermbg=Darkgray
hi PmenuSel ctermfg=black ctermbg=black
hi PmenuSbar ctermfg=black ctermbg=black
hi PmenuThumb ctermfg=black ctermbg=black


hi CocErrorSign ctermfg=red  guibg=red
hi CocErrorFloat ctermfg=white ctermbg=red

hi CocInfoSign ctermfg=blue 
hi CocInfoFloat ctermfg=white ctermbg=blue

hi CocWarningSign ctermfg=white ctermbg=yellow
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() 
                    	          \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
<
