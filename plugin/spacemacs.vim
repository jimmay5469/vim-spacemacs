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
  \ 'unclaimed': {
    \ 'nmap': {
      \ '?': ':Unite output:nmap\ \<LEADER\><CR>',
      \ ';': ' <Plug>Commentary',
      \ ';;': '<Plug>CommentaryLine',
      \ 'au': ':UndotreeToggle<CR>',
      \ 'el': ':<C-U>call ToggleErrors()<CR>',
      \ 'ff': ':CtrlPCurFile<CR>',
      \ 'fr': ':CtrlPMRU<CR>',
      \ 'ft': ':NERDTreeToggle<CR>',
      \ 'gb': ':Gblame<CR>',
      \ 'gd': ':Gdiff<CR>',
      \ 'gs': ':Gstatus<CR>',
      \ 'pf': ':CtrlPRoot<CR>',
      \ 'pt': ':call spacemacs#toggleExplorerAtRoot()<CR>',
      \ 'sp': ':Ag<SPACE>',
      \ 'Td': ':GitGutterToggle<CR>',
      \ 'wm': ':MaximizerToggle<CR>',
      \ 'y': '<Plug>(easymotion-bd-jk)',
    \ },
    \ 'vmap': {
      \ ';': ' <Plug>Commentary',
    \ },
    \ 'omap': {
      \ ';': ' <Plug>Commentary',
    \ },
  \ },
\ }

"global variable defaults
if !exists('g:spacemacs#leader')
  let g:spacemacs#leader = '<LEADER>'
endif
if !exists('g:spacemacs#groups')
  let g:spacemacs#groups = ['vim', 'unclaimed']
endif
if !exists('g:spacemacs#bindingOverrides')
  let g:spacemacs#bindingOverrides = {}
endif

"merge bingings
let s:bindings = {}
for group in g:spacemacs#groups
  if has_key(s:bindingGroups, group)
    let s:bindings = s:mergeBindings(s:bindings, s:bindingGroups[group])
  endif
endfor
let s:bindings = s:mergeBindings(s:bindings, g:spacemacs#bindingOverrides)

"create keybindings
for maptype in keys(s:bindings)
  for binding in keys(s:bindings[maptype])
    execute maptype . ' ' . g:spacemacs#leader .  binding . ' ' . s:bindings[maptype][binding]
  endfor
endfor
