.586
.model flat, stdcall
includelib libucrt.lib
includelib kernel32.lib
includelib ../Debug/Lib
ExitProcess PROTO :DWORD

EXTRN COMBINE: proc
EXTRN LEXCOMP: proc
EXTRN MEASURE: proc
EXTRN BREAKL: proc
EXTRN RANDOMIZE: proc
EXTRN EXPONENT: proc
EXTRN read: proc
EXTRN OutputInt: proc
EXTRN OutputStr: proc

.stack 4096

.const
	L1 SDWORD 0
	L2 SDWORD 2
	L3 SDWORD 3
	L4 BYTE "Counting to length: ", 0
	L5 SDWORD 1
	L6 BYTE " ", 0
	L7 BYTE "Test Course Project ", 0
	L8 BYTE "UVV2024 ", 0
	L9 BYTE "Start in 3 2 1", 0
	L10 BYTE "Numbers: ", 0
	L11 SDWORD -2
	L12 SDWORD 8
	L13 BYTE "bin - oct = ", 0
	L14 SDWORD 1
	L15 BYTE "Bool: ", 0
	L16 BYTE "S", 0
	L17 SDWORD 4
	L18 BYTE "exp[2,4] = ", 0
	L19 SDWORD 16
	L20 BYTE "pow 2,4 really equal 16", 0
	L21 BYTE "pow 2,4 not really equal 16", 0
	L22 BYTE "Now", 0
	L23 BYTE "length: ", 0
	L24 SDWORD 41
	L25 BYTE "Random: ", 0
	L26 SDWORD 256
	L27 SDWORD 160
	L28 BYTE "Lexcomp: ", 0
	L29 SDWORD 5
	L30 SDWORD 10
	L31 BYTE "End of example if <= 10", 0
	L32 BYTE "End of example if > 10", 0
	L33 BYTE "str1", 0
	L34 BYTE "string", 0
	L35 BYTE "str1 <= string", 0
	L36 BYTE "str1 > string", 0

.data
	buffer BYTE 256 dup(0)
	funcress SDWORD 0
	funcctest SDWORD 0
	cycleni SDWORD 0
	mainstart DWORD ?
	mainstartt DWORD ?
	mainbin SDWORD 0
	mainoct SDWORD 0
	maindif SDWORD 0
	mainbooly SDWORD 0
	maincharr DWORD ?
	mainexp SDWORD 0
	mainlength SDWORD 0
	mainrandd SDWORD 0
	mainkiruha SDWORD 0
	maintestx SDWORD 0
	maintesty SDWORD 0
	maint SDWORD 0
	mainresult SDWORD 0

.code

func PROC funca : SDWORD, funcb : SDWORD
	push L1
	pop funcress
	push funca
	push funcb
	pop eax
	pop ebx
	add eax, ebx
	push eax
	push L2
	pop eax
	pop ebx
	mul ebx
	push eax
	push L2
	pop ebx
	pop eax
	cdq
	idiv ebx
	push eax
	pop funcress
	push funcress
	push L2
	pop eax
	pop ebx
	mul ebx
	push eax
	pop funcress
	push funcress
	jmp local0
local0:
	pop eax
	ret
func ENDP

funcc PROC 
	push L3
	pop funcctest
	push funcctest
	call OutputInt
	call BREAKL
	pop eax
	push funcctest
	jmp local1
local1:
	pop eax
	ret
funcc ENDP

cyclen PROC cyclenn : SDWORD
	push L1
	pop cycleni
	push offset L4
	call OutputStr
	push cyclenn
	call OutputInt
	call BREAKL
	mov eax, cycleni
	cmp eax, cyclenn
	jl cycle0
	jmp cyclenext0
cycle0:
	push cycleni
	push L5
	pop eax
	pop ebx
	add eax, ebx
	push eax
	pop cycleni
	push cycleni
	call OutputInt
	push offset L6
	call OutputStr
	mov eax, cycleni
	cmp eax, cyclenn
	jl cycle0
cyclenext0:
	call BREAKL
	ret
cyclen ENDP

main PROC
	push offset L7
	push offset L8
	pop edx
	pop edx
	push offset L8
	push offset L7
	push offset buffer
	call COMBINE
	push eax
	pop mainstart
	push mainstart
	push offset L9
	pop edx
	pop edx
	push offset L9
	push mainstart
	push offset buffer
	call COMBINE
	push eax
	pop mainstartt
	push mainstartt
	call OutputStr
	call BREAKL
	push offset L10
	call OutputStr
	call BREAKL
	push L11
	pop mainbin
	push mainbin
	call OutputInt
	call BREAKL
	push L12
	pop mainoct
	push mainoct
	call OutputInt
	call BREAKL
	push offset L13
	call OutputStr
	push mainbin
	push mainoct
	pop ebx
	pop eax
	sub eax, ebx
	push eax
	pop maindif
	push maindif
	call OutputInt
	call BREAKL
	push L14
	pop mainbooly
	push offset L15
	call OutputStr
	push mainbooly
	call OutputInt
	call BREAKL
	push offset L16
	pop maincharr
	push maincharr
	call OutputStr
	call BREAKL
	push L2
	push L2
	push L17
	pop edx
	pop edx
	push L17
	push L2
	call EXPONENT;
	push eax
	pop eax
	pop ebx
	add eax, ebx
	push eax
	pop mainexp
	push offset L18
	call OutputStr
	push mainexp
	call OutputInt
	call BREAKL
	mov eax, mainexp
	cmp eax, L19
	jz m0
	jnz m1
	je m1
m0:
	push offset L20
	call OutputStr
	call BREAKL
	jmp e0
m1:
	push offset L21
	call OutputStr
	call BREAKL
e0:
	push offset L22
	pop edx
	push offset L22
	call MEASURE;
	push eax
	pop mainlength
	push offset L23
	call OutputStr
	push mainlength
	call OutputInt
	call BREAKL
	push L5
	push L24
	pop edx
	pop edx
	push L24
	push L5
	call RANDOMIZE;
	push eax
	pop mainrandd
	push offset L25
	call OutputStr
	push mainrandd
	call OutputInt
	call BREAKL
	push L26
	push L27
	pop eax
	pop ebx
	mul ebx
	push eax
	pop mainkiruha
	push offset L28
	call OutputStr
	push mainkiruha
	call OutputInt
	call BREAKL
	push func
	push L5
	push L29
	pop edx
	pop edx
	push L29
	push L5
	call func
	push eax
	pop maintestx
	push maintestx
	call OutputInt
	call BREAKL
	push funcc
	call funcc
	push eax
	pop maintesty
	push maintesty
	call OutputInt
	call BREAKL
	push L17
	pop maint
	push maint
	call cyclen
	mov eax, maint
	cmp eax, L30
	jl m2
	jz m2
	jg m3
	je m3
m2:
	push offset L31
	call OutputStr
	call BREAKL
	jmp e1
m3:
	push offset L32
	call OutputStr
	call BREAKL
e1:
	push offset L33
	push offset L34
	pop edx
	pop edx
	push offset L34
	push offset L33
	call LEXCOMP;
	push eax
	pop mainresult
	mov eax, mainresult
	cmp eax, L1
	jl m4
	jz m4
	jg m5
	je m5
m4:
	push offset L35
	call OutputStr
	call BREAKL
	jmp e2
m5:
	push offset L36
	call OutputStr
	call BREAKL
e2:
	push 0
	call ExitProcess
main ENDP
end main