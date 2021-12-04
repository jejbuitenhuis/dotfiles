" standard guard against syntax clash
if exists("b:current_syntax")
	finish
end

" Asm is out main syntax; C is an extra one
runtime! syntax/asm.vim
unlet b:current_syntax
syntax include @C syntax/c.vim
unlet b:current_syntax

" a line starting with [A-Za-z_] is a C line
syntax region odLine start=/^\h/ end=/$/ keepend contains=@C

" a line beginning with a hex number is an objdump address/opcode
" stop at [:xdigit:][:blank:][:blank:] to interpret the rest as asm instruction
syntax region odHead start='^\s*\x\+\>' end=/\x\s\{2,}\|$/ keepend
			\ contains=odHex,asmIdentifier

" hex number w/o any prefix (deadbeef)
syntax match odHex '\<\x\+\>' contained
hi def link odHex hexNumber

" assign current syntax
let b:current_syntax = 'objdump'
