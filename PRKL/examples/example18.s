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
IfStatement_7f095b7f3780_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$0, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jle	COMP_FALSE_BinaryExpression_7f095b8389e8

COMP_TRUE_BinaryExpression_7f095b8389e8:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f095b8389e8

COMP_FALSE_BinaryExpression_7f095b8389e8:
	movq	$0, %rax
COMP_END_BinaryExpression_7f095b8389e8:
	cmp	$0, %rax
	je	IfStatement_7f095b7f3780_ELSE
IfStatement_7f095b7f3780_THEN:
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


	subq	$8, %rsp
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	-24(%rbp), %rax
	popq	%r11
	imulq	%r11, %rax
	movq	%rax, -24(%rbp)

	movq	-24(%rbp), %rax

	movq	%rax, %r11
	movq	-16(%rbp), %rax
	movq	%r11, (%rax)


	jmp	IfStatement_7f095b7f3780_END

IfStatement_7f095b7f3780_ELSE:
IfStatement_7f095b7f3780_END:

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
ForExpression_7f095b7dde48_INIT:
	movq	$0, %rax

	movq	%rax, -8(%rbp)
ForExpression_7f095b7dde48_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$10, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7f095b7ddb38

COMP_TRUE_BinaryExpression_7f095b7ddb38:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f095b7ddb38

COMP_FALSE_BinaryExpression_7f095b7ddb38:
	movq	$0, %rax
COMP_END_BinaryExpression_7f095b7ddb38:
	cmp	$0, %rax
	je	ForExpression_7f095b7dde48_END
ForExpression_7f095b7dde48_BODY:
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

ForExpression_7f095b7dde48_STEP:
	movq	-8(%rbp), %rax
	pushq	%rax
	incq	%rax
	movq	%rax, -8(%rbp)
	popq	%rax
	jmp	ForExpression_7f095b7dde48_COND
ForExpression_7f095b7dde48_END:

	addq	$16, %rsp

	movq	$0, %rax
	leave	
	ret	
