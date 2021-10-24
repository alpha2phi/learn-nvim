if exists('g:loaded_learn_nvim') | finish | endif 

let s:save_cpo = &cpo 
set cpo&vim          

" command to run our plugin
" command! XXX lua require("learn-nvim.popup").xxx
" command! -nargs=* XXX lua require'abc':xxx(false, [[<args>]])

" expose vim commands and interface here
" nnoremap <Plug>PlugCommand :lua require(...).plug_command()<CR>

let &cpo = s:save_cpo 
unlet s:save_cpo

let g:loaded_learn_nvim= 1
