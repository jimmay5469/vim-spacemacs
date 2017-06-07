"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Native Keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:nativeKeybindings = {
  \ 'nnoremap': {
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
\ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let s:pluginKeybindings = {
  \ 'airblade/vim-gitgutter': {
    \ 'nnoremap': {
      \ 'Td': ':GitGutterToggle<CR>',
    \ },
  \ },
  \ 'easymotion/vim-easymotion': {
    \ 'nmap': {
      \ 'y': '<Plug>(easymotion-bd-jk)',
    \ },
  \ },
  \ 'kien/ctrlp.vim': {
    \ 'nnoremap': {
      \ 'ff': ':CtrlPCurFile<CR>',
      \ 'fr': ':CtrlPMRU<CR>',
      \ 'pf': ':CtrlPRoot<CR>',
    \ },
  \ },
  \ 'mbbill/undotree': {
    \ 'nnoremap': {
      \ 'au': ':UndotreeToggle<CR>',
    \ },
  \ },
  \ 'rking/ag.vim': {
    \ 'nnoremap': {
      \ 'sp': ':Ag<SPACE>',
    \ },
  \ },
  \ 'scrooloose/nerdtree': {
    \ 'nnoremap': {
      \ 'ft': ':NERDTreeToggle<CR>',
    \ },
  \ },
  \ 'shougo/unite.vim': {
    \ 'nmap': {
      \ '?': ':Unite output:nmap\ \<LEADER\><CR>',
    \ },
  \ },
  \ 'szw/vim-maximizer': {
    \ 'nnoremap': {
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
    \ 'nnoremap': {
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
if !exists('g:spacemacs#plugins')
  let g:spacemacs#plugins = [
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
if !exists('g:spacemacs#keybindingOverrides')
  let g:spacemacs#keybindingOverrides = {}
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! s:mergeKeybindings(baseKeybindings, mergeKeybindings) abort
  for maptype in keys(a:mergeKeybindings)
    if !has_key(a:baseKeybindings, maptype)
      let a:baseKeybindings[maptype] = {}
    endif

    for keybinding in keys(a:mergeKeybindings[maptype])
      let a:baseKeybindings[maptype][keybinding] = a:mergeKeybindings[maptype][keybinding]
    endfor
  endfor
  return a:baseKeybindings
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Merge Keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let s:keybindings = {}
let s:keybindings = s:mergeKeybindings(s:keybindings, s:nativeKeybindings)
for plugin in g:spacemacs#plugins
  if has_key(s:pluginKeybindings, plugin)
    let s:keybindings = s:mergeKeybindings(s:keybindings, s:pluginKeybindings[plugin])
  endif
endfor
let s:keybindings = s:mergeKeybindings(s:keybindings, g:spacemacs#keybindingOverrides)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Create Keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

for maptype in keys(s:keybindings)
  for keybinding in keys(s:keybindings[maptype])
    execute maptype . ' ' . g:spacemacs#leader .  keybinding . ' ' . s:keybindings[maptype][keybinding]
  endfor
endfor
