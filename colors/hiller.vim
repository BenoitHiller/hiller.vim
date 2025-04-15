set background=dark
hi clear
let colors_name = 'hiller'

let s:palette = {
  \'Black': '#1A1A1A',
  \
  \'DarkRed': '#C73205',
  \'DarkGreen': '#58AD06',
  \'DarkYellow': '#C0751E',
  \'DarkBlue': '#5FD7FF',
  \'DarkMagenta': '#7C5283',
  \'DarkCyan': '#238789',
  \
  \'Gray': '#B6BEB1',
  \'DarkGray': '#696B66',
  \
  \'Red': '#EF5858',
  \'Green': '#A6E964',
  \'Yellow': '#F0D25E',
  \'Blue': '#95B3D4',
  \'Magenta': '#CC98C6',
  \'Cyan': '#79D6C5',
  \
  \'White': '#E2E2DB',
\}

" the order of colors used by terminal_ansi_colors, as the dictionary
" iteration order isn't guaranteed
let s:color_order = [
  \'Black',
  \
  \'DarkRed',
  \'DarkGreen',
  \'DarkYellow',
  \'DarkBlue',
  \'DarkMagenta',
  \'DarkCyan',
  \
  \'Gray',
  \'DarkGray',
  \
  \'Red',
  \'Green',
  \'Yellow',
  \'Blue',
  \'Magenta',
  \'Cyan',
  \
  \'White',
\]

" Clean up the terminal colors before loading the next colorscheme
augroup HillerColorScheme
  au!
  au ColorSchemePre * unlet g:terminal_ansi_colors
  au ColorSchemePre * au! HillerColorScheme
augroup END

let s:custom_colors = {}
let g:terminal_ansi_colors = []
for color in s:color_order
  let key = 'hiller_' . tolower(color)
  let g:terminal_ansi_colors += [key]
  let s:custom_colors[key] = s:palette[color]
endfor

call extend(v:colornames, s:custom_colors, 'keep')

" A helper function to set a highlight line given that both the gui and cterm
" colors are pulling from the same palette.
fun! s:HillerHighlight(name, fg, bg, attrs, ...)
  let l:extra = join(a:000, ' ')

  if a:fg == 'NONE'
    let l:fg = ' guifg=NONE ctermfg=NONE'
  else
    let l:fg = ' guifg=hiller_' . tolower(a:fg) . ' ctermfg=' . a:fg
  endif

  if a:bg == 'NONE'
    let l:bg = ' guibg=NONE ctermbg=NONE'
  else
    let l:bg = ' guibg=hiller_' . tolower(a:bg) . ' ctermbg=' . a:bg
  endif

  let l:attrs = ' gui=' . a:attrs . ' cterm=' . a:attrs

  if empty(l:extra)
    exec 'hi ' . a:name . l:fg . l:bg . l:attrs
  else
    exec 'hi ' . a:name . l:fg . l:bg . l:attrs . ' ' . l:extra
  endif
endfun

" define a buffer local command to make writing out the lines a bit less
" tedious.
command! -nargs=* -buffer HHi call s:HillerHighlight(<f-args>)

""""""""
" Core "
""""""""

HHi Normal White Black NONE
HHi SpecialKey NONE NONE NONE

HHi NonText Black NONE NONE
hi EndOfBuffer "default

HHi Terminal White Black NONE

""""""""""
" Search "
""""""""""

hi Search "default
hi IncSearch "default
hi CurSearch "default
HHi MatchParen NONE DarkCyan NONE

""""""""""
" Popups "
""""""""""

HHi MessageWindow NONE NONE NONE
HHi PopupNotification NONE NONE NONE
HHi PopupSelected NONE NONE NONE

HHi Pmenu White DarkGray NONE
HHi PmenuSel Black Gray NONE
HHi PmenuSbar Black Black NONE
HHi PmenuThumb NONE White NONE
hi PmenuMatch "default
hi PmenuMatchSel "default

""""""""""""""""""""""""""
" Window Border Elements "
""""""""""""""""""""""""""

HHi StatusLine White DarkGray NONE
HHi StatusLineNC Blue DarkGray NONE

HHi StatusLineTerm White DarkGray NONE
HHi StatusLineTermNC Green DarkGray NONE

HHi VertSplit DarkGray DarkGray NONE

HHi TabLine White DarkGray NONE
HHi TabLineFill NONE DarkGray NONE
HHi TabLineSel White NONE NONE

hi ToolbarLine "default
hi ToolbarButton "default

HHi WildMenu White NONE NONE

HHi ModeMsg Black Cyan NONE

""""""""""
" Cursor "
""""""""""

HHi Visual NONE NONE reverse
hi VisualNOS "default

HHi Cursor Black White reverse
hi lCursor "default
HHi CursorLine NONE NONE NONE
HHi CursorColumn NONE NONE NONE

""""""""""
" Gutter "
""""""""""

HHi LineNr DarkGray NONE NONE
hi LineNrAbove "default
hi LineNrBelow "default

hi FoldColumn "default
HHi SignColumn Cyan DarkGray NONE
hi CursorLineFold "default
hi CursorLineSign "default
HHi CursorLineNr Yellow NONE NONE

""""""""""
" Errors "
""""""""""
HHi ErrorMsg White Red NONE
HHi WarningMsg White Red NONE

""""""""""""
" Spelling "
""""""""""""

HHi SpellBad NONE NONE undercurl term=NONE ctermul=Red guisp=hiller_red
HHi SpellCap NONE NONE undercurl term=NONE ctermul=Blue guisp=hiller_blue
HHi SpellLocal NONE NONE undercurl term=NONE ctermul=Cyan guisp=hiller_cyan
HHi SpellRare NONE NONE undercurl term=NONE ctermul=Magenta guisp=hiller_magenta

""""""""
" Diff "
""""""""

" These colours are a bit iffy, but limiting myself to a small palette like
" this makes doing background colours difficult.
"
" I will want to build out a set of backgrounds to match to do this better.
HHi DiffAdd DarkGreen NONE reverse
HHi DiffChange NONE DarkYellow NONE
HHi DiffText NONE DarkMagenta NONE
HHi DiffDelete Gray DarkCyan NONE

"""""""""""
" Misc UI "
"""""""""""

HHi MoreMsg Green NONE NONE
HHi Question Green NONE NONE

hi Folded "default
HHi Title Magenta NONE NONE

hi QuickFixLine

HHi debugPC NONE NONE NONE
HHi debugBreakpoint NONE NONE NONE

HHi Directory Cyan NONE NONE
HHi Conceal Gray DarkGray NONE

"""""""""""""""""
" Syntax Tokens "
"""""""""""""""""

HHi Comment DarkGray NONE NONE

HHi Constant Cyan NONE NONE
HHi String Green NONE NONE
hi link Character Constant
HHi Number Magenta NONE NONE
hi link Boolean Constant
hi link Float Number

HHi Identifier Cyan NONE NONE
HHi Function DarkYellow NONE NONE

HHi Statement DarkBlue NONE NONE
HHi Conditional Blue NONE NONE
hi link Repeat Statement
hi link Label Statement
HHi Operator White NONE NONE
HHi Keyword Blue NONE NONE
hi link Exception Statement

HHi PreProc Blue NONE NONE
hi link Include PreProc
hi link Define PreProc
hi link Macro PreProc
hi link PreCondit PreProc

HHi Type Yellow NONE NONE
hi link StorageClass Type
hi link Structure Type
hi link Typedef Type

HHi Special White NONE NONE
hi link SpecialChar Special
hi link Tag Special
HHi Delimiter Cyan NONE NONE
hi link SpecialComment Special
hi link Debug Special

HHi Underlined Blue NONE underline

hi Ignore "default

HHi Error White Red NONE

HHi Todo Red NONE NONE

HHi Added Green NONE NONE
HHi Changed Blue NONE NONE
HHi Removed Red NONE NONE

""""""""""""""""""""""
" Language Overrides "
""""""""""""""""""""""

""""""""
" Ruby "
""""""""

HHi rubyRegexp DarkYellow NONE NONE
HHi rubyRegexpDelimiter DarkYellow NONE NONE
HHi rubyInterpolationDelimiter Cyan NONE NONE

HHi rubyControl Blue NONE NONE

hi link rubyDefine Keyword " as opposed to PreProc
hi link rubyConstant Type " as opposed to Constant

""""""""
" Java "
""""""""

hi link javaScopeDecl Identifier " as opposed to StorageClass

hi link javaDocTags javaDocSeeTag
hi link javaDocParam javaDocSeeTag
hi link javaDocSeeTagParam javaDocSeeTag

HHi javaDocSeeTag DarkGray NONE NONE

"""""""
" XML "
"""""""

hi link xmlTag Keyword
hi link xmlTagName Conditional
hi link xmlEndTag Identifier

""""""""
" HTML "
""""""""

hi link htmlTag Keyword
hi link htmlTagName Conditional
hi link htmlEndTag Identifier

""""""""""""""
" JavaScript "
""""""""""""""

hi link javaScriptNumber Number

""""""""""""""
" TypeScript "
""""""""""""""

hi link typescriptImport Statement
hi link typescriptExport Statement
hi link typescriptKeywordOp Keyword
" this is the type keyword so this matches how const and var get highlighted
hi link typescriptOperator Keyword

"""""""""""
" Cleanup "
"""""""""""

delc -buffer HHi
