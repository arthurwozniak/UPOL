    .text
            .global main

            .type	main, @function
        .data 
line_of_stars:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	$0, -16(%rbp)

	subq	$16, %rsp
ForExpression_7f6fbd51b080_INIT:
ForExpression_7f6fbd51b080_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$0, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7f6fbd51b128

COMP_TRUE_BinaryExpression_7f6fbd51b128:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f6fbd51b128

COMP_FALSE_BinaryExpression_7f6fbd51b128:
	movq	$0, %rax
COMP_END_BinaryExpression_7f6fbd51b128:
	cmp	$0, %rax
	je	NOT_FALSE_UnaryExpression_7f6fbd517e48

NOT_TRUE_UnaryExpression_7f6fbd517e48:
	movq	$0, %rax
	jmp	NOT_END_UnaryExpression_7f6fbd517e48

NOT_FALSE_UnaryExpression_7f6fbd517e48:
	movq	$1, %rax
NOT_END_UnaryExpression_7f6fbd517e48:
	cmp	$0, %rax
	je	ForExpression_7f6fbd51b080_END
ForExpression_7f6fbd51b080_BODY:
	subq	$16, %rsp
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

ForExpression_7f6fbd51b080_STEP:
	movq	-8(%rbp), %rax
	pushq	%rax
	decq	%rax
	movq	%rax, -8(%rbp)
	popq	%rax
	jmp	ForExpression_7f6fbd51b080_COND
ForExpression_7f6fbd51b080_END:

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
main:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	$0, -8(%rbp)

	subq	$8, %rsp
ForExpression_7f6fbd51bb38_INIT:
	movq	$1, %rax

	movq	%rax, -8(%rbp)
ForExpression_7f6fbd51bb38_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$10, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jg	COMP_FALSE_BinaryExpression_7f6fbd51b940

COMP_TRUE_BinaryExpression_7f6fbd51b940:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f6fbd51b940

COMP_FALSE_BinaryExpression_7f6fbd51b940:
	movq	$0, %rax
COMP_END_BinaryExpression_7f6fbd51b940:
	cmp	$0, %rax
	je	ForExpression_7f6fbd51bb38_END
ForExpression_7f6fbd51bb38_BODY:
	subq	$8, %rsp
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

ForExpression_7f6fbd51bb38_STEP:
	movq	-8(%rbp), %rax
	pushq	%rax
	incq	%rax
	movq	%rax, -8(%rbp)
	popq	%rax
	jmp	ForExpression_7f6fbd51bb38_COND
ForExpression_7f6fbd51bb38_END:


	leave	
	ret	
