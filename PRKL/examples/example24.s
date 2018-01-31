    .text
            .global main

            .type	main, @function
        .data 
	heap:
		.zero 800008
	front:
		.quad heap
lalloc:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -800024(%rbp)
	movq	$front, %rax
	movq	%rax, -800032(%rbp)

	subq	$800032, %rsp
	movq	$front, %rax

	pushq	%rax
	movq	-800024(%rbp), %rax

	pushq	%rax
	movq	$8, %rax
	movq	%rax, %rcx
	popq	%rax
	imulq	%rcx, %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax

	movq	-800032(%rbp), %rax
	leave	
	ret	


	leave	
	ret	
cons:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -800024(%rbp)
	movq	%rsi, -800032(%rbp)

	subq	$800040, %rsp
	movq	$1, %rax

	movq	%rax, %r11
	movq	$0, %rax
	imulq	$8, %rax
	pushq	%rax
	movq	-800040(%rbp), %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax
	movq	%r11, (%rbx)

	movq	-800024(%rbp), %rax

	movq	%rax, %r11
	movq	$1, %rax
	imulq	$8, %rax
	pushq	%rax
	movq	-800040(%rbp), %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax
	movq	%r11, (%rbx)

	movq	-800032(%rbp), %rax

	movq	%rax, %r11
	movq	$2, %rax
	imulq	$8, %rax
	pushq	%rax
	movq	-800040(%rbp), %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax
	movq	%r11, (%rbx)

	movq	-800040(%rbp), %rax
	leave	
	ret	


	leave	
	ret	
pairp:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -800024(%rbp)
	subq	$800024, %rsp
	movq	$0, %rax
	imulq	$8, %rax
	pushq	%rax
	movq	-800024(%rbp), %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax

	pushq	%rax
	movq	$1, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jne	COMP_FALSE_BinaryExpression_7f75c96a4da0

COMP_TRUE_BinaryExpression_7f75c96a4da0:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f75c96a4da0

COMP_FALSE_BinaryExpression_7f75c96a4da0:
	movq	$0, %rax
COMP_END_BinaryExpression_7f75c96a4da0:
	leave	
	ret	


	leave	
	ret	
car:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -800024(%rbp)
	subq	$800024, %rsp
	movq	$1, %rax
	imulq	$8, %rax
	pushq	%rax
	movq	-800024(%rbp), %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax
	leave	
	ret	


	leave	
	ret	
cdr:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -800024(%rbp)
	subq	$800024, %rsp
	movq	$2, %rax
	imulq	$8, %rax
	pushq	%rax
	movq	-800024(%rbp), %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax
	leave	
	ret	


	leave	
	ret	
num:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -800024(%rbp)

	subq	$800032, %rsp
	movq	$0, %rax

	movq	%rax, %r11
	movq	$0, %rax
	imulq	$8, %rax
	pushq	%rax
	movq	-800032(%rbp), %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax
	movq	%r11, (%rbx)

	movq	-800024(%rbp), %rax

	movq	%rax, %r11
	movq	$1, %rax
	imulq	$8, %rax
	pushq	%rax
	movq	-800032(%rbp), %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax
	movq	%r11, (%rbx)

	movq	-800032(%rbp), %rax
	leave	
	ret	


	leave	
	ret	
value:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -800024(%rbp)
	subq	$800024, %rsp
	movq	$1, %rax
	imulq	$8, %rax
	pushq	%rax
	movq	-800024(%rbp), %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax
	leave	
	ret	


	leave	
	ret	
main:
	pushq	%rbp
	movq	%rsp, %rbp

	subq	$800024, %rsp
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	-800024(%rbp), %rax
	movq	%rax, %rdi
	call	car
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi
	movq	%rax, %rdi
	call	value
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi
	movq	%rax, %rdi
	call	print_long
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	call	print_nl
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	-800024(%rbp), %rax
	movq	%rax, %rdi
	call	cdr
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi
	movq	%rax, %rdi
	call	car
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi
	movq	%rax, %rdi
	call	value
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi
	movq	%rax, %rdi
	call	print_long
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	call	print_nl
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	-800024(%rbp), %rax
	movq	%rax, %rdi
	call	cdr
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi
	movq	%rax, %rdi
	call	cdr
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi
	movq	%rax, %rdi
	call	car
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi
	movq	%rax, %rdi
	call	value
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi
	movq	%rax, %rdi
	call	print_long
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	call	print_nl
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi


	leave	
	ret	
