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
ForExpression_7fb857aa1240_INIT:
ForExpression_7fb857aa1240_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$0, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7fb857aa16a0

COMP_TRUE_BinaryExpression_7fb857aa16a0:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7fb857aa16a0

COMP_FALSE_BinaryExpression_7fb857aa16a0:
	movq	$0, %rax
COMP_END_BinaryExpression_7fb857aa16a0:
	cmp	$0, %rax
	je	NOT_FALSE_UnaryExpression_7fb857aa1c18

NOT_TRUE_UnaryExpression_7fb857aa1c18:
	movq	$0, %rax
	jmp	NOT_END_UnaryExpression_7fb857aa1c18

NOT_FALSE_UnaryExpression_7fb857aa1c18:
	movq	$1, %rax
NOT_END_UnaryExpression_7fb857aa1c18:
	cmp	$0, %rax
	je	ForExpression_7fb857aa1240_END
ForExpression_7fb857aa1240_BODY:
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

ForExpression_7fb857aa1240_STEP:
	movq	-8(%rbp), %rax
	pushq	%rax
	decq	%rax
	movq	%rax, -8(%rbp)
	popq	%rax
	jmp	ForExpression_7fb857aa1240_COND
ForExpression_7fb857aa1240_END:

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
DoWhileExpression_7fb857b02f60_BODY:
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

DoWhileExpression_7fb857b02f60_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$0, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jl	COMP_FALSE_BinaryExpression_7fb857b02940

COMP_TRUE_BinaryExpression_7fb857b02940:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7fb857b02940

COMP_FALSE_BinaryExpression_7fb857b02940:
	movq	$0, %rax
COMP_END_BinaryExpression_7fb857b02940:
	cmp	$0, %rax
	je	DoWhileExpression_7fb857b02f60_END
	jmp	DoWhileExpression_7fb857b02f60_BODY
DoWhileExpression_7fb857b02f60_END:


	leave	
	ret	
