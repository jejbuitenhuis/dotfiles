if exists("b:current_syntax")
	finish
end

" comments
syntax match yComment "//.*$"
hi def link yComment Comment

" basic keywords
syntax keyword yStatement ret stop
hi def link yStatement Statement

" booleans
syntax keyword yBoolean true false
hi def link yBoolean Boolean

" numbers
syntax match yNumber "-\?\d\+"
hi def link yNumber Number

" strings
syntax match yCharacter "\\." contained
hi def link yCharacter Character

syntax region yString start="\"" end="\"" contains=yCharacter
hi def link yString String

" declaring variables
syntax match yVariableName "\w\+"
hi def link yVariableName Identifier

syntax keyword yType int float bool char nextgroup=yVariableName
hi def link yType Type

syntax keyword yStatement decl nextgroup=yType

let b:current_syntax = "y"

