"""""""""""""""""""""""""

" Plugin configurations "

"""""""""""""""""""""""""

filetype plugin indent on
augroup Indentation
    autocmd!
    autocmd FileType javascript set shiftwidth=2
augroup END
" let g:sublimemonokai_term_italic = 1

colorscheme gruvbox 
let g:gruvbox_contrast_dark = 'hard'
let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1
let ayucolor="dark"
set background=dark
" colorscheme onehalfdark
" let g:airline_theme='gruvbox'
let g:airline_theme='ayu_dark'
let g:airline#extensions#tabline#enabled = 1
hi Normal guibg=NONE ctermbg=NONE
" highlight Normal guibg=0 ctermbg=0

" Emmet
let g:user_emmet_leader_key=','

"" Vim Javascript
" let g:javascript_conceal_function             = "ƒ"
" let g:javascript_conceal_null                 = "ø"
" let g:javascript_conceal_this                 = "@"
" let g:javascript_conceal_return               = "⇚"
" let g:javascript_conceal_undefined            = "¿"
" let g:javascript_conceal_NaN                  = "ℕ"
" let g:javascript_conceal_prototype            = "¶"
" let g:javascript_conceal_static               = "•"
" let g:javascript_conceal_super                = "Ω"
" let g:javascript_conceal_arrow_function       = "⇒"
" let g:javascript_conceal_noarg_arrow_function = "🞅"
" let g:javascript_conceal_underscore_arrow_function = "🞅"


"" NERD TREE Set-Up

let NERDTreeQuitOnOpen = 1					" Automatically quit NerdTree when you open a file
let NERDTreeAutoDeleteBuffer = 1		" Automatically delete the buffer of the fule you just deleted
let NERDTreeMinimalUI = 1						" Making it prettier
let NERDTreeDirArrows = 1						" Enable directions arrows
let NERDTreeShowHidden= 1           " Show hidden files by default

"" Open NerdTree by default
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists(“s:std_in”) | NERDTree | endif

" autocmd VimEnter * NERDTree
" autocmd BufEnter * NERDTreeMirror
" autocmd VimEnter * wincmd w
"
nnoremap <Leader>t :NERDTreeToggle<Enter>			
nnoremap <silent> <Leader>f :NERDTreeFind<CR>
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>

"" Close tab if only the remaining window is NerdTree
"autocmd bufenter * if (winnr(“$”) == 1 && exists(“b:NERDTreeType”) && b:NERDTreeType == “primary”) | q | endif

" NERDCommenter: Configuration

" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
" let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
" let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
" let g:NERDToggleCheckAllLines = 1


" UltiSnippets: Configuration
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" Telescope
nnoremap <silent> ;f <cmd>Telescope find_files<cr>
nnoremap <silent> ;r <cmd>Telescope live_grep<cr>
nnoremap <silent> \\ <cmd>Telescope buffers<cr>
nnoremap <silent> ;; <cmd>Telescope help_tags<cr>


nnoremap <leader><right> :bnext<CR>
nnoremap <leader><left>  :bprevious<CR>


inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })



" let g:compe.source.tabnine = v:true
" let g:compe.source.tabnine = {}
" let g:compe.source.tabnine.max_line = 1000
" let g:compe.source.tabnine.max_num_results = 6
" let g:compe.source.tabnine.priority = 5000
" " setting sort to false means compe will leave tabnine to sort the completion items
" let g:compe.source.tabnine.sort = v:false
" let g:compe.source.tabnine.show_prediction_strength = v:true
" let g:compe.source.tabnine.ignore_pattern = ''

nnoremap <A-o> <Cmd>lua require'jdtls'.organize_imports()<CR>
nnoremap crv <Cmd>lua require('jdtls').extract_variable()<CR>
vnoremap crv <Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>
nnoremap crc <Cmd>lua require('jdtls').extract_constant()<CR>
vnoremap crc <Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>
vnoremap crm <Esc><Cmd>lua require('jdtls').extract_method(true)<CR>
