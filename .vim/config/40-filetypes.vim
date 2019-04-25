augroup filetypes
  autocmd!
  autocmd BufRead,BufNewFile *.toml set filetype=toml
  autocmd BufRead,BufNewFile *.coffee set filetype=coffee
  autocmd BufRead,BufNewFile *.t set filetype=perl
  autocmd BufRead,BufNewFile *.ts set filetype=typescript
  autocmd BufRead,BufNewFile *.dig set filetype=yaml
  autocmd BufRead,BufNewFile *yml.liquid set filetype=yaml
augroup END
