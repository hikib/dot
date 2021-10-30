fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

augroup MY_AUTOCMDS
  autocmd BufWinEnter,BufNewFile,BufRead *.md set filetype=markdown
  autocmd BufNewFile,BufRead *.{yaml,yml} set filetype=yaml
  autocmd BufWritePre * :call TrimWhitespace()
  autocmd CompleteDone * silent! pclose!
augroup END

" Snip() & PasteSnip() depend on Vim 8.2+
" because of the popup menu(!)
fun! Snip()
  let l:snips = systemlist("snip ls")
  let choice =  popup_menu( snips, #{
        \ title: "Snips:",
        \ pos: "center",
        \ callback: "PasteSnip",
        \ border: [],
        \ padding: [0,1,0,1]} )
endfunction
fun! PasteSnip(id, result)
  let l:line = line(".")
  let l:snipName =  systemlist("snip ls")[a:result - 1]
  let l:cmd = join(["snip get", snipName], " ")
  call append(line, systemlist(cmd))
endfunction
