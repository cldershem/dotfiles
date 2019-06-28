if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  au BufNewFile,BufRead Justfile,justfile setf make
augroup END
