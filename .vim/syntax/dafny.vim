" Vim syntax file
" Language: Dafny
" Author: Kuat Yessenov
" Date: 6/24/2010

if exists("b:current_syntax")
  finish
endif

syntax clear
syntax case match
syntax keyword dafnyFunction function method
syntax keyword dafnyTypeDef class datatype 
syntax keyword dafnyConditional if then else match case 
syntax keyword dafnyRepeat foreach while
syntax keyword dafnyStatement havoc assume assert return call new print break label
syntax keyword dafnyKeyword var ghost returns null static this refines replaces by
syntax keyword dafnyType int bool seq set object array array2 array3
syntax keyword dafnyLogic requires ensures modifies reads decreases invariant 
syntax keyword dafnyOperator forall exists old fresh
syntax keyword dafnyBoolean true false
  
syntax region dafnyString start=/"/ skip=/\\"/ end=/"/

syntax match dafnyComment /\/\/.*/
syntax region dafnyComment start="/\*" end="\*/"

syntax match dafnyNumber /\d\+\>/
syntax match dafnyIdentifier /\<\w\+\>/

syntax match dafnyOperator "==>"
syntax match dafnyOperator "<==>"
syntax match dafnyOperator "::"

let b:current_syntax = "dafny"

highlight link dafnyFunction Function
highlight link dafnyTypeDef Typedef
highlight link dafnyConditional Conditional
highlight link dafnyRepeat Repeat
highlight link dafnyKeyword Keyword
highlight link dafnyType Type
highlight link dafnyLogic Debug
highlight link dafnyComment Comment
highlight link dafnyString String
highlight link dafnyNumber Number
highlight link dafnyOperator Operator
highlight link dafnyStatement Statement
highlight link dafnyBoolean Boolean 
