function! Reload(module_name) abort
" lua << EOF
"     for k in pairs(package.loaded) do 
"         if k:match("^learn-nvim") then
"             package.loaded[k] = nil
"         end
"     end
" EOF
    let b:module_name = a:module_name
    lua for k in pairs(package.loaded) do if k:match("^" .. vim.b.module_name) then package.loaded[k] = nil end end
    lua require("learn-nvim")
endfunction

augroup LearnNvimAuGrp
    autocmd!
augroup END


" Reload the plugin
nnoremap <Leader>prr :call Reload("learn-nvim") <CR>
