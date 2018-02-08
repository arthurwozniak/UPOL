    .text
            .global main

            .type	main, @function
        .data 
fac_iter:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	subq	$16, %rsp
IfStatement_7f96da24fb70_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$0, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jg	COMP_FALSE_BinaryExpression_7f96da24fdd8

COMP_TRUE_BinaryExpression_7f96da24fdd8:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f96da24fdd8

COMP_FALSE_BinaryExpression_7f96da24fdd8:
	movq	$0, %rax
COMP_END_BinaryExpression_7f96da24fdd8:
	cmp	$0, %rax
	je	IfStatement_7f96da24fb70_ELSE
IfStatement_7f96da24fb70_THEN:
	movq	-16(%rbp), %rax
	leave	
	ret	

	jmp	IfStatement_7f96da24fb70_END

IfStatement_7f96da24fb70_ELSE:
IfStatement_7f96da24fb70_END:

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

	pushq	%rax
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	popq	%rax
	imulq	%rcx, %rax
	movq	%rax, %rsi
	call	fac_iter
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi
	leave	
	ret	

	addq	$0, %rsp

	movq	$0, %rax
	leave	
	ret	
fac:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	subq	$8, %rsp
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	movq	$1, %rax
	movq	%rax, %rsi
	call	fac_iter
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi
	leave	
	ret	

	addq	$0, %rsp

	movq	$0, %rax
	leave	
	ret	
main:
	pushq	%rbp
	movq	%rsp, %rbp

	subq	$8, %rsp
	movq	$0, -8(%rbp)
ForExpression_7f96da249c18_INIT:
	movq	$0, %rax

	movq	%rax, -8(%rbp)
ForExpression_7f96da249c18_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$10, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7f96da2494e0

COMP_TRUE_BinaryExpression_7f96da2494e0:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f96da2494e0

COMP_FALSE_BinaryExpression_7f96da2494e0:
	movq	$0, %rax
COMP_END_BinaryExpression_7f96da2494e0:
	cmp	$0, %rax
	je	ForExpression_7f96da249c18_END
ForExpression_7f96da249c18_BODY:
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
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fac
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

ForExpression_7f96da249c18_STEP:
	movq	-8(%rbp), %rax
	pushq	%rax
	incq	%rax
	movq	%rax, -8(%rbp)
	popq	%rax
	jmp	ForExpression_7f96da249c18_COND
ForExpression_7f96da249c18_END:

	addq	$8, %rsp

	movq	$0, %rax
	leave	
	ret	
