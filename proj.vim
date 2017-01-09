
let g:projectvim="proj.vim"

function! PdfPreview()
	if filereadable(glob("./geom-computing.pdf"))
		call system("evince ".glob("./geom-computing.pdf"." &"))
	endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader><F5> :w<CR>:!make <CR><CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""

