"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! spacemacs#toggleExplorerAtRoot()
  if exists(':ProjectRootExe')
    exe "ProjectRootExe NERDTreeToggle"
  else
    exe "NERDTreeToggle"
  endif
endfunction

" errors (syntastic integration)
function! ToggleErrors()
    let old_last_winnr = winnr('$')
    SyntasticToggleMode
    " lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        " Errors
        SyntasticCheck
    endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Alphabetical and avoid <SILENT> for now.
nmap <LEADER><TAB> <C-^>
nmap <LEADER>? :Unite output:nmap\ \<LEADER\><CR>
nmap <LEADER>;  <Plug>Commentary
nmap <LEADER>;; <Plug>CommentaryLine
omap <LEADER>;  <Plug>Commentary
vmap <LEADER>;  <Plug>Commentary
nmap <LEADER>au :UndotreeToggle<CR>
nmap <LEADER>bb :buffers<CR>
nmap <LEADER>bd :bdelete<CR>
nmap <LEADER>bn :bn<CR>
nmap <LEADER>bp :bp<CR>
nmap <LEADER>bR :e<CR>
nmap <LEADER>el :<C-U>call ToggleErrors()<CR>
nmap <LEADER>en :lnext<CR>
nmap <LEADER>ep :lprev<CR>
nmap <LEADER>fed :e ~/.vimrc<CR>
nmap <LEADER>feR :source ~/.vimrc<CR>
nmap <LEADER>ff :CtrlPCurFile<CR>
nmap <LEADER>fr :CtrlPMRU<CR>
nmap <LEADER>fs :w<CR>
nmap <LEADER>fS :wa<CR>
nmap <LEADER>ft :NERDTreeToggle<CR>
nmap <LEADER>gb :Gblame<CR>
nmap <LEADER>gd :Gdiff<CR>
nmap <LEADER>gs :Gstatus<CR>
nmap <LEADER>j= mzgg=G`z
nmap <LEADER>pf :CtrlPRoot<CR>
nmap <LEADER>pt :call spacemacs#toggleExplorerAtRoot()<CR>
nmap <LEADER>qq :qa<CR>
nmap <LEADER>qQ :qa!<CR>
nmap <LEADER>qs :xa<CR>
nmap <LEADER>sc :noh<CR>
nmap <LEADER>sp :Ag<SPACE>
nmap <LEADER>tn :set number!<CR>
nmap <LEADER>tl :set wrap!<CR>
nmap <LEADER>Td :GitGutterToggle<CR>
nmap <LEADER>w- :sp<CR>
nmap <LEADER>w/ :vsp<CR>
nmap <LEADER>w= <C-W>=
nmap <LEADER>wc :q<CR>
nmap <LEADER>wh <C-W>h
nmap <LEADER>wj <C-W>j
nmap <LEADER>wk <C-W>k
nmap <LEADER>wl <C-W>l
nmap <LEADER>ws <C-W>s
nmap <LEADER>wv <C-W>v
nmap <LEADER>wm :MaximizerToggle<CR>
nmap <LEADER>ww <C-W><C-W>
nmap <LEADER>y <Plug>(easymotion-bd-jk)
