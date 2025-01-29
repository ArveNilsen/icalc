; Playground for experimenting with x64 assembly
;
extern printf

SECTION	.data
	number1 	dq 	128
	number2 	dq 	19
	neg_num 	dq 	-12
	fmt 		db 	"The numbers are %ld and %ld",10,0
	fmtint		db	"%s %ld",10,0
	sumi		db	"The sum is",0
	difi		db 	"The difference is",0
	inci		db	"Number 1 Incremented:",0
	deci		db	"Number 1 Decremented:",0
	sali		db	"Number 1 Shift left 2 (x4):",0
	sari		db	"Number 1 Shift right 2 (/4):",0
	sariex		db	"Number 1 Shift right 2 (/4) with "
			db	"sign extension:",0
	multi		db 	"The product is",0
	divi		db	"The integer quotient is",0
	remi		db 	"The modulo is",0

SECTION .bss
	resulti		resq	1
	modulo		resq 	1

SECTION .text
global main
main:
	push rbp	; push stack pointer
	mov rbp, rsp

; Displaying the numbers
	mov rdi, fmt
	mov rsi, [number1]
	mov rdx, [number2]
	mov rax, 0
	call printf

; Adding
	mov rax, [number1]
	add rax, [number2]
	mov [resulti], rax

; Displaying the result
	mov rdi, fmtint
	mov rsi, sumi
	mov rdx, [resulti]
	mov rax, 0
	call printf

; Subtracting
	mov rax, [number1]
	sub rax, [number2]
	mov [resulti], rax

; Displaying the result
	mov rdi, fmtint
	mov rsi, difi
	mov rdx, [resulti]
	mov rax, 0
	call printf

; Incrementing
	mov rax, [number1]
	inc rax
	mov [resulti], rax

; Displaying the result
	mov rdi, fmtint
	mov rsi, inci
	mov rdx, [resulti]
	mov rax, 0
	call printf

; Decrementing
	mov rax, [number1]
	dec rax
	mov [resulti], rax

; Displaying the result
	mov rdi, fmtint
	mov rsi, deci
	mov rdx, [resulti]	
	mov rax, 0
	call printf

; Shift aritmetic left
	mov rax, [number1]
	sal rax, 2		; multiply rax by 4
	mov [resulti], rax

; Displaying the result
	mov rdi, fmtint
	mov rsi, sali
	mov rdx, [resulti]
	mov rax, 0
	call printf

; Shift arithmetic right
	mov rax, [number1]
	sar rax, 2		; divide rax by 4
	mov [resulti], rax

; Displaying the result
	mov rdi, fmtint
	mov rsi, sari
	mov rdx, [resulti]
	mov rax, 0
	call printf

; Shift arithmetic right with sign extension
	mov rax, [neg_num]
	sar rax, 2		; divide rax by 4
	mov [resulti], rax

; Displaying the result	
	mov rdi, fmtint
	mov rsi, sariex
	mov rdx, [resulti]
	mov rax, 0
	call printf

; Multiply
	mov rax, [number1]
	imul qword [number2]	; multiply rax with number2
	mov [resulti], rax

; Displaying the result
	mov rdi, fmtint
	mov rsi, multi
	mov rdx, [resulti]
	mov rax, 0
	call printf

; Divide
	mov rax, [number1]
	mov rdx, 0		; rdx needs to be 0 before idiv
	idiv qword [number2]	; divide rax by number 2, modulo in rdx
	mov [resulti], rax
	mov [modulo], rdx

; Displaying the result
	mov rdi, fmtint
	mov rsi, divi
	mov rdx, [resulti]
	mov rax, 0
	call printf
	mov rdi, fmtint
	mov rsi, remi
	mov rdx, [modulo]
	mov rax, 0
	call printf
	
	
	mov rsp, rbp
	pop rbp
	mov rax, 60	; Code for Exit Syscall
	mov rdi, 0	; Return code
	syscall		; syscall exit
