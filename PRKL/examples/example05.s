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
ForExpression_7fbf6ec3c358_INIT:
ForExpression_7fbf6ec3c358_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$0, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7fbf6ec3c6a0

COMP_TRUE_BinaryExpression_7fbf6ec3c6a0:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7fbf6ec3c6a0

COMP_FALSE_BinaryExpression_7fbf6ec3c6a0:
	movq	$0, %rax
COMP_END_BinaryExpression_7fbf6ec3c6a0:
	cmp	$0, %rax
	je	NOT_FALSE_UnaryExpression_7fbf6ec3f588

NOT_TRUE_UnaryExpression_7fbf6ec3f588:
	movq	$0, %rax
	jmp	NOT_END_UnaryExpression_7fbf6ec3f588

NOT_FALSE_UnaryExpression_7fbf6ec3f588:
	movq	$1, %rax
NOT_END_UnaryExpression_7fbf6ec3f588:
	cmp	$0, %rax
	je	ForExpression_7fbf6ec3c358_END
ForExpression_7fbf6ec3c358_BODY:
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

ForExpression_7fbf6ec3c358_STEP:
	movq	-8(%rbp), %rax
	pushq	%rax
	decq	%rax
	movq	%rax, -8(%rbp)
	popq	%rax
	jmp	ForExpression_7fbf6ec3c358_COND
ForExpression_7fbf6ec3c358_END:

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
	movq	$9, -8(%rbp)

	subq	$8, %rsp
WhileExpression_7fbf6ebcd978_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$0, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jl	COMP_FALSE_BinaryExpression_7fbf6ec3c5c0

COMP_TRUE_BinaryExpression_7fbf6ec3c5c0:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7fbf6ec3c5c0

COMP_FALSE_BinaryExpression_7fbf6ec3c5c0:
	movq	$0, %rax
COMP_END_BinaryExpression_7fbf6ec3c5c0:
	cmp	$0, %rax
	je	WhileExpression_7fbf6ebcd978_END
WhileExpression_7fbf6ebcd978_BODY:
	subq	$8, %rsp
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	-8(%rbp), %rax
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
	decq	%rax
	movq	%rax, -8(%rbp)
	popq	%rax

	jmp	WhileExpression_7fbf6ebcd978_COND
WhileExpression_7fbf6ebcd978_END:


	leave	
	ret	
