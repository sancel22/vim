set nocompatible              " be iMproved, required

so ~/.vim/plugins.vim

"syntax enable"
syntax on
set encoding=utf8
set backspace=indent,eol,start
let mapleader=","
set nonumber
set relativenumber
set linespace=15
set autoread
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//


" ----VISUALS----- "
set t_Co=256
set listchars=tab:\ \ ,trail:.
set list
set background=dark
colorscheme hybrid_material
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
highlight LineNr ctermfg=white

set foldcolumn=1
hi vertsplit ctermfg=none ctermbg=none
hi foldcolumn ctermfg=none ctermbg=none
hi Signcolumn ctermbg=none
set complete =.,w,b,u


let @a="yiw/}O$this->pA = $pA;?n __constructOprotected $pA;/\", "

"-----SEARCHING-----"
set hlsearch
set incsearch





"-----SPLIT MANAGEMENT-----"
set splitbelow
set splitright
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>





"-----MAPPINGS-----"
nmap <Leader>ev :tabedit $MYVIMRC<cr>
nmap <Leader>sv :so $MYVIMRC<cr>
nmap <Leader><space> :nohl<cr>
nmap <Leader>o <C-w>o
nmap <Leader>1 :NERDTreeToggle<cr>
nmap <Leader>f :tag<space>
vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>


"-----PLUGINS-----"

"CTRLP"
let g:ctrlp_custom_ignore = 'node_modules\|git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

"PHP-CS_FIXER"
let g:php_cs_fixer_fixers_list = "-psr0"
let g:php_cs_fixer_level = "psr2"
let g:enable_bold_font = 1
nnoremap <silent><leader>pf :call PhpCsFixerFixFile()<CR>

"PHP-CODESNIFFER"
let g:phpqa_codesniffer_args = "--standard=psr2"

"PDV"
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <Leader>d :call pdv#DocumentWithSnip()<CR>

"ULTISNIPS"
let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips/'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"ACK"
let g:ackprg = 'ag --nogroup --nocolor --column'

"AIRLINE"
set laststatus=2
let g:airline_powerline_fonts=1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''



"VIM-DEVICONS"
let g:WebDevIconsUnicodeGlyphDoubleWidth=1
let g:WebDevIconsNerdTreeGitPluginForceVAlign=0
let g:webdevicons_conceal_nerdtree_brackets=1
let g:WebDevIconsNerdTreeAfterGlyphPadding=''


"FUGITIVE-STATUSLINE"
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}


"-------------Laravel-Specific--------------"
nmap <Leader>lr :e app/Http/routes.php<cr>
nmap <Leader>lm :!php artisan make:
nmap <Leader><Leader>c :e app/Http/Controllers/<cr>
nmap <Leader><Leader>m :CtrlP<cr>app/
nmap <Leader><Leader>v :e resources/views/<cr>

nmap <Leader>ut :!ctags -R --exclude=node_modules<cr>
nmap <Leader>t :!./vendor/phpunit/phpunit/phpunit %<cr>



"----AUTO-COMMAND----"
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END


function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<CR>

