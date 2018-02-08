    .text
            .global main

            .type	main, @function
        .data 
fubar:
	pushq	%rbp
	movq	%rsp, %rbp

	subq	$8, %rsp
	movq	$0, -8(%rbp)
ForExpression_7fa62c5d4ef0_INIT:
	movq	$0, %rax

	movq	%rax, -8(%rbp)
ForExpression_7fa62c5d4ef0_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$4, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7fa62c5d4048

COMP_TRUE_BinaryExpression_7fa62c5d4048:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7fa62c5d4048

COMP_FALSE_BinaryExpression_7fa62c5d4048:
	movq	$0, %rax
COMP_END_BinaryExpression_7fa62c5d4048:
	cmp	$0, %rax
	je	ForExpression_7fa62c5d4ef0_END
ForExpression_7fa62c5d4ef0_BODY:
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$10, -96(%rbp)
	movq	$20, -88(%rbp)
	movq	$30, -80(%rbp)
	movq	$40, -72(%rbp)
	subq	$96, %rsp
	leaq	-96(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	imulq	$8, %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax
	addq	$32, %rsp
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
	movq	$10, -128(%rbp)
	movq	$20, -120(%rbp)
	movq	$30, -112(%rbp)
	movq	$40, -104(%rbp)
	subq	$128, %rsp
	leaq	-128(%rbp), %rax

	pushq	%rax
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$8, %rax
	movq	%rax, %rcx
	popq	%rax
	imulq	%rcx, %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax
	movq	(%rax), %rax
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

ForExpression_7fa62c5d4ef0_STEP:
	movq	-8(%rbp), %rax
	pushq	%rax
	incq	%rax
	movq	%rax, -8(%rbp)
	popq	%rax
	jmp	ForExpression_7fa62c5d4ef0_COND
ForExpression_7fa62c5d4ef0_END:

	addq	$8, %rsp

	movq	$0, %rax
	leave	
	ret	
main:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$72, -104(%rbp)
	movq	$101, -96(%rbp)
	movq	$108, -88(%rbp)
	movq	$108, -80(%rbp)
	movq	$111, -72(%rbp)
	movq	$44, -64(%rbp)
	movq	$32, -56(%rbp)
	movq	$87, -48(%rbp)
	movq	$111, -40(%rbp)
	movq	$114, -32(%rbp)
	movq	$108, -24(%rbp)
	movq	$100, -16(%rbp)
	movq	$33, -8(%rbp)
	subq	$104, %rsp
	leaq	-104(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	imulq	$8, %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax
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
	call	fubar
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	addq	$13, %rsp

	movq	$0, %rax
	leave	
	ret	
