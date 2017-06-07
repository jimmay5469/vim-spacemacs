"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let s:bindingGroups = {
  \ 'vim': {
    \ 'nmap': {
      \ '<TAB>': '<C-^>',
      \ 'bb': ':buffers<CR>',
      \ 'bd': ':bdelete<CR>',
      \ 'bn': ':bn<CR>',
      \ 'bp': ':bp<CR>',
      \ 'bR': ':e<CR>',
      \ 'en': ':lnext<CR>',
      \ 'ep': ':lprev<CR>',
      \ 'fed': ':e ~/.vimrc<CR>',
      \ 'feR': ':source ~/.vimrc<CR>',
      \ 'fs': ':w<CR>',
      \ 'fS': ':wa<CR>',
      \ 'j=': 'mzgg=G`z',
      \ 'qq': ':qa<CR>',
      \ 'qQ': ':qa!<CR>',
      \ 'qs': ':xa<CR>',
      \ 'sc': ':noh<CR>',
      \ 'tn': ':set number!<CR>',
      \ 'tl': ':set wrap!<CR>',
      \ 'w-': ':sp<CR>',
      \ 'w/': ':vsp<CR>',
      \ 'w=': '<C-W>=',
      \ 'wd': ':q<CR>',
      \ 'wh': '<C-W>h',
      \ 'wj': '<C-W>j',
      \ 'wk': '<C-W>k',
      \ 'wl': '<C-W>l',
      \ 'ws': '<C-W>s',
      \ 'wv': '<C-W>v',
      \ 'ww': '<C-W><C-W>',
    \ },
  \ },
  \ 'airblade/vim-gitgutter': {
    \ 'nmap': {
      \ 'Td': ':GitGutterToggle<CR>',
    \ },
  \ },
  \ 'easymotion/vim-easymotion': {
    \ 'nmap': {
      \ 'y': '<Plug>(easymotion-bd-jk)',
    \ },
  \ },
  \ 'kien/ctrlp.vim': {
    \ 'nmap': {
      \ 'ff': ':CtrlPCurFile<CR>',
      \ 'fr': ':CtrlPMRU<CR>',
      \ 'pf': ':CtrlPRoot<CR>',
    \ },
  \ },
  \ 'mbbill/undotree': {
    \ 'nmap': {
      \ 'au': ':UndotreeToggle<CR>',
    \ },
  \ },
  \ 'rking/ag.vim': {
    \ 'nmap': {
      \ 'sp': ':Ag<SPACE>',
    \ },
  \ },
  \ 'scrooloose/nerdtree': {
    \ 'nmap': {
      \ 'ft': ':NERDTreeToggle<CR>',
    \ },
  \ },
  \ 'shougo/unite.vim': {
    \ 'nmap': {
      \ '?': ':Unite output:nmap\ \<LEADER\><CR>',
    \ },
  \ },
  \ 'szw/vim-maximizer': {
    \ 'nmap': {
      \ 'wm': ':MaximizerToggle<CR>',
    \ },
  \ },
  \ 'tpope/vim-commentary': {
    \ 'nmap': {
      \ ';': ' <Plug>Commentary',
      \ ';;': '<Plug>CommentaryLine',
    \ },
    \ 'vmap': {
      \ ';': ' <Plug>Commentary',
    \ },
    \ 'omap': {
      \ ';': ' <Plug>Commentary',
    \ },
  \ },
  \ 'tpope/vim-fugitive': {
    \ 'nmap': {
      \ 'gb': ':Gblame<CR>',
      \ 'gd': ':Gdiff<CR>',
      \ 'gs': ':Gstatus<CR>',
    \ },
  \ },
\ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Global Variable Defaults
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if !exists('g:spacemacs#leader')
  let g:spacemacs#leader = '<LEADER>'
endif
if !exists('g:spacemacs#bindingGroups')
  let g:spacemacs#bindingGroups = [
    \ 'vim',
    \ 'airblade/vim-gitgutter',
    \ 'easymotion/vim-easymotion',
    \ 'kien/ctrlp.vim',
    \ 'mbbill/undotree',
    \ 'rking/ag.vim',
    \ 'scrooloose/nerdtree',
    \ 'shougo/unite.vim',
    \ 'szw/vim-maximizer',
    \ 'tpope/vim-commentary',
    \ 'tpope/vim-fugitive',
  \ ]
endif
if !exists('g:spacemacs#bindingOverrides')
  let g:spacemacs#bindingOverrides = {}
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! s:mergeBindings(baseBindings, mergeBindings) abort
  for maptype in keys(a:mergeBindings)
    if !has_key(a:baseBindings, maptype)
      let a:baseBindings[maptype] = {}
    endif

    for binding in keys(a:mergeBindings[maptype])
      let a:baseBindings[maptype][binding] = a:mergeBindings[maptype][binding]
    endfor
  endfor
  return a:baseBindings
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Merge Keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let s:bindings = {}
for group in g:spacemacs#bindingGroups
  if has_key(s:bindingGroups, group)
    let s:bindings = s:mergeBindings(s:bindings, s:bindingGroups[group])
  endif
endfor
let s:bindings = s:mergeBindings(s:bindings, g:spacemacs#bindingOverrides)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Create Keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

for maptype in keys(s:bindings)
  for binding in keys(s:bindings[maptype])
    execute maptype . ' ' . g:spacemacs#leader .  binding . ' ' . s:bindings[maptype][binding]
  endfor
endfor
