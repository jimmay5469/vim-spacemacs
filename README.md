# spacemacs.vim #

Spacemacs key bindings ported to Vim.

Please open an issue or create a pull request if there is a Spacemacs key binding or plugin specific key binding that you use which is not included.


## Installation ##

Using Plug:

```
Plug 'jimmay5469/vim-spacemacs'
```

Using Vundle:

```
Plugin 'jimmay5469/vim-spacemacs'
```

### Leader Key ###

By default this plugin uses whatever leader key you have set up. If you like Spacemacs and you aren't already using `<SPACE>` as your leader key, then you can set it in your `.vimrc` using the following:

```
let mapleader = "\<SPACE>"
```

You can also use `<SPACE>` just for this plugin without changing your leader key:

```
let g:spacemacs#leader = '<SPACE>'
```

## Enable Plugin Specific Key Bindings ##

There are currently key bindings for the following plugins:

```
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
```

Pick and choose based on which plugins you have installed. If there are duplicate key bindings across plugins the last one in this list will win.

Again: please open an issue or create a pull request if there is a Spacemacs key binding or plugin specific key binding that you use which is not included.


## Exclude/Overwrite Key Binding Patterns ##

If you would like to customize or disable key bindings simply provide a list of regex patterns to exclude:

```
let g:spacemacs#excludes = [
  \ '^b',
  \ '^fs',
\ ]
nnoremap <LEADER>fs :wa<CR>
```


## Using vim-leader-guide For Discoverability ##

If you would like a key binding guide like in Spacemacs, [hecal3/vim-leader-guide](https://github.com/hecal3/vim-leader-guide) should work fine. All you need to do is install it and it will pick up the key bindings from this plugin.

```
Plug 'hecal3/vim-leader-guide'
```

```
nnoremap <silent> <LEADER> :<C-U>LeaderGuide '<SPACE>'<CR>
vnoremap <silent> <LEADER> :<C-U>LeaderGuideVisual '<SPACE>'<CR>
```

I am considering adding a dictionary of group names and descriptions that you can use if desired.


## Footnotes ##

![I don't always use Vim, but when I do I use Spacemacs key bindings](http://i.imgur.com/BlgbKnM.jpg)
