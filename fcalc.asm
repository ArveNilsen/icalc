extern printf

section .data
	number1		dq	9.0
	number2		dq	73.0
	fmt		db	"The numbers are %f and %f",10,0
	fmtfloat 	db	"%s %f",10,0
	f_sum		db 	"The float sum of %f and %f is %f",10,0	
	f_dif		db 	"The float difference of %f and %f is %f",10,0	
	f_mul		db 	"The float product of %f and %f is %f",10,0	
	f_div		db 	"The float division of %f and %f is %f",10,0	
	f_sqrt		db 	"The float squareroot of %f is %f",10,0	

section .bss
section .text
	global main
main:
	push rbp
	mov rbp, rsp

; Print the numbers
	movsd xmm0, [number1]
	movsd xmm1, [number2]
	mov rdi, fmt
	mov rax, 2	; two floats
	call printf

; Sum
	movsd xmm2, [number1]	; double precision
	addsd xmm2, [number2]
; Print the result
	movsd xmm0, [number1]
	movsd xmm1, [number2]
	mov rdi, f_sum
	mov rax, 3	; three floats
	call printf

; Difference
	movsd xmm2, [number1]
	subsd xmm2, [number2]
; Print the result
	movsd xmm0, [number1]
	movsd xmm1, [number2]
	mov rdi, f_dif
	mov rax, 3
	call printf

; Multiplication
	movsd xmm2, [number1]
	mulsd xmm2, [number2]
; Print the result
	mov rdi, f_mul
	movsd xmm0, [number1]
	movsd xmm1, [number2]
	mov rax, 3
	call printf

; Division
	movsd xmm2, [number1]
	divsd xmm2, [number2]
; Print the result
	mov rdi, f_div
	movsd xmm0, [number1]
	movsd xmm1, [number2]
	mov rax, 1
	call printf

; Squareroot
	sqrtsd xmm1, [number1]
; Print the result
	mov rdi, f_sqrt
	movsd xmm0, [number1]
	mov rax, 2
	call printf

; Exit
	mov rsp, rbp
	pop rbp
	ret	
