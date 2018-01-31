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
IfStatement_7f03d5839eb8_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$0, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jle	COMP_FALSE_BinaryExpression_7f03d5839908

COMP_TRUE_BinaryExpression_7f03d5839908:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f03d5839908

COMP_FALSE_BinaryExpression_7f03d5839908:
	movq	$0, %rax
COMP_END_BinaryExpression_7f03d5839908:
	cmp	$0, %rax
	je	IfStatement_7f03d5839eb8_ELSE
IfStatement_7f03d5839eb8_THEN:
	subq	$16, %rsp
	movq	-8(%rbp), %rax

	movq	%rax, %r11
	movq	-16(%rbp), %rbx
	movq	(%rbx), %rax
	imulq	%r11, %rax
	movq	%rax, (%rbx)

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

	jmp	IfStatement_7f03d5839eb8_END

IfStatement_7f03d5839eb8_ELSE:
IfStatement_7f03d5839eb8_END:


	leave	
	ret	
main:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	$0, -8(%rbp)

	movq	$0, -16(%rbp)

	subq	$16, %rsp
ForExpression_7f03d582d390_INIT:
	movq	$0, %rax

	movq	%rax, -8(%rbp)
ForExpression_7f03d582d390_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$10, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7f03d582da20

COMP_TRUE_BinaryExpression_7f03d582da20:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f03d582da20

COMP_FALSE_BinaryExpression_7f03d582da20:
	movq	$0, %rax
COMP_END_BinaryExpression_7f03d582da20:
	cmp	$0, %rax
	je	ForExpression_7f03d582d390_END
ForExpression_7f03d582d390_BODY:
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

ForExpression_7f03d582d390_STEP:
	movq	-8(%rbp), %rax
	pushq	%rax
	incq	%rax
	movq	%rax, -8(%rbp)
	popq	%rax
	jmp	ForExpression_7f03d582d390_COND
ForExpression_7f03d582d390_END:


	leave	
	ret	
