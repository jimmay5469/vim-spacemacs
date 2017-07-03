"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Native Key Bindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let s:nativeKeyBindings = {
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
" Plugin Key Bindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let s:pluginKeyBindings = {}
let s:pluginKeyBindings['airblade/vim-gitgutter'] = {
  \ 'nnoremap': {
    \ 'Td': ':GitGutterToggle<CR>',
  \ },
\ }
let s:pluginKeyBindings['easymotion/vim-easymotion'] = {
  \ 'nmap': {
    \ 'y': '<Plug>(easymotion-bd-jk)',
  \ },
\ }
let s:pluginKeyBindings['kien/ctrlp.vim'] = {
  \ 'nnoremap': {
    \ 'ff': ':CtrlPCurFile<CR>',
    \ 'fr': ':CtrlPMRU<CR>',
    \ 'pf': ':CtrlPRoot<CR>',
  \ },
\ }
let s:pluginKeyBindings['junegunn/fzf.vim'] = {
  \ 'nnoremap': {
    \ '?': ':Maps<CR>',
    \ 'bb': ':Buffers<CR>',
    \ 'gfh': ':BCommits<CR>',
    \ 'gs': ':GFiles?<CR>',
    \ 'pf': ':GFiles<CR>',
    \ 'sp': ':Ag<CR>',
  \ },
\ }
let s:pluginKeyBindings['mbbill/undotree'] = {
  \ 'nnoremap': {
    \ 'au': ':UndotreeToggle<CR>',
  \ },
\ }
let s:pluginKeyBindings['rking/ag.vim'] = {
  \ 'nnoremap': {
    \ 'sp': ':Ag<SPACE>',
  \ },
\ }
let s:pluginKeyBindings['scrooloose/nerdtree'] = {
  \ 'nnoremap': {
    \ 'ft': ':NERDTreeToggle<CR>',
  \ },
\ }
let s:pluginKeyBindings['shougo/unite.vim'] = {
  \ 'nmap': {
    \ '?': ':Unite output:nmap\ \<LEADER\><CR>',
  \ },
\ }
let s:pluginKeyBindings['szw/vim-maximizer'] = {
  \ 'nnoremap': {
    \ 'wm': ':MaximizerToggle<CR>',
  \ },
\ }
let s:pluginKeyBindings['tpope/vim-commentary'] = {
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
\ }
let s:pluginKeyBindings['tpope/vim-fugitive'] = {
  \ 'nnoremap': {
    \ 'gb': ':Gblame<CR>',
    \ 'gd': ':Gdiff<CR>',
    \ 'gs': ':Gstatus<CR>',
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
if !exists('g:spacemacs#excludes')
  let g:spacemacs#excludes = []
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! s:mergeKeyBindings(baseKeyBindings, mergeKeyBindings) abort
  for mapType in keys(a:mergeKeyBindings)
    if !has_key(a:baseKeyBindings, mapType)
      let a:baseKeyBindings[mapType] = {}
    endif

    for keyBinding in keys(a:mergeKeyBindings[mapType])
      let a:baseKeyBindings[mapType][keyBinding] = a:mergeKeyBindings[mapType][keyBinding]
    endfor
  endfor
  return a:baseKeyBindings
endfunction

function! s:excludeKeyBindingPattern(baseKeyBindings, pattern) abort
  for mapType in keys(a:baseKeyBindings)
    for keyBinding in keys(a:baseKeyBindings[mapType])
      if keyBinding =~ a:pattern
        unlet a:baseKeyBindings[mapType][keyBinding]
      endif
    endfor
  endfor
  return a:baseKeyBindings
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Wireup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Merge Key Bindings
let s:keyBindings = {}
let s:keyBindings = s:mergeKeyBindings(s:keyBindings, s:nativeKeyBindings)
for plugin in g:spacemacs#plugins
  if has_key(s:pluginKeyBindings, plugin)
    let s:keyBindings = s:mergeKeyBindings(s:keyBindings, s:pluginKeyBindings[plugin])
  endif
endfor

" Removing Excludes
for pattern in spacemacs#excludes
  let s:keyBindings = s:excludeKeyBindingPattern(s:keyBindings, pattern)
endfor

" Create Key Bindings
for mapType in keys(s:keyBindings)
  for keyBinding in keys(s:keyBindings[mapType])
    execute mapType . ' ' . g:spacemacs#leader .  keyBinding . ' ' . s:keyBindings[mapType][keyBinding]
  endfor
endfor
