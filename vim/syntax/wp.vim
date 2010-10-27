" Vim syntax file for Wikipedia (and other MediaWiki sites)
" * enhanced with folding for sections
" Written by Attila Nagy, 2006
" 
" Known problems:
" * italic and bold texts are always black
" ** fixed for section headers, where they were most annoying (isn't there a
" better way?)

syn clear
hi clear

syn match 	wpBasicText 	"[^]'\[^=]\+" transparent
syn match 	wpBoldText 	"'''[^]'\[^=]\+'''" 
syn match 	wpItalicText 	"''[^]'\[^=]\+''" 
syn cluster 	wpFormattedText 	contains=wpBasicText,wpBoldText,wpItalicText
syn region 	wpLink	 	start="\[\[" end="\]\]" contains=@wpFormattedText oneline
syn cluster 	wpWikiText 	contains=@wpFormattedText,wpLink
syn match 	wpBoldTextH 	"'''[^]'\[^=]\+'''" contained
syn match 	wpItalicTextH 	"''[^]'\[^=]\+''" contained
syn cluster 	wpFormattedTextH 	contains=wpBasicText,wpBoldTextH,wpItalicTextH 
syn region 	wpLinkH 	start="\[\[" end="\]\]" contains=@wpFormattedTextH oneline
syn cluster 	wpWikiTextH 	contains=@wpFormattedTextH,wpLinkH
syn region 	wpNoWiki 	start="<nowiki>" end="</nowiki>"
syn region 	wpHtml 		start="<..\{-}>" end="</..\{-}>"
syn cluster 	wpText 		contains=@wpWikiText,wpNoWiki,wpHtml
syn cluster 	wpTextH 	contains=@wpWikiTextH,wpNoWiki,wpHtml
syn match 	wpCodeLine 	"^\s.*$"hs=s+1 
syn match 	wpListLine 	"^[\*#]\+.\+$" contains=@wpText
syn region 	wpHeader 	start="^==" end="==\s*$" contains=@wpTextH oneline
syn cluster 	wpBodyElements 	contains=@wpText,wpCodeLine,wpListLine,wpHeader
syn region 	wpH2 		start="^==[^=]*==\s*$" end="==[^=]*==\s*$\&^"me=e-1 contains=@wpBodyElements,wpH3 fold keepend
syn region 	wpH3 		start="^===[^=]*===\s*$" end="===[^=]*===\s*$\&^"me=e-1 contains=@wpBodyElements,wpH4 fold keepend
syn region 	wpH4 		start="^====[^=]*====\s*$" end="====[^=]*====\s*$\&^"me=e-1 contains=@wpBodyElements,wpH5 fold keepend
syn region 	wpH5 		start="^=====[^=]*=====\s*$" end="=====[^=]*=====\s*$\&^"me=e-1 contains=@wpBodyElements fold keepend

hi wpHeader 	guifg=blue ctermfg=blue
hi wpLink 	guifg=darkgreen ctermfg=green
hi wpItalicText gui=italic guifg=NONE ctermfg=yellow
hi wpBoldText 	gui=bold guifg=NONE cterm=bold ctermfg=NONE
hi wpItalicTextH gui=italic guifg=blue ctermfg=yellow
hi wpBoldTextH 	gui=bold guifg=blue cterm=bold ctermfg=blue
"hi wpListLine	guifg=red ctermfg=red
hi wpCodeLine 	guibg=grey guifg=black ctermbg=grey ctermfg=black

set foldmethod=syntax
set linebreak

