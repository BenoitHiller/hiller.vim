My personal vim colorscheme. This is heavily based off of [twerth/ir_black](https://github.com/twerth/ir_black/), which I have been tweaking to suit my needs.

Named after my last name because naming is hard.

## Usage

You can install the colorscheme with any vim package manager by pointing it at this repo. So for vim-plug you would put the following in your `.vimrc`:

```vim
Plug 'BenoitHiller/hiller.vim'
```

Then you pick the colorscheme by putting the following line in your `.vimrc`. I recommend putting it below the package manager block to ensure it is actually available.

```vim
colorscheme hiller
```

The colorscheme is designed around my terminal color palette. You can get a modern vim to use my colors by simply making sure the following is set in your `.vimrc`. Note that neovim will do this by default.

```vim
set termguicolors
```

If you want the colors globally in your terminal, or are using a fairly old version of vim, you can grab them from the top of [colors/hiller.vim](colors/hiller.vim).

## Notes

This colorscheme is entirely using a 16 color palette. There might still be some default styles using 256 colors that I didn't override here, but that probably means they match decently well.
