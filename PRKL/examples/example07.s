    .text
            .global main

            .type	main, @function
        .data 
line_of_stars:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	subq	$8, %rsp

	subq	$8, %rsp
	movq	$0, -16(%rbp)
ForExpression_7f9ab456f240_INIT:
ForExpression_7f9ab456f240_COND:
ForExpression_7f9ab456f240_BODY:
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$42, %rax
	movq	%rax, %rdi
	call	print_char
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

IfStatement_7f9ab456f198_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$0, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jg	COMP_FALSE_BinaryExpression_7f9ab456d470

COMP_TRUE_BinaryExpression_7f9ab456d470:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f9ab456d470

COMP_FALSE_BinaryExpression_7f9ab456d470:
	movq	$0, %rax
COMP_END_BinaryExpression_7f9ab456d470:
	cmp	$0, %rax
	je	IfStatement_7f9ab456f198_ELSE
IfStatement_7f9ab456f198_THEN:
	jmp	ForExpression_7f9ab456f240_END

	jmp	IfStatement_7f9ab456f198_END

IfStatement_7f9ab456f198_ELSE:
IfStatement_7f9ab456f198_END:

ForExpression_7f9ab456f240_STEP:
	movq	-8(%rbp), %rax
	pushq	%rax
	decq	%rax
	movq	%rax, -8(%rbp)
	popq	%rax
	jmp	ForExpression_7f9ab456f240_COND
ForExpression_7f9ab456f240_END:

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

	subq	$8, %rsp
	movq	$0, -8(%rbp)
ForExpression_7f9ab456f5f8_INIT:
	movq	$1, %rax

	movq	%rax, -8(%rbp)
ForExpression_7f9ab456f5f8_COND:
ForExpression_7f9ab456f5f8_BODY:
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$10, %rax

	pushq	%rax
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	popq	%rax
	subq	%rcx, %rax
	movq	%rax, %rdi
	call	line_of_stars
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	movq	-8(%rbp), %rax
	pushq	%rax
	incq	%rax
	movq	%rax, -8(%rbp)
	popq	%rax

IfStatement_7f9ab456f320_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$10, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jle	COMP_FALSE_BinaryExpression_7f9ab456ffd0

COMP_TRUE_BinaryExpression_7f9ab456ffd0:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f9ab456ffd0

COMP_FALSE_BinaryExpression_7f9ab456ffd0:
	movq	$0, %rax
COMP_END_BinaryExpression_7f9ab456ffd0:
	cmp	$0, %rax
	je	IfStatement_7f9ab456f320_ELSE
IfStatement_7f9ab456f320_THEN:
	jmp	ForExpression_7f9ab456f5f8_END

	jmp	IfStatement_7f9ab456f320_END

IfStatement_7f9ab456f320_ELSE:
IfStatement_7f9ab456f320_END:

ForExpression_7f9ab456f5f8_STEP:
	jmp	ForExpression_7f9ab456f5f8_COND
ForExpression_7f9ab456f5f8_END:

	addq	$8, %rsp

	movq	$0, %rax
	leave	
	ret	
