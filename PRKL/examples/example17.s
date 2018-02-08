    .text
            .global main

            .type	main, @function
        .data 
fac:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	subq	$16, %rsp
IfStatement_7f7a09830470_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$0, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jle	COMP_FALSE_BinaryExpression_7f7a097fa4a8

COMP_TRUE_BinaryExpression_7f7a097fa4a8:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f7a097fa4a8

COMP_FALSE_BinaryExpression_7f7a097fa4a8:
	movq	$0, %rax
COMP_END_BinaryExpression_7f7a097fa4a8:
	cmp	$0, %rax
	je	IfStatement_7f7a09830470_ELSE
IfStatement_7f7a09830470_THEN:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	popq	%r11
	imulq	%r11, %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rbx
	movq	%rbx, (%rax)

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$1, %rax
	movq	%rax, %rcx
	popq	%rax
	subq	%rcx, %rax
	movq	%rax, %rdi
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	call	fac
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	jmp	IfStatement_7f7a09830470_END

IfStatement_7f7a09830470_ELSE:
IfStatement_7f7a09830470_END:

	addq	$0, %rsp

	movq	$0, %rax
	leave	
	ret	
main:
	pushq	%rbp
	movq	%rsp, %rbp


	subq	$16, %rsp
	movq	$0, -8(%rbp)
	movq	$0, -16(%rbp)
ForExpression_7f7a098562e8_INIT:
	movq	$0, %rax

	movq	%rax, -8(%rbp)
ForExpression_7f7a098562e8_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$10, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7f7a097eafd0

COMP_TRUE_BinaryExpression_7f7a097eafd0:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f7a097eafd0

COMP_FALSE_BinaryExpression_7f7a097eafd0:
	movq	$0, %rax
COMP_END_BinaryExpression_7f7a097eafd0:
	cmp	$0, %rax
	je	ForExpression_7f7a098562e8_END
ForExpression_7f7a098562e8_BODY:
	movq	$1, %rax

	movq	%rax, -16(%rbp)

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	call	fac
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

ForExpression_7f7a098562e8_STEP:
	movq	-8(%rbp), %rax
	pushq	%rax
	incq	%rax
	movq	%rax, -8(%rbp)
	popq	%rax
	jmp	ForExpression_7f7a098562e8_COND
ForExpression_7f7a098562e8_END:

	addq	$16, %rsp

	movq	$0, %rax
	leave	
	ret	
