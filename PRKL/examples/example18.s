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
IfStatement_7ff634018e80_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$0, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jle	COMP_FALSE_BinaryExpression_7ff633ff9668

COMP_TRUE_BinaryExpression_7ff633ff9668:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7ff633ff9668

COMP_FALSE_BinaryExpression_7ff633ff9668:
	movq	$0, %rax
COMP_END_BinaryExpression_7ff633ff9668:
	cmp	$0, %rax
	je	IfStatement_7ff634018e80_ELSE
IfStatement_7ff634018e80_THEN:
	subq	$16, %rsp
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

	movq	-16(%rbp), %rbx
	movq	(%rbx), %rax
	movq	%rax, -24(%rbp)

	subq	$24, %rsp
	movq	-8(%rbp), %rax

	movq	%rax, %r11
	movq	-24(%rbp), %rax
	imulq	%r11, %rax
	movq	%rax, -24(%rbp)

	movq	-24(%rbp), %rax

	movq	%rax, %r11
	movq	-16(%rbp), %rbx
	movq	(%rbx), %rax
	movq	%r11, (%rbx)


	jmp	IfStatement_7ff634018e80_END

IfStatement_7ff634018e80_ELSE:
IfStatement_7ff634018e80_END:


	leave	
	ret	
main:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	$0, -8(%rbp)

	movq	$0, -16(%rbp)

	subq	$16, %rsp
ForExpression_7ff63406f7f0_INIT:
	movq	$0, %rax

	movq	%rax, -8(%rbp)
ForExpression_7ff63406f7f0_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$10, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7ff63406f278

COMP_TRUE_BinaryExpression_7ff63406f278:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7ff63406f278

COMP_FALSE_BinaryExpression_7ff63406f278:
	movq	$0, %rax
COMP_END_BinaryExpression_7ff63406f278:
	cmp	$0, %rax
	je	ForExpression_7ff63406f7f0_END
ForExpression_7ff63406f7f0_BODY:
	subq	$16, %rsp
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

ForExpression_7ff63406f7f0_STEP:
	movq	-8(%rbp), %rax
	pushq	%rax
	incq	%rax
	movq	%rax, -8(%rbp)
	popq	%rax
	jmp	ForExpression_7ff63406f7f0_COND
ForExpression_7ff63406f7f0_END:


	leave	
	ret	
