" markdown filetype file

if exists("did\_load\_filetypes")

 finish

endif

augroup markdown

    au! BufRead,BufNewFile *.mkd        setfiletype mkd
    au! BufRead,BufNewFile *.md         setfiletype mkd
    au! BufRead,BufNewFile *.markdown   setfiletype mkd

augroup END

" RDF Notation 3 Syntax
augroup filetypedetect
au BufNewFile,BufRead *.n3  setfiletype n3
au BufNewFile,BufRead *.ttl  setfiletype n3
augroup END
