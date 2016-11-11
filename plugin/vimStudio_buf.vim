if exists("g:vimStudio_buf_init")
	if g:vimStudio_buf_init == 1
		finish
	endif
endif

let g:vimStudio_buf_init = 1

"-------------------------------------------------------------------------

function! vimStudio_buf#on_tab_leave()
	if vimStudio#wnd#switch_to_wnd("mask") == 1
		mkview
	endif
	return 1
endfunction

function! vimStudio_buf#on_buf_enter()
	loadview
	return 1
endfunction

"-------------------------------------------------------------------------

function! vimStudio_buf#on_maskpanel_before_refresh()
	"o!
	"echom 'mkview - vimStudio_buf#on_maskpanel_before_refresh - ' . bufname('%')
	"mkview
	return 1
endfunction

function! vimStudio_buf#on_maskpanel_after_refresh()
	loadview
	
	hi IndentGuidesOdd guibg=#E6E6E6 guifg=#cbcbcb
	hi IndentGuidesEven guibg=#F2F2F2 guifg=#dbdbdb
	IndentGuidesEnable
	
	return 1
endfunction

"-------------------------------------------------------------------------

call vimStudio#integration#register_module("vimStudio_buf")
