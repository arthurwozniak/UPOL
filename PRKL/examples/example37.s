    .text
            .global main

            .type	main, @function
        .data 
print_string:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	subq	$16, %rsp

	subq	$8, %rsp
	movq	$0, -24(%rbp)
ForExpression_7fd737e6b1d0_INIT:
	movq	$0, %rax

	movq	%rax, -24(%rbp)
ForExpression_7fd737e6b1d0_COND:
	movq	-24(%rbp), %rax

	pushq	%rax
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7fd737e6b048

COMP_TRUE_BinaryExpression_7fd737e6b048:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7fd737e6b048

COMP_FALSE_BinaryExpression_7fd737e6b048:
	movq	$0, %rax
COMP_END_BinaryExpression_7fd737e6b048:
	cmp	$0, %rax
	je	ForExpression_7fd737e6b1d0_END
ForExpression_7fd737e6b1d0_BODY:
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
	call	print_char
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

ForExpression_7fd737e6b1d0_STEP:
	movq	-24(%rbp), %rax
	pushq	%rax
	incq	%rax
	movq	%rax, -24(%rbp)
	popq	%rax
	jmp	ForExpression_7fd737e6b1d0_COND
ForExpression_7fd737e6b1d0_END:

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
	movq	%rax, %rdi
	movq	$13, %rax
	movq	%rax, %rsi
	call	print_string
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
	movq	$77, -208(%rbp)
	movq	$117, -200(%rbp)
	movq	$104, -192(%rbp)
	movq	$101, -184(%rbp)
	movq	$104, -176(%rbp)
	movq	$101, -168(%rbp)
	movq	$44, -160(%rbp)
	movq	$32, -152(%rbp)
	movq	$70, -144(%rbp)
	movq	$117, -136(%rbp)
	movq	$98, -128(%rbp)
	movq	$97, -120(%rbp)
	movq	$114, -112(%rbp)
	subq	$208, %rsp
	leaq	-208(%rbp), %rax
	movq	%rax, %rdi
	movq	$13, %rax
	movq	%rax, %rsi
	call	print_string
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	addq	$26, %rsp

	movq	$0, %rax
	leave	
	ret	
