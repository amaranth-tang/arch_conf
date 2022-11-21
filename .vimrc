set nocompatible              " be iMproved, required
filetype off                  " required
filetype indent on

if has('python3')
endif

com Bd bp | sp | bn | bd

" dein
if &compatible
    set nocompatible
endif

" append to runtime path
set rtp+=/usr/share/vim/vimfiles

" initialize dein, plugins are installed to this directory
if dein#load_state('~/.cache/dein')
    call dein#begin(expand('~/.cache/dein'))
" add packages here, e.g:
    call dein#add('wsdjeg/dein-ui.vim')
    "call dein#add('tmux-plugins/vim-tmux-focus-events')
    "call dein#add('roxma/vim-tmux-clipboard')
    call dein#add('christoomey/vim-tmux-navigator')
    "call dein#add('bling/vim-airline')
    "call dein#add('vim-airline/vim-airline-themes')
    call dein#add('scrooloose/nerdcommenter')
    " coc-explorer
    call dein#add('scrooloose/nerdtree')
    call dein#add('jistr/vim-nerdtree-tabs')
    call dein#add('jiangmiao/auto-pairs')
    call dein#add('ervandew/supertab')
    call dein#add('easymotion/vim-easymotion')
    call dein#add('roxma/vim-window-resize-easy')
    call dein#add('terryma/vim-multiple-cursors')
    call dein#add('qpkorr/vim-bufkill')
    call dein#add('Yggdroot/LeaderF')
    call dein#add('magic-dot-files/TagHighlight')
    call dein#add('mbbill/undotree')
    call dein#add('kien/rainbow_parentheses.vim')
    call dein#add('Yggdroot/indentLine')
    call dein#add('mhinz/vim-startify')
    call dein#add('dense-analysis/ale')
    call dein#add('skywind3000/asyncrun.vim')
    call dein#add('PyCQA/isort')
    call dein#add('liuchengxu/vim-which-key')
    "call dein#add('SirVer/ultisnips')
    call dein#add('honza/vim-snippets')
    call dein#add('sillybun/zytutil')
    call dein#add('sillybun/vim-repl')


    " git
    call dein#add('tpope/vim-fugitive')
    call dein#add('airblade/vim-gitgutter')


    "" python
    call dein#add('kh3phr3n/python-syntax')
    call dein#add('tmhedberg/SimpylFold')
    call dein#add('Vimjas/vim-python-pep8-indent')
    "call dein#add('sillybun/setbreakpoints_python')
    call dein#add('davidhalter/jedi-vim')
    call dein#add('deoplete-plugins/deoplete-jedi')
    call dein#add('Shougo/deoplete.nvim')
    if !has('nvim')
        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
    endif


    " markdown
    call dein#add('plasticboy/vim-markdown')
    call dein#add('iamcco/markdown-preview.nvim', {'on_ft': ['markdown', 'pandoc.markdown', 'rmd'],
                    \ 'build': 'sh -c "cd app && yarn install"' })
    "call dein#add('iamcco/markdown-preview.nvim', {'on_ft': ['markdown', 'pandoc.markdown', 'rmd'],
    "call dein#add('iamcco/markdown-preview.nvim', {'build': 'cd app && yarn install'})

" exit dein
    call dein#end()
    call dein#save_state()
endif

" auto-install missing packages on startup
if dein#check_install()
    call dein#install()
endif

filetype plugin on


" vim-markdown setting
" disable the folding configuration
"let g:vim_markdown_folding_disabled = 1
" fold in a style like python-mode
let g:vim_markdown_folding_style_pythonic = 1
" prevent foldtext from being set
let g:vim_markdown_override_foldtext = 0
" disable conceal regardless of conceallevel setting
let g:vim_markdown_conceal = 0
" disable math conceal with LaTeX math syntax enabled
let g:tex_conceal = ""
let g:vim_markdown_math = 1
" Allow for the TOC window to auto-fit when it's possible for it to shrink
let g:vim_markdown_toc_autofit = 1

" markdown-preview.nvim
let g:mkdp_browser = 'firefox'




" python settting
let python_highlight_all=1
" 运行文件
"map <F5> :w<cr>:r!time python %<cr>
"map <F5> :call CompileRunGcc()<CR>
"func! CompileRunGcc()
    "exec "w"
    "if &filetype == 'c'
            "exec "!g++ % -o %<"
            "exec "!time ./%<"
    "elseif &filetype == 'cpp'
            "exec "!g++ % -o %<"
            "exec "!time ./%<"
    "elseif &filetype == 'java'
            "exec "!javac %"
            "exec "!time java %<"
    "elseif &filetype == 'sh'
            ":!time bash %
    "elseif &filetype == 'python'
            "exec "!clear"
            "exec "!time python3 %"
    "elseif &filetype == 'html'
            "exec "!firefox % &"
    "elseif &filetype == 'go'
            "" exec "!go build %<"
            "exec "!time go run %"
    "elseif &filetype == 'mkd'
            "exec "!~/.vim/markdown.pl % > %.html &"
            "exec "!firefox %.html &"
    "endif
"endfunc



" python-syntax
let g:python_highlight_all = 1

" SimpylFold
let g:SimpylFold_docstring_preview = 0
let g:SimpylFold_fold_docstring = 1
let b:SimpylFold_fold_docstring = 1
let g:SimpylFold_fold_import = 1
let b:SimpylFold_fold_import = 1

" deoplete
set pyxversion=3
let g:deoplete#enable_at_startup = 1

" jedi
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#use_splits_not_buffers = "left"
let g:jedi#popup_select_first = 0
let g:jedi#show_call_signatures = "2"
let g:jedi#completions_enabled = 0

" vim-python-pep8-indent
"python_pep8_indent_hang_closing = 1

" sillybun
" setbreakpoints_python
"autocmd FileType python nnoremap <F12> :call ToggleBreakPoint()<Cr>
" autoformatpythonstatement
"autocmd FileType python let g:autoformatpython_enabled = 1



" quickfix toggle
"nnoremap <F11> :call QuickfixToggle()<cr>

"let g:quickfix_is_open = 0

"function! QuickfixToggle()
    "if g:quickfix_is_open
        "cclose
        "let g:quickfix_is_open = 0
    "else
        "copen
        "let g:quickfix_is_open = 1
    "endif
"endfunction
"nnoremap <leader>cn :cn<cr>
"nnoremap <leader>cp :cp<cp>

" powerline font patch
let g:powerline_pycmd="py3"

" clipboard
"vnoremap <C-c> y: call system("xclip -i", getreg("\""))<CR>
"noremap <C-Q> :r !xclip -o <CR>
"vmap <c-c> y:call system("xclip -i -selection clipboard", getreg("\""))<cr>:call system("xclip -i", getreg("\""))<cr>
"nnoremap <c-v> :call setreg("\"",system("xclip -o -selection clipboard"))<cr>p")")")"))

" Write all buffers before navigating from Vim to tmux
let g:tmux_navigator_save_on_switch = 2

" 修复Esc延迟
set ttimeoutlen=0
" 关闭自动缩进
set pastetoggle=<F8>

" settings
syntax enable
syntax on
" 当光标一段时间保持不动了，就禁用高亮
autocmd cursorhold * set nohlsearch
" 当输入查找命令时，再启用高亮
noremap n :set hlsearch<cr>n
noremap N :set hlsearch<cr>N
noremap / :set hlsearch<cr>/
noremap ? :set hlsearch<cr>?
noremap * *:set hlsearch<cr>

let g:mapleader = "\<Space>"
let g:maplocalleader = ','
let g:rehash256 = 1
set t_Co=256
set wildmenu
set wildmode=list:longest,full
"set wildmode=longest:list,full
set clipboard=unnamedplus

" scheme color
"colorscheme obsidian
"let g:gruvbox_italic=1
set background=dark
colorscheme gruvbox

set termencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,gbk,cp936,gb2312,gb18030
" 启用光标行
set cursorline
" 启用光标列
set cursorcolumn
" 设置光标不闪烁
"set guicursor+=a:blinkon0

" 总显示最后一个窗口的状态行
set laststatus=2
" 显示行号
set number
" 显示相对行号
augroup relative_numbser
    autocmd!
    autocmd InsertEnter * :set norelativenumber
    autocmd InsertLeave * :set relativenumber
augroup END
" 不显示输入模式
set noshowmode

" tab宽度
" 设置制表符(tab键)的宽度
set tabstop=4
" (自动) 缩进使用的4个空格
set shiftwidth=4
" 设置软制表符的宽度
set softtabstop=4
" 显示tab和空格
set list
" 设置tab和空格样式
set lcs=tab:\|\ ,nbsp:%,trail:-
" 设定行首tab为灰色
highlight LeaderTab guifg=#666666
" 匹配行首tab
match LeaderTab /^\t/"

set expandtab
set smarttab
" 设置自动对齐(缩进)
set autoindent
" 智能对齐方式
set smartindent
" 标尺，用于显示光标位置的行号和列号，逗号分隔。
set ruler
" 搜索模式里忽略大小写
set ignorecase
set hls
" 用语法高亮来定义折叠
set foldmethod=syntax
" 命令行显示输入的命令
set showcmd
" 在光标接近底端或顶端时，自动下滚或上滚
"set scrolloff=5
" 设置当文件在外部被修改，自动更新该文件
"autoread

" backup
" 设置不生成备份文件
set nobackup
set nowb
set noswapfile

" search
" 高亮显示查找结果
set hlsearch
" 增量查找
set incsearch

" backspace
set backspace=eol,start,indent
set whichwrap+=<,>,h,l



"ctags settings
let Tlist_Ctags_Cmd ='/usr/bin/ctags'
" 设定系统中ctags程序的位置



" nerdtree settings
" autocmd vimenter * NERDTree
" 在 vim 启动的时候默认开启 NERDTree（autocmd 可以缩写为 au）
"autocmd VimEnter * wincmd p
" 打开新的buffer时自动定位到编辑窗口
autocmd StdinReadPre * let s:std_in=1
" 当不带参数打开 Vim 时自动加载项目树(disable with vim-startify)
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" 按下 F2 调出/隐藏 NERDTree
map <silent> <F2> :NERDTreeToggle<CR>
"当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"设置树的显示图标
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" " 设置宽度
let NERDTreeWinSize=30
" " 在终端启动vim时，共享NERDTree
"let g:nerdtree_tabs_open_on_console_startup=1
" " 忽略以下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" " 显示书签列表
let NERDTreeShowBookmarks=1



" airline settings
let g:airline_powerline_fonts = 1
let g:airline_theme="gruvbox"
"let g:airline_theme="cool"
let g:airline#extensions#tabline#enabled = 1
" 打开tabline功能,方便查看Buffer和切换，这个功能比较不错
let g:airline#extensions#tabline#buffer_nr_show = 1
"设置切换Buffer快捷键"
"nnoremap <C-N> :bn<CR>
"nnoremap <C-P> :bp<CR>
"let g:airline#extensions#whitespace#enabled=0
" 关闭空白符检测


" to use fancy symbols for airline, uncomment the following lines and use a
" patched font (more info on the README.rst)
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''



" ale settings
" 始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 1
" 自定义 error 和 warning 图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
" 在vim自带的状态栏中整合 ale
"let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
let g:airline#extensions#ale#enabled = 1
" 显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" 添加检测完成后回调
augroup YourGroup
    autocmd!
    autocmd User ALELint    call YourFunction()
augroup END
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_open_list = 0

" 自定义跳转错误行快捷键
nnoremap <Leader>p <Plug>(ale_previous_wrap)
nnoremap <Leader>m <Plug>(ale_next_wrap)
" <F10>触发/关闭语法检查
"map <F10> :ALEToggle<CR>
" <F11>查看错误或警告的详细信息
"map <F11> :ALEDetail<CR>

" 关闭实时语法检查,仅在保存文件是运行Linters
" 文件内容发生变化时不进行检查
let g:ale_lint_on_text_changed = 'never'
" 打开文件时不进行检查
let g:ale_lint_on_enter = 0
" 保存时自动修复文件
"let g:ale_fix_on_save = 1
let g:ale_linters = {'python': ['flake8'],}
" Suggested Fixers:
" 'add_blank_lines_for_python_control_statements' - Add blank lines before control statements.
" 'autopep8' - Fix PEP8 issues with autopep8.
" 'black' - Fix PEP8 issues with black.
" 'isort' - Sort Python imports with isort.
" 'remove_trailing_lines' - Remove all blank lines at the end of a file.
" 'trim_whitespace' - Remove all trailing whitespace characters at the end of every line.
" 'yapf' - Fix Python files with yapf.
let g:ale_fixers = {
\ 'python': ['isort', 'yapf'],
\}
nnoremap <F4> :ALEFix<cr>:w<cr>



" indentLine
let g:indentLine_char='┆'
let g:indentLine_enabled = 1


" vim-fugitive
" maps .. to oepn the parent tree for buffers containing a git blob or tree
autocmd User fugitive 
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif')'
" auto clean fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete
" open quickfix window after any grep invocation
autocmd QuickFixCmdPost *grep* cwindow



" airblade/vim-gitgutter
" You can jump between hunks with [c and ]c. You can preview, stage, and undo
" hunks with <leader>hp, <leader>hs, and <leader>hu respectively.
set updatetime=100



" supertab&snipmate settings
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-x><C-o>"
let g:SuperTabMappingForward="<Tab>"
let g:SuperTabMappingBackward="<S-Tab>"



" vim-easy-align settings
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nnoremap ga <Plug>(EasyAlign)



" tagbar settings
"nnoremap <silent><F3> :TagbarToggle<CR>
"let g:tagbar_ctags_bin='/usr/bin/ctags'
"let g:tagbar_width=30
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()
"let g:tagbar_autofocus=1



" LeaderF
let g:Lf_ShortcutF = '<C-P>'
let g:Lf_StlColorscheme = 'gruvbox_material'
let g:Lf_StlSeparator = { 'left': '', 'right': '' }



" undortree settings
nnoremap <F3> :UndotreeToggle<cr>



" rainbow_parentheses
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    "\ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces



" vim-startify
autocmd VimEnter *
\   if !argc()
\ |   Startify
\ |   NERDTree
\ |   wincmd w
\ | endif
"let NERDTreeHijackNetrw = 0



" asyncrun
let g:asyncrun_open = 8
let g:asyncrun_bell = 1
nnoremap <F9> :call asyncrun#quickfix_toggle(8)<cr>
"nnoremap <silent> <F5> :w<cr>:AsyncRun -raw python -u %<cr>
augroup python_file
	autocmd!
	autocmd FileType python nnoremap <F5> :w<cr>:AsyncRun -raw python -u %<cr>
augroup END



" isort
"autocmd FileType python nnoremap <LocalLeader>i :!isort %<CR><CR>



" vim-which-key
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>



" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"



" vim-repl
let g:repl_program = {
            \   'python': 'ipython',
            \   'default': 'zsh',
            \   }
let g:repl_exit_commands = {
            \   'python': 'quit()',
            \   'bash': 'exit',
            \   'zsh': 'exit',
            \   'default': 'exit',
            \   }
let g:repl_predefine_python = {
            \   'numpy': 'import numpy as np',
            \   'matplotlib': 'from matplotlib import pyplot as plt'
            \   }
"let g:repl_checkpoint_position = '~/.temp/'
let g:repl_auto_sends = ['class ', 'def ']
let g:repl_cursor_down = 1
nnoremap <F6> :REPLToggle<Cr>
autocmd Filetype python nnoremap <F12> <Esc>:REPLDebugStopAtCurrentLine<Cr>
autocmd Filetype python nnoremap <F10> <Esc>:REPLPDBN<Cr>
autocmd Filetype python nnoremap <F11> <Esc>:REPLPDBS<Cr>
"let g:repl_checkpoint_notation = "CP"
let g:repl_position = 1
"let g:repl_width = None
let g:repl_height = 10
tnoremap <C-h> <C-w><C-h>
tnoremap <C-j> <C-w><C-j>
tnoremap <C-k> <C-w><C-k>
tnoremap <C-l> <C-w><C-l>
