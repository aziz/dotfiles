" Vim color file
" Converted from Textmate theme PlasticCodeWrap using Coloration v0.2.1 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "PlasticCodeWrap"

hi Cursor  guifg=NONE guibg=#8ba7a7 gui=NONE
hi Visual  guifg=NONE guibg=#687b83 gui=NONE
hi CursorLine  guifg=NONE guibg=#172228 gui=NONE
hi CursorColumn  guifg=NONE guibg=#172228 gui=NONE
hi LineNr  guifg=#82878b guibg=#0b161d gui=NONE
hi VertSplit  guifg=#394248 guibg=#394248 gui=NONE
hi MatchParen  guifg=#ffaa00 guibg=NONE gui=bold
hi StatusLine  guifg=#f8f8f8 guibg=#394248 gui=bold
hi StatusLineNC  guifg=#f8f8f8 guibg=#394248 gui=NONE
hi Pmenu  guifg=#efe900 guibg=NONE gui=bold
hi PmenuSel  guifg=NONE guibg=#687b83 gui=NONE
hi IncSearch  guifg=NONE guibg=#5a422c gui=NONE
hi Search  guifg=NONE guibg=#5a422c gui=NONE
hi Directory  guifg=#ff3a83 guibg=NONE gui=NONE
hi Folded  guifg=#1e9ae0 guibg=#0b161d gui=NONE

hi Normal  guifg=#f8f8f8 guibg=#0b161d gui=NONE
hi Boolean  guifg=#ff3a83 guibg=NONE gui=NONE
hi Character  guifg=#ff3a83 guibg=NONE gui=NONE
hi Comment  guifg=#1e9ae0 guibg=NONE gui=italic
hi Conditional  guifg=#ffaa00 guibg=NONE gui=bold
hi Constant  guifg=#ff3a83 guibg=NONE gui=NONE
hi Define  guifg=#ffaa00 guibg=NONE gui=bold
hi ErrorMsg  guifg=#f8f8f8 guibg=#a32411 gui=NONE
hi WarningMsg  guifg=#f8f8f8 guibg=#a32411 gui=NONE
hi Float  guifg=#ff3a83 guibg=NONE gui=NONE
hi Function  guifg=#efe900 guibg=NONE gui=bold
hi Identifier  guifg=#f6f080 guibg=NONE gui=NONE
hi Keyword  guifg=#ffaa00 guibg=NONE gui=bold
hi Label  guifg=#55e439 guibg=NONE gui=NONE
hi NonText  guifg=#0f1d24 guibg=#172228 gui=NONE
hi Number  guifg=#ff3a83 guibg=NONE gui=NONE
hi Operator  guifg=#ffaa00 guibg=NONE gui=bold
hi PreProc  guifg=#ffaa00 guibg=NONE gui=bold
hi Special  guifg=#f8f8f8 guibg=NONE gui=NONE
hi SpecialKey  guifg=#0f1d24 guibg=#172228 gui=NONE
hi Statement  guifg=#ffaa00 guibg=NONE gui=bold
hi StorageClass  guifg=#f6f080 guibg=NONE gui=NONE
hi String  guifg=#55e439 guibg=NONE gui=NONE
hi Tag  guifg=#efe900 guibg=NONE gui=bold
hi Title  guifg=#f8f8f8 guibg=NONE gui=bold
hi Todo  guifg=#1e9ae0 guibg=NONE gui=inverse,bold,italic
hi Type  guifg=#efe900 guibg=NONE gui=bold
hi Underlined  guifg=NONE guibg=NONE gui=underline
hi rubyClass  guifg=#ffaa00 guibg=NONE gui=bold
hi rubyFunction  guifg=#efe900 guibg=NONE gui=bold
hi rubyInterpolationDelimiter  guifg=NONE guibg=NONE gui=NONE
hi rubySymbol  guifg=#ff3a83 guibg=NONE gui=NONE
hi rubyConstant  guifg=#9df39f guibg=NONE gui=NONE
hi rubyStringDelimiter  guifg=#55e439 guibg=NONE gui=NONE
hi rubyBlockParameter  guifg=#fb9a4b guibg=NONE gui=NONE
hi rubyInstanceVariable  guifg=#fb9a4b guibg=NONE gui=NONE
hi rubyInclude  guifg=#ffaa00 guibg=NONE gui=bold
hi rubyGlobalVariable  guifg=#fb9a4b guibg=NONE gui=NONE
hi rubyRegexp  guifg=#ffb454 guibg=NONE gui=NONE
hi rubyRegexpDelimiter  guifg=#ffb454 guibg=NONE gui=NONE
hi rubyEscape  guifg=#ff3a83 guibg=NONE gui=NONE
hi rubyControl  guifg=#ffaa00 guibg=NONE gui=bold
hi rubyClassVariable  guifg=#fb9a4b guibg=NONE gui=NONE
hi rubyOperator  guifg=#ffaa00 guibg=NONE gui=bold
hi rubyException  guifg=#ffaa00 guibg=NONE gui=bold
hi rubyPseudoVariable  guifg=#fb9a4b guibg=NONE gui=NONE
hi rubyRailsUserClass  guifg=#9df39f guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod  guifg=#ffb454 guibg=NONE gui=NONE
hi rubyRailsARMethod  guifg=#ffb454 guibg=NONE gui=NONE
hi rubyRailsRenderMethod  guifg=#ffb454 guibg=NONE gui=NONE
hi rubyRailsMethod  guifg=#ffb454 guibg=NONE gui=NONE
hi erubyDelimiter  guifg=NONE guibg=NONE gui=NONE
hi erubyComment  guifg=#1e9ae0 guibg=NONE gui=italic
hi erubyRailsMethod  guifg=#ffb454 guibg=NONE gui=NONE
hi htmlTag  guifg=#9effff guibg=NONE gui=NONE
hi htmlEndTag  guifg=#9effff guibg=NONE gui=NONE
hi htmlTagName  guifg=#9effff guibg=NONE gui=NONE
hi htmlArg  guifg=#9effff guibg=NONE gui=NONE
hi htmlSpecialChar  guifg=#ff3a83 guibg=NONE gui=NONE
hi javaScriptFunction  guifg=#f6f080 guibg=NONE gui=NONE
hi javaScriptRailsFunction  guifg=#ffb454 guibg=NONE gui=NONE
hi javaScriptBraces  guifg=NONE guibg=NONE gui=NONE
hi yamlKey  guifg=#efe900 guibg=NONE gui=bold
hi yamlAnchor  guifg=#fb9a4b guibg=NONE gui=NONE
hi yamlAlias  guifg=#fb9a4b guibg=NONE gui=NONE
hi yamlDocumentHeader  guifg=#55e439 guibg=NONE gui=NONE
hi cssURL  guifg=#fb9a4b guibg=NONE gui=NONE
hi cssFunctionName  guifg=#ffb454 guibg=NONE gui=NONE
hi cssColor  guifg=#ff3a83 guibg=NONE gui=NONE
hi cssPseudoClassId  guifg=#efe900 guibg=NONE gui=bold
hi cssClassName  guifg=#efe900 guibg=NONE gui=bold
hi cssValueLength  guifg=#ff3a83 guibg=NONE gui=NONE
hi cssCommonAttr  guifg=#eb939a guibg=NONE gui=NONE
hi cssBraces  guifg=NONE guibg=NONE gui=NONE