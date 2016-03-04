" Vim color file

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

set t_Co=256
let g:colors_name = "custom"

hi Cursor                       ctermfg=235  ctermbg=255  cterm=NONE
hi Visual                       ctermfg=NONE ctermbg=237  cterm=NONE
hi CursorLine                   ctermfg=NONE ctermbg=235  cterm=NONE
hi CursorLineNr                 ctermfg=255  ctermbg=237  cterm=NONE
hi CursorColumn                 ctermfg=NONE ctermbg=235  cterm=NONE
hi ColorColumn                  ctermfg=NONE ctermbg=235  cterm=NONE
hi LineNr                       ctermfg=242  ctermbg=235  cterm=NONE
hi VertSplit                    ctermfg=241  ctermbg=241  cterm=NONE
hi MatchParen                   ctermfg=81   ctermbg=NONE cterm=underline
hi StatusLine                   ctermfg=255  ctermbg=235  cterm=bold
hi StatusLineNC                 ctermfg=255  ctermbg=235  cterm=NONE
hi Pmenu                        ctermfg=242  ctermbg=235  cterm=NONE
hi PmenuSel                     ctermfg=255  ctermbg=237  cterm=NONE
hi IncSearch                    ctermfg=235  ctermbg=186  cterm=NONE
hi Search                       ctermfg=NONE ctermbg=NONE cterm=underline
hi Directory                    ctermfg=141  ctermbg=NONE cterm=NONE
hi Folded                       ctermfg=242  ctermbg=235  cterm=NONE
hi SignColumn                   ctermfg=NONE ctermbg=235  cterm=NONE
hi Normal                       ctermfg=255  ctermbg=232  cterm=NONE
hi Boolean                      ctermfg=141  ctermbg=NONE cterm=NONE
hi Character                    ctermfg=141  ctermbg=NONE cterm=NONE
hi Comment                      ctermfg=242  ctermbg=NONE cterm=NONE
hi Conditional                  ctermfg=81   ctermbg=NONE cterm=NONE
hi Constant                     ctermfg=NONE ctermbg=NONE cterm=NONE
hi Define                       ctermfg=81   ctermbg=NONE cterm=NONE
hi DiffAdd                      ctermfg=255  ctermbg=64   cterm=bold
hi DiffDelete                   ctermfg=88   ctermbg=NONE cterm=NONE
hi DiffChange                   ctermfg=NONE ctermbg=NONE cterm=NONE
hi DiffText                     ctermfg=255  ctermbg=24   cterm=bold
hi ErrorMsg                     ctermfg=1    ctermbg=NONE cterm=bold
hi WarningMsg                   ctermfg=3    ctermbg=NONE cterm=bold
hi Float                        ctermfg=141  ctermbg=NONE cterm=NONE
hi Function                     ctermfg=141  ctermbg=NONE cterm=NONE
hi Identifier                   ctermfg=81   ctermbg=NONE cterm=NONE
hi Keyword                      ctermfg=81   ctermbg=NONE cterm=NONE
hi Label                        ctermfg=185  ctermbg=NONE cterm=NONE
hi NonText                      ctermfg=59   ctermbg=232  cterm=NONE
hi Number                       ctermfg=141  ctermbg=NONE cterm=NONE
hi Operator                     ctermfg=81   ctermbg=NONE cterm=NONE
hi PreProc                      ctermfg=81   ctermbg=NONE cterm=NONE
hi Special                      ctermfg=255  ctermbg=NONE cterm=NONE
hi SpecialKey                   ctermfg=59   ctermbg=237  cterm=NONE
hi Statement                    ctermfg=81   ctermbg=NONE cterm=NONE
hi StorageClass                 ctermfg=81   ctermbg=NONE cterm=NONE
hi String                       ctermfg=185  ctermbg=NONE cterm=NONE
hi Tag                          ctermfg=81   ctermbg=NONE cterm=NONE
hi Title                        ctermfg=255  ctermbg=NONE cterm=bold
hi Todo                         ctermfg=1    ctermbg=NONE cterm=bold
hi Type                         ctermfg=NONE ctermbg=NONE cterm=NONE
hi Underlined                   ctermfg=NONE ctermbg=NONE cterm=underline
hi rubyClass                    ctermfg=81   ctermbg=NONE cterm=NONE
hi rubyFunction                 ctermfg=141  ctermbg=NONE cterm=NONE
hi rubyInterpolationDelimiter   ctermfg=NONE ctermbg=NONE cterm=NONE
hi rubySymbol                   ctermfg=141  ctermbg=NONE cterm=NONE
hi rubyConstant                 ctermfg=81   ctermbg=NONE cterm=NONE
hi rubyStringDelimiter          ctermfg=185  ctermbg=NONE cterm=NONE
hi rubyBlockParameter           ctermfg=208  ctermbg=NONE cterm=NONE
hi rubyInstanceVariable         ctermfg=NONE ctermbg=NONE cterm=NONE
hi rubyInclude                  ctermfg=81   ctermbg=NONE cterm=NONE
hi rubyGlobalVariable           ctermfg=NONE ctermbg=NONE cterm=NONE
hi rubyRegexp                   ctermfg=185  ctermbg=NONE cterm=NONE
hi rubyRegexpDelimiter          ctermfg=185  ctermbg=NONE cterm=NONE
hi rubyEscape                   ctermfg=141  ctermbg=NONE cterm=NONE
hi rubyControl                  ctermfg=81   ctermbg=NONE cterm=NONE
hi rubyClassVariable            ctermfg=NONE ctermbg=NONE cterm=NONE
hi rubyOperator                 ctermfg=81   ctermbg=NONE cterm=NONE
hi rubyException                ctermfg=81   ctermbg=NONE cterm=NONE
hi rubyPseudoVariable           ctermfg=NONE ctermbg=NONE cterm=NONE
hi rubyRailsUserClass           ctermfg=81   ctermbg=NONE cterm=NONE
hi rubyRailsARAssociationMethod ctermfg=81   ctermbg=NONE cterm=NONE
hi rubyRailsARMethod            ctermfg=81   ctermbg=NONE cterm=NONE
hi rubyRailsRenderMethod        ctermfg=81   ctermbg=NONE cterm=NONE
hi rubyRailsMethod              ctermfg=81   ctermbg=NONE cterm=NONE
hi erubyDelimiter               ctermfg=NONE ctermbg=NONE cterm=NONE
hi erubyComment                 ctermfg=95   ctermbg=NONE cterm=NONE
hi erubyRailsMethod             ctermfg=81   ctermbg=NONE cterm=NONE
hi htmlTag                      ctermfg=NONE ctermbg=NONE cterm=NONE
hi htmlEndTag                   ctermfg=NONE ctermbg=NONE cterm=NONE
hi htmlTagName                  ctermfg=NONE ctermbg=NONE cterm=NONE
hi htmlArg                      ctermfg=NONE ctermbg=NONE cterm=NONE
hi htmlSpecialChar              ctermfg=141  ctermbg=NONE cterm=NONE
hi javaScriptFunction           ctermfg=81   ctermbg=NONE cterm=NONE
hi javaScriptRailsFunction      ctermfg=81   ctermbg=NONE cterm=NONE
hi javaScriptBraces             ctermfg=NONE ctermbg=NONE cterm=NONE
hi yamlKey                      ctermfg=81   ctermbg=NONE cterm=NONE
hi yamlAnchor                   ctermfg=NONE ctermbg=NONE cterm=NONE
hi yamlAlias                    ctermfg=NONE ctermbg=NONE cterm=NONE
hi yamlDocumentHeader           ctermfg=185  ctermbg=NONE cterm=NONE
hi cssURL                       ctermfg=208  ctermbg=NONE cterm=NONE
hi cssFunctionName              ctermfg=81   ctermbg=NONE cterm=NONE
hi cssColor                     ctermfg=141  ctermbg=NONE cterm=NONE
hi cssPseudoClassId             ctermfg=141  ctermbg=NONE cterm=NONE
hi cssClassName                 ctermfg=141  ctermbg=NONE cterm=NONE
hi cssValueLength               ctermfg=141  ctermbg=NONE cterm=NONE
hi cssCommonAttr                ctermfg=81   ctermbg=NONE cterm=NONE
hi cssBraces                    ctermfg=NONE ctermbg=NONE cterm=NONE
