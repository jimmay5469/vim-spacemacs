"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Alphabetical and avoid <SILENT> for now.
nmap <LEADER><TAB> <C-^>
nmap <LEADER>;; :Commentary<CR>
nmap <LEADER>fed :e ~/.vimrc<CR>
nmap <LEADER>ff :CtrlPCurWD<CR>
nmap <LEADER>fr :CtrlPMRU<CR>
nmap <LEADER>fs :w<CR>
nmap <LEADER>fS :wa<CR>
nmap <LEADER>ft :NERDTreeToggle<CR>
nmap <LEADER>gb :Gblame<CR>
nmap <LEADER>gd :Gdiff<CR>
nmap <LEADER>gs :Gstatus<CR>
nmap <LEADER>pf :ProjectRootExe :CtrlPCurWD<CR>
nmap <LEADER>pt :ProjectRootExe NERDTreeToggle<CR>
nmap <LEADER>qq :qa<CR>
nmap <LEADER>sp :Ag<SPACE>
nmap <LEADER>tn :set number!<CR>
nmap <LEADER>w- :sp<CR>
nmap <LEADER>w/ :vsp<CR>
nmap <LEADER>w= <C-W>=
nmap <LEADER>wc :q<CR>
nmap <LEADER>wh <C-W>h
nmap <LEADER>wj <C-W>j
nmap <LEADER>wk <C-W>k
nmap <LEADER>wl <C-W>l
nmap <LEADER>wm :MaximizerToggle<CR>
nmap <LEADER>ww <C-W><C-W>
