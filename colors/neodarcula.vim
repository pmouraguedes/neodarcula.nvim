" Initialization
if exists('g:colors_name')
  highlight clear
endif

if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'neodarcula'

" If Neovim with Lua support, use the Lua module
if has('nvim-0.8') && luaeval('pcall(require, "neodarcula")')
  lua << EOF
    require("neodarcula").load()
EOF
  finish
endif

" ============================================================================
" Fallback for plain Vim (Vimscript implementation)
" ============================================================================

" Terminal color support check
if !has('gui_running') && &t_Co < 256
  finish
endif

" Color definitions
let s:fg = '#DDDDDD'
let s:bg = '#000001'
let s:current_line = '#151515'
let s:selection = '#214283'
let s:string = '#6AAB73'
let s:number = '#2A9F7C'
let s:keyword = '#CF8E6D'
let s:comment = '#7A7E85'
let s:constant = '#C77DBB'
let s:type = '#BCBEC4'
let s:func = '#56A8F5'
let s:operator = '#BCBEC4'
let s:error = '#BC3F3C'
let s:warning = '#C29E4A'
let s:info = '#606060'
let s:hint = '#606060'
let s:gray = '#606366'
let s:annotation = '#B3AE60'
let s:search_bg = '#22535E'
let s:inc_search_bg = '#00006B'
let s:cur_search_bg = '#00006B'
let s:float_border = '#CF8E6D'
let s:title = '#CF8E6D'
let s:special = '#D5B778'
let s:tab_selected_bg = '#273828'
let s:branch_fg = '#FF0000'

" Helper function to set highlights
function! s:Hi(group, fg, bg, attr)
  let l:cmd = 'highlight ' . a:group
  if a:fg != ''
    let l:cmd .= ' guifg=' . a:fg
  endif
  if a:bg != ''
    let l:cmd .= ' guibg=' . a:bg
  endif
  if a:attr != ''
    let l:cmd .= ' gui=' . a:attr
  endif
  execute l:cmd
endfunction

" UI Elements
call s:Hi('Normal', s:fg, s:bg, '')
call s:Hi('NormalFloat', s:fg, s:bg, '')
call s:Hi('Visual', '', s:selection, '')
call s:Hi('CursorLine', '', s:current_line, '')
call s:Hi('CursorColumn', '', s:current_line, '')
call s:Hi('CursorLineNr', s:fg, s:current_line, '')
call s:Hi('LineNr', s:gray, '', '')
call s:Hi('StatusLine', s:fg, s:tab_selected_bg, 'bold')
call s:Hi('StatusLineNC', s:gray, s:tab_selected_bg, '')
call s:Hi('VertSplit', s:gray, s:bg, '')
call s:Hi('Pmenu', s:fg, s:current_line, '')
call s:Hi('PmenuSel', '', s:selection, '')
call s:Hi('PmenuSbar', '', s:current_line, '')
call s:Hi('PmenuThumb', '', s:gray, '')
call s:Hi('Search', s:fg, s:search_bg, '')
call s:Hi('IncSearch', s:fg, s:inc_search_bg, 'bold')
call s:Hi('CurSearch', s:fg, s:cur_search_bg, 'bold')
call s:Hi('TabLine', s:gray, s:bg, '')
call s:Hi('TabLineFill', '', s:bg, '')
call s:Hi('TabLineSel', '', s:tab_selected_bg, '')
call s:Hi('Title', s:title, '', 'bold')
call s:Hi('FloatBorder', s:float_border, s:bg, '')
call s:Hi('WildMenu', '', s:selection, '')
call s:Hi('Question', s:string, '', '')
call s:Hi('MoreMsg', s:string, '', '')
call s:Hi('ModeMsg', s:fg, '', 'bold')
call s:Hi('WarningMsg', s:warning, '', '')
call s:Hi('ErrorMsg', s:error, '', '')
call s:Hi('SpellBad', s:error, '', 'underline')
call s:Hi('SpellCap', s:warning, '', 'underline')
call s:Hi('SpellRare', s:info, '', 'underline')
call s:Hi('SpellLocal', s:info, '', 'underline')
call s:Hi('DiffAdd', '', '#294436', '')
call s:Hi('DiffChange', '', '#385570', '')
call s:Hi('DiffDelete', s:error, '#484A4A', '')
call s:Hi('DiffText', '', '#214283', 'bold')
call s:Hi('Folded', s:comment, s:current_line, 'italic')
call s:Hi('FoldColumn', s:comment, s:bg, '')
call s:Hi('SignColumn', '', s:bg, '')
call s:Hi('Directory', s:func, '', '')
call s:Hi('MatchParen', s:fg, s:selection, 'bold')
call s:Hi('NonText', s:gray, '', '')
call s:Hi('SpecialKey', s:gray, '', '')
call s:Hi('Whitespace', s:gray, '', '')

" Basic Syntax Highlighting
call s:Hi('Comment', s:comment, '', 'italic')
call s:Hi('String', s:string, '', '')
call s:Hi('Character', s:string, '', '')
call s:Hi('Number', s:number, '', '')
call s:Hi('Boolean', s:constant, '', '')
call s:Hi('Float', s:number, '', '')
call s:Hi('Constant', s:constant, '', '')
call s:Hi('Keyword', s:keyword, '', '')
call s:Hi('Statement', s:keyword, '', '')
call s:Hi('Conditional', s:keyword, '', '')
call s:Hi('Repeat', s:keyword, '', '')
call s:Hi('Label', s:keyword, '', '')
call s:Hi('Operator', s:operator, '', '')
call s:Hi('Exception', s:keyword, '', '')
call s:Hi('Type', s:special, '', '')
call s:Hi('StorageClass', s:keyword, '', '')
call s:Hi('Structure', s:keyword, '', '')
call s:Hi('Typedef', s:keyword, '', '')
call s:Hi('Function', s:func, '', '')
call s:Hi('Identifier', s:fg, '', '')
call s:Hi('Special', s:special, '', '')
call s:Hi('SpecialChar', s:special, '', '')
call s:Hi('Tag', s:special, '', '')
call s:Hi('Delimiter', s:fg, '', '')
call s:Hi('SpecialComment', s:comment, '', 'italic')
call s:Hi('Debug', s:error, '', '')
call s:Hi('Underlined', s:func, '', 'underline')
call s:Hi('Ignore', s:gray, '', '')
call s:Hi('Error', s:error, '', '')
call s:Hi('Todo', s:warning, '', 'bold')
call s:Hi('PreProc', s:keyword, '', '')
call s:Hi('Include', s:keyword, '', '')
call s:Hi('Define', s:keyword, '', '')
call s:Hi('Macro', s:annotation, '', '')
call s:Hi('PreCondit', s:keyword, '', '')

" Diagnostics (for Vim with ALE, Syntastic, or Neovim in basic mode)
call s:Hi('DiagnosticError', s:error, '', '')
call s:Hi('DiagnosticWarn', s:warning, '', '')
call s:Hi('DiagnosticInfo', s:info, '', '')
call s:Hi('DiagnosticHint', s:hint, '', '')

" ALE (Asynchronous Lint Engine)
call s:Hi('ALEError', s:error, '', '')
call s:Hi('ALEWarning', s:warning, '', '')
call s:Hi('ALEInfo', s:info, '', '')
call s:Hi('ALEErrorSign', s:error, '', '')
call s:Hi('ALEWarningSign', s:warning, '', '')
call s:Hi('ALEInfoSign', s:info, '', '')

" Syntastic
call s:Hi('SyntasticError', s:error, '', '')
call s:Hi('SyntasticWarning', s:warning, '', '')
call s:Hi('SyntasticErrorSign', s:error, '', '')
call s:Hi('SyntasticWarningSign', s:warning, '', '')

" Language-specific enhancements (basic Vim syntax)
" These will work with Vim's built-in syntax highlighting

" HTML
call s:Hi('htmlTag', s:special, '', '')
call s:Hi('htmlEndTag', s:special, '', '')
call s:Hi('htmlTagName', s:keyword, '', '')
call s:Hi('htmlArg', s:fg, '', '')
call s:Hi('htmlSpecialChar', s:constant, '', '')

" CSS
call s:Hi('cssClassName', s:fg, '', '')
call s:Hi('cssIdentifier', s:fg, '', '')
call s:Hi('cssTagName', s:keyword, '', '')
call s:Hi('cssProp', s:fg, '', '')
call s:Hi('cssColor', s:number, '', '')
call s:Hi('cssValueLength', s:number, '', '')
call s:Hi('cssValueNumber', s:number, '', '')

" JavaScript
call s:Hi('javaScriptFunction', s:keyword, '', '')
call s:Hi('javaScriptIdentifier', s:keyword, '', '')
call s:Hi('javaScriptBraces', s:fg, '', '')

" Python
call s:Hi('pythonBuiltin', s:keyword, '', '')
call s:Hi('pythonFunction', s:func, '', '')
call s:Hi('pythonDecorator', s:annotation, '', '')
call s:Hi('pythonDecoratorName', s:annotation, '', '')

" Ruby
call s:Hi('rubySymbol', s:constant, '', '')
call s:Hi('rubyConstant', s:fg, '', '')
call s:Hi('rubyClassName', s:fg, '', '')
call s:Hi('rubyModuleName', s:fg, '', '')
call s:Hi('rubyInstanceVariable', s:constant, '', '')

" Java
call s:Hi('javaAnnotation', s:annotation, '', '')
call s:Hi('javaTypeDef', s:keyword, '', '')
call s:Hi('javaClassDecl', s:keyword, '', '')

" Go
call s:Hi('goPackage', s:keyword, '', '')
call s:Hi('goImport', s:keyword, '', '')
call s:Hi('goBuiltins', s:keyword, '', '')

" Rust
call s:Hi('rustModPath', s:fg, '', '')
call s:Hi('rustMacro', s:annotation, '', '')
call s:Hi('rustLifetime', s:constant, '', '')

" Markdown
call s:Hi('markdownHeadingDelimiter', s:keyword, '', 'bold')
call s:Hi('markdownH1', s:keyword, '', 'bold')
call s:Hi('markdownH2', s:keyword, '', 'bold')
call s:Hi('markdownH3', s:keyword, '', 'bold')
call s:Hi('markdownCode', s:string, '', '')
call s:Hi('markdownCodeBlock', s:string, '', '')
call s:Hi('markdownCodeDelimiter', s:string, '', '')
call s:Hi('markdownLinkText', s:func, '', 'underline')
call s:Hi('markdownUrl', s:comment, '', 'underline')

" Git
call s:Hi('gitcommitSummary', s:fg, '', '')
call s:Hi('gitcommitComment', s:comment, '', 'italic')
call s:Hi('gitcommitOverflow', s:error, '', '')
call s:Hi('gitcommitBranch', s:constant, '', 'bold')

" Cleanup
delfunction s:Hi
