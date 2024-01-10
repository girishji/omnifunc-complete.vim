> [!CAUTION]
> THIS PLUGIN IS NO LONGER NEEDED.
> The functionality is already merged into [vimcomplete](https://github.com/girishji/vimcomplete).

------
------


#### Omnifunc Autocompletion Source for Vimcomplete Plugin

This plugin sources autocompletion items emitted by the function set in `omnifunc` Vim variable, for
[Vimcomplete](https://github.com/girishji/vimcomplete) autocompletion plugin.

Vim provides language based autocompletion through Omni completion for many
languages (see `$VIMRUNTIME/autoload`). This is a lightweight alternative to using LSP.

| __Vim File__  | __Language__  |
|---|---|
|ccomplete.vim|C|
|csscomplete.vim|HTML / CSS|
|htmlcomplete.vim|HTML|
|javascriptcomplete.vim|Javascript|
|phpcomplete.vim|PHP|
|pythoncomplete.vim|Python|
|rubycomplete.vim|Ruby|
|syntaxcomplete.vim|from syntax highlighting|
|xmlcomplete.vim|XML (uses files in the xml directory)|

These `omnifunc` functions are set automatically when file type is detected.
User does not have to do anything.

In addition, any user defined `omnifunc` can also be used for autocompletion.

**Note:** If you are using [LSP extension](https://github.com/girishji/lsp-complete.vim),
it should be disabled.

# Requirements

- Vim >= 9.0
- [Vimcomplete](https://github.com/girishji/vimcomplete)

# Installation

Install this plugin after installing [Vimcomplete](https://github.com/girishji/vimcomplete).

Install using [vim-plug](https://github.com/junegunn/vim-plug).

```
vim9script
plug#begin()
Plug 'girishji/omnifunc-complete.vim'
plug#end()
```

For those who prefer legacy script.

```
call plug#begin()
Plug 'girishji/omnifunc-complete.vim'
call plug#end()
```

Or use Vim's builtin package manager.

# Configuration

Default options are as follows.

```
vim9script
export var options: dict<any> = {
    enable: true,    # 'false' to disable this extension
    priority: 8,     # Higher priority items are shown at the top
    maxCount: 10,    # Maximum number of items shown
    filetypes: ['python', 'javascript'], # Any filetype that has 'omnifunc' set
    dup: true,       # `true` allows duplicate completion words
    partialWord: ['python3complete#Complete'], # python3complete returns
                        # partial words like 'ow()' instead of 'pow()'
}
```

Note: Only python3complete and javascriptcomplete are tested.

Options can be modified using `g:VimCompleteOptionsSet()`. It takes a
dictionary as argument. If you are using
[vim-plug](https://github.com/junegunn/vim-plug) then call this function through
__VimEnter__ autocommand event.

```
autocmd VimEnter * g:VimCompleteOptionsSet(options)
```
