    .text
            .global main

            .type	main, @function
        .data 
	heap:
		.zero 800000
	front:
		.quad heap
lalloc:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	subq	$8, %rsp

	subq	$8, %rsp
	movq	front, %rax
	movq	%rax, -16(%rbp)
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$8, %rax
	movq	%rax, %rcx
	popq	%rax
	imulq	%rcx, %rax

	pushq	%rax
	movq	front, %rax
	popq	%r11
	addq	%r11, %rax
	movq	%rax, front

	movq	-16(%rbp), %rax
	leave	
	ret	

	addq	$8, %rsp

	movq	$0, %rax
	leave	
	ret	
fill_array:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	subq	$24, %rsp

	subq	$8, %rsp
	movq	$0, -32(%rbp)
ForExpression_7f57980b5128_INIT:
	movq	$0, %rax

	movq	%rax, -32(%rbp)
ForExpression_7f57980b5128_COND:
	movq	-32(%rbp), %rax

	pushq	%rax
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7f57980b2d68

COMP_TRUE_BinaryExpression_7f57980b2d68:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f57980b2d68

COMP_FALSE_BinaryExpression_7f57980b2d68:
	movq	$0, %rax
COMP_END_BinaryExpression_7f57980b2d68:
	cmp	$0, %rax
	je	ForExpression_7f57980b5128_END
ForExpression_7f57980b5128_BODY:
	movq	-16(%rbp), %rax

	pushq	%rax
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax

	movq	%rax, %r11
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	-32(%rbp), %rax
	imulq	$8, %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax
	movq	%r11, (%rbx)

ForExpression_7f57980b5128_STEP:
	movq	-32(%rbp), %rax
	pushq	%rax
	incq	%rax
	movq	%rax, -32(%rbp)
	popq	%rax
	jmp	ForExpression_7f57980b5128_COND
ForExpression_7f57980b5128_END:

	addq	$8, %rsp

	movq	$0, %rax
	leave	
	ret	
print_comma:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$44, %rax
	movq	%rax, %rdi
	call	print_char
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
	movq	$32, %rax
	movq	%rax, %rdi
	call	print_char
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi


	movq	$0, %rax
	leave	
	ret	
print_array:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	subq	$16, %rsp

	subq	$8, %rsp
	movq	$0, -24(%rbp)
ForExpression_7f57980afa58_INIT:
	movq	$0, %rax

	movq	%rax, -24(%rbp)
ForExpression_7f57980afa58_COND:
	movq	-24(%rbp), %rax

	pushq	%rax
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7f57980b2550

COMP_TRUE_BinaryExpression_7f57980b2550:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f57980b2550

COMP_FALSE_BinaryExpression_7f57980b2550:
	movq	$0, %rax
COMP_END_BinaryExpression_7f57980b2550:
	cmp	$0, %rax
	je	ForExpression_7f57980afa58_END
ForExpression_7f57980afa58_BODY:
IfStatement_7f57980b2470_COND:
	movq	-24(%rbp), %rax
	cmp	$0, %rax
	je	IfStatement_7f57980b2470_ELSE
IfStatement_7f57980b2470_THEN:
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	call	print_comma
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	jmp	IfStatement_7f57980b2470_END

IfStatement_7f57980b2470_ELSE:
IfStatement_7f57980b2470_END:

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	-24(%rbp), %rax
	imulq	$8, %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax
	movq	%rax, %rdi
	call	print_long
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

ForExpression_7f57980afa58_STEP:
	movq	-24(%rbp), %rax
	pushq	%rax
	incq	%rax
	movq	%rax, -24(%rbp)
	popq	%rax
	jmp	ForExpression_7f57980afa58_COND
ForExpression_7f57980afa58_END:

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

	addq	$8, %rsp

	movq	$0, %rax
	leave	
	ret	
main:
	pushq	%rbp
	movq	%rsp, %rbp


	subq	$16, %rsp
	movq	$0, -8(%rbp)
	movq	$0, -16(%rbp)
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$10, %rax
	movq	%rax, %rdi
	call	lalloc
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	movq	%rax, -8(%rbp)

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$20, %rax
	movq	%rax, %rdi
	call	lalloc
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	movq	%rax, -16(%rbp)

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	movq	$666, %rax
	movq	%rax, %rsi
	movq	$10, %rax
	movq	%rax, %rdx
	call	fill_array
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
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	movq	$10, %rax
	movq	%rax, %rsi
	movq	$10, %rax
	movq	%rax, %rdx
	call	fill_array
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
	movq	-16(%rbp), %rax

	pushq	%rax
	movq	$10, %rax

	pushq	%rax
	movq	$8, %rax
	movq	%rax, %rcx
	popq	%rax
	imulq	%rcx, %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax
	movq	%rax, %rdi
	movq	$90, %rax
	movq	%rax, %rsi
	movq	$10, %rax
	movq	%rax, %rdx
	call	fill_array
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
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	movq	$30, %rax
	movq	%rax, %rsi
	call	print_array
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
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	movq	$20, %rax
	movq	%rax, %rsi
	call	print_array
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	addq	$16, %rsp

	movq	$0, %rax
	leave	
	ret	
