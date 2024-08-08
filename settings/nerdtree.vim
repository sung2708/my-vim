nnoremap <silent> <C-\> :NERDTreeFocus<CR>
nnoremap <silent> <F5> :NERDTreeToggle<CR>
nnoremap <silent> <C-f> :NERDTreeFind<CR>	

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p    

" Change the default arrows
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Git status icon
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

" Open file, then sync directory that contains that file 
if has('win32')
    autocmd BufEnter * lcd %:p:h
endif

" Ignore some type of files: 
let NERDTreeIgnore=['__pycache__', 'site-packages']
