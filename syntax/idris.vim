" syntax highlighting for idris (idris-lang.org)
"
" author: raichoo (raichoo@googlemail.com)
" date: Aug 17 2012

syn match idrisModule "\<\(module\|namespace\)\>"
syn match idrisImport "\<import\>"
syn match idrisStructure "\<\(class\|data\|instance\|where\|record\)\>"
syn match idrisVisibility "\<\(public\|abstract\|private\)\>"
syn match idrisStatement "\<\(do\|case\|of\|let\|in\|with\|total\|dsl\|auto\)\>"
syn match idrisSyntax "\(pattern \+\|term \+\)\?syntax"
syn match idrisConditional "\<\(if\|then\|else\)\>"
syn match idrisTactic contained "\<\(intros\?\|rewrite\|exact\|refine\|trivial\|let\|focus\|try\|compute\|solve\|attack\)\>"
syn match idrisNumber "\<[0-9]\+\>\|\<0[xX][0-9a-fA-F]\+\>\|\<0[oO][0-7]\+\>"
syn match idrisFloat "\<[0-9]\+\.[0-9]\+\([eE][-+]\=[0-9]\+\)\=\>"
syn match idrisDelimiter  "(\|)\|\[\|\]\|,\|;\|_\|{\|}"
syn match idrisInfix "\<\(infix\|infixl\|infixr\)\>"
syn match idrisOperators "[-!#$%&\*\+./<=>\?@\\^|~:]"
syn match idrisType "\<\([A-Z][a-zA-Z0-9_]*\|_|_\)\>"
syn match idrisLineComment "---*\([^-!#$%&\*\+./<=>\?@\\^|~].*\)\?$"
syn match idrisMetaVar "?[a-z][A-Za-z0-9_]\+"
syn match idrisLink "%\(lib\|link\|include\)"
syn match idrisAccess "%access"
syn region idrisString start=+"+ skip=+\\\\\|\\"+ end=+"+
syn region idrisBlockComment start="{-" end="-}"
syn region idrisProofBlock start="proof *{" end="}" contains=idrisTactic

command -nargs=+ HiLink hi def link <args>

HiLink idrisImport Include
HiLink idrisModule idrisStructure
HiLink idrisStructure Structure
HiLink idrisStatement Statement
HiLink idrisSyntax Statement
HiLink idrisVisibility Statement
HiLink idrisConditional Conditional
HiLink idrisProofBlock Macro
highlight idrisTactic ctermfg=cyan
highlight idrisLink ctermbg=yellow ctermfg=white
highlight idrisAccess ctermbg=magenta ctermfg=white
HiLink idrisNumber Number
HiLink idrisFloat Float
HiLink idrisDelimiter Delimiter
HiLink idrisInfix PreProc
HiLink idrisOperators Operator
HiLink idrisType Type
HiLink idrisLineComment Comment
HiLink idrisBlockComment Comment
highlight idrisMetaVar ctermbg=cyan ctermfg=white
HiLink idrisString String

delcommand HiLink
