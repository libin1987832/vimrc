set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/single_vim
"set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim
"set rtp+=~/.vim/bundle/single_vim/molokai.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/lb/git/command-t'
" The sparkup vim script is in a subdirectory of this repo called vim.
"n 'scrooloose/nerdtree' Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'scrooloose/nerdtree'
"Plugin 'Xuyuanp/nerdtree-git-plugin'
" All of your Plugins must be added before the following line
Plugin 'Valloric/YouCompleteMe'
"Plugin 'kien/ctrlp.vim'
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
"Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-airline/vim-airline'
Plugin 'dyng/ctrlsf.vim'
Plugin 'rking/ag.vim'
Plugin 'http://git.oschina.net/qiuchangjie/CodeFormatter'
Plugin 'scrooloose/syntastic'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'chiel92/vim-autoformat'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
"Plugin 'diffchanges.vim'
Plugin 'chrisbra/changesPlugin'
"cmake
"Plugin 'jalcine/cmake.vim'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jreybert/vimagit'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'lfv89/vim-interestingwords'
Plugin 'Valloric/ListToggle'
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"
"nerdtree map
" Ctrl+N 打开/关闭
map <C-n> :NERDTreeToggle<CR><ESC>/src<CR>o


"python3 from powerline.vim import setup as powerline_setup
"python3 powerline_setup()
"python3 del powerline_setup


" 当不带参数打开Vim时自动加载项目树
autocmd StdinReadPre * let s:std_in=1
"autocmd StdinReadPost * exec /src<CR>o"
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree |endif

"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"au VimEnter * execute "normal:/src\<cr>o"
"autocmd VimEnter * execute <ESC>/src<CR>o
" 当所有文件关闭时关闭项目树窗格
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == primary") | q | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" 不显示这些文件
let NERDTreeIgnore=['\.pyc$', '\~$', 'node_modules','obj','\.out','\.files','\.so','tags']
"ignore files in NERDTree
" 不显示项目树上额外的信息，例如帮助、提示什么的
let NERDTreeMinimalUI=1

"PowerLine map
set guifont=Sauce\ Code\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
"set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
let g:miniBufExplForceSyntaxEnable = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

"color solarized
syntax enable
set background=dark
"colorscheme molokai
let g:molokai_original = 1



let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"配置默认的ycm_extra_conf.py
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_confirm_extra_conf=0   " 打开vim时不再询问是否加载ycm_extra_conf.py配置
let g:ycm_collect_identifiers_from_tag_files = 1 "使用ctags生成的tags文件

let g:ycm_enable_diagnostic_signs = 1 "诊断症状使能
let g:ycm_enable_diagnostic_highlighting = 1 "诊断语法彩笔做标记
let g:ycm_register_as_syntastic_checker = 1 " 使用syntastic检测语法
let g:ycm_error_symbol = '乄'
let g:ycm_warning_symbol = '〇'
let g:ycm_show_diagnostics_ui = 1

nnoremap <leader>ch :YcmDiags<CR>
"tags
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

"cscope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-F10> :!find . -name "*.c" -o -name "*.h" > cscope.files
map <C-F11> :!cscope -bkq -i cscope.files
if has("cscope")
		set csprg=/usr/bin/cscope
		set csto=1
		set cst
		set nocsverb
		" add any database in current directory
		if filereadable("cscope.out")
				cs add cscope.out
		endif
		set csverb
endif

nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"ag key
let g:ag_working_path_mode="r"

set number
set ts=2
set softtabstop=2

"sybtastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"let g:syntastic_c_check_header = 1
"let g:syntastic_c_auto_refresh_includes = 1
"let g:syntastic_c_include_dirs = [ '/usr/include', '/usr/include/x86_64-linux-gnu' ]
"let g:syntastic_c_compiler = 'clang'


let g:syntastic_c_checkers=['make']
let g:syntastic_c_errorformat = ' %trror: a%m'
let g:syntastic_c_compiler = 'make'



noremap <F3> :Autoformat<CR>
noremap <F5> :!make<CR>
"map <F3> :call FormatCode()<CR>
"func! FormatCode()
    "exec "w"
    "if &filetype == 'c' || &filetype == 'h'
        "exec "!astyle --style=allman --suffix=none %"
    "elseif &filetype == 'cpp' || &filetype == 'cc' || &filetype == 'hpp'
        "exec "!astyle --style=allman --suffix=none %"
    "elseif &filetype == 'perl'
        "exec "!astyle --style=gnu --suffix=none %"
    "elseif &filetype == 'py'|| &filetype == 'python'
        "exec "!autopep8 --in-place --aggressive %"
    "elseif &filetype == 'java'
        "exec "!astyle --style=java --suffix=none %"
    "elseif &filetype == 'jsp'
        "exec "!astyle --style=gnu --suffix=none %"
    "elseif &filetype == 'xml'
        "exec "!astyle --style=gnu --suffix=none %"
    "else
        "exec "normal gg=G"
        "return
    "endif
"endfunc
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
"let g:autoformat_verbosemode=1
"OR:
"let verbose=1
noremap <F6> :!./darknet<CR>
inoremap <F2> :DiffChangesDiffToggle<CR>

nmap <F4> <ESC>:CtrlSF <c-r><c-w><CR>
nmap <C-F4> <ESC>:CtrlSFOpen<CR>

"complete {
"inoremap ' ''<ESC>i
"inoremap " ""<ESC>i
"inoremap ( ()<ESC>i
"inoremap [ []<ESC>i
"inoremap { {<CR>}<ESC>O

""设置跳出自动补全的括号
"func SkipPair()
"if getline('.')[col('.') - 1] == ')' || getline('.')[col('.') - 1] == ']' || getline('.')[col('.') - 1] == '"' || getline('.')[col('.') - 1] == "'" || getline('.')[col('.') - 1] == '}'
"return "\<ESC>la"
"else
"return "\t"
"endif
"endfunc
"" 将tab键绑定为跳出括号
"inoremap <TAB> <c-r>=SkipPair()<CR>
"
"
"nnoremap <leader>I <ESC>i<CR>#!/bin/bash<ESC>
autocmd filetype sh execute "normal i#!/bin/bash\r"
augroup reload_vimrc " {
		autocmd!
		autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }


let g:NERDTreeShowIgnoredStatus = 1

"highlight
nnoremap <silent> <leader>k :call InterestingWords('n')<cr>
nnoremap <silent> <leader>K :call UncolorAllWords()<cr>

nnoremap <silent> n :call WordNavigation('forward')<cr>
nnoremap <silent> N :call WordNavigation('backward')<cr>

let g:interestingWordsTermColors = ['154', '121', '211', '137', '214', '222']
let g:interestingWordsRandomiseColors = 1

"command-t
set wildignore+=*.o,*.obj
let g:CommandTFileScanner="git"
