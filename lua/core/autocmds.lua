-- uncomment this if you want to open nvim with a dir
-- vim.cmd [[ autocmd BufEnter * if &buftype != "terminal" | lcd %:p:h | endif ]]
-- Use relative & absolute line numbers in 'n' & 'i' modes respectively
-- vim.cmd([[ au InsertLeave * set relativenumber ]])
-- vim.cmd([[ au InsertEnter * set norelativenumber ]])
-- Don't show any numbers inside terminals
-- vim.cmd([[ au TermOpen term://* setlocal nonumber norelativenumber | setfiletype terminal ]])
-- Don't show status line on certain windows
-- vim.cmd([[ autocmd BufEnter,BufRead,BufWinEnter,FileType,WinEnter * lua require("core.utils").hide_statusline() ]])
-- Open a file from its last left off position
-- vim.cmd [[ au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif ]]
-- File extension specific tabbing
vim.cmd([[ 
  autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4 ]])

-- ScrollbarInit
vim.cmd([[
  augroup ScrollbarInit
    autocmd!
    autocmd WinScrolled,VimResized,QuitPre * silent! lua require('scrollbar').show()
    autocmd WinEnter,FocusGained           * silent! lua require('scrollbar').show()
    autocmd WinLeave,BufLeave,BufWinLeave,FocusLost            * silent! lua require('scrollbar').clear()
  augroup end ]])

-- foldy
vim.cmd([[
  filetype plugin indent on 
  syntax on                
  " activate anyfold by default
  augroup anyfold
  autocmd!
    autocmd Filetype html,css,python,cpp,rust,lua,go,javascript AnyFoldActivate
    autocmd Filetype rust set foldignore=#/
    autocmd Filetype lua set foldignore=--
    set foldlevel=0 
  augroup END

  " disable anyfold for large files
  let g:LargeFile = 1000000 " file is large if size greater than 1MB
  autocmd BufReadPre,BufRead * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
  function LargeFile()
  augroup anyfold
    autocmd! " remove AnyFoldActivate
    autocmd Filetype <filetype> setlocal foldmethod=indent " fall back to indent folding
    augroup END
  endfunction
  ]])

-- general settings
vim.cmd([[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end

  augroup _lsp
    autocmd!
    autocmd BufWritePre * lua vim.lsp.buf.formatting()
  augroup end
]])

-- Autoformat
