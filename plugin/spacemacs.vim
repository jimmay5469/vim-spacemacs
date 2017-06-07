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

let spacemacs#defaultBindings = {
  \ 'nmap': {
    \ '<TAB>': '<C-^>',
    \ '?': ':Unite output:nmap\ \<LEADER\><CR>',
    \ ';': ' <Plug>Commentary',
    \ ';;': '<Plug>CommentaryLine',
    \ 'au': ':UndotreeToggle<CR>',
    \ 'bb': ':buffers<CR>',
    \ 'bd': ':bdelete<CR>',
    \ 'bn': ':bn<CR>',
    \ 'bp': ':bp<CR>',
    \ 'bR': ':e<CR>',
    \ 'el': ':<C-U>call ToggleErrors()<CR>',
    \ 'en': ':lnext<CR>',
    \ 'ep': ':lprev<CR>',
    \ 'fed': ':e ~/.vimrc<CR>',
    \ 'feR': ':source ~/.vimrc<CR>',
    \ 'ff': ':CtrlPCurFile<CR>',
    \ 'fr': ':CtrlPMRU<CR>',
    \ 'fs': ':w<CR>',
    \ 'fS': ':wa<CR>',
    \ 'ft': ':NERDTreeToggle<CR>',
    \ 'gb': ':Gblame<CR>',
    \ 'gd': ':Gdiff<CR>',
    \ 'gs': ':Gstatus<CR>',
    \ 'j=': 'mzgg=G`z',
    \ 'pf': ':CtrlPRoot<CR>',
    \ 'pt': ':call spacemacs#toggleExplorerAtRoot()<CR>',
    \ 'qq': ':qa<CR>',
    \ 'qQ': ':qa!<CR>',
    \ 'qs': ':xa<CR>',
    \ 'sc': ':noh<CR>',
    \ 'sp': ':Ag<SPACE>',
    \ 'tn': ':set number!<CR>',
    \ 'tl': ':set wrap!<CR>',
    \ 'Td': ':GitGutterToggle<CR>',
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
    \ 'wm': ':MaximizerToggle<CR>',
    \ 'ww': '<C-W><C-W>',
    \ 'y': '<Plug>(easymotion-bd-jk)',
  \ },
  \ 'vmap': {
    \ ';': ' <Plug>Commentary',
  \ },
  \ 'omap': {
    \ ';': ' <Plug>Commentary',
  \ },
\ }

"global variable defaults
if !exists('g:spacemacs#leader')
  let g:spacemacs#leader = '<LEADER>'
endif
if !exists('g:spacemacs#bindings')
  let g:spacemacs#bindings = {}
endif

"copy necessary default bindings
for maptype in keys(spacemacs#defaultBindings)
  if !has_key(g:spacemacs#bindings, maptype)
    let g:spacemacs#bindings[maptype] = {}
  endif

  for binding in keys(spacemacs#defaultBindings[maptype])
    if !has_key(g:spacemacs#bindings[maptype], binding)
      let g:spacemacs#bindings[maptype][binding] = spacemacs#defaultBindings[maptype][binding]
    endif
  endfor
endfor

"create keybindings
for maptype in keys(g:spacemacs#bindings)
  for binding in keys(g:spacemacs#bindings[maptype])
    execute maptype . ' ' . g:spacemacs#leader .  binding . ' ' . g:spacemacs#bindings[maptype][binding]
  endfor
endfor
