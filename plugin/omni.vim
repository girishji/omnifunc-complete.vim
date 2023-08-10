if !has('vim9script') ||  v:version < 900
    " Needs Vim version 9.0 and above
    finish
endif

vim9script

import 'vimcompletor.vim'
import autoload '../autoload/omnicomplete.vim' as complete

def Register()
    var o = complete.options
    if !o->has_key('enable') || o.enable
	var ftypes = o->get('filetypes', ['python', 'javascript'])
	vimcompletor.Register('omnifunc', complete.Completor, ftypes, o->get('priority', 8))
    else
	vimcompletor.Unregister('omnifunc')
    endif
enddef

autocmd User VimCompleteLoaded ++once Register()

def OptionsChanged()
    var opts = vimcompletor.GetOptions('omnifunc')
    if !opts->empty()
	complete.options->extend(opts)
	Register()
    endif
enddef

autocmd User VimCompleteOptionsChanged ++once OptionsChanged()
