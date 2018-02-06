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
ForExpression_7f49d1b04208_INIT:
ForExpression_7f49d1b04208_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$0, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7f49d1af8c18

COMP_TRUE_BinaryExpression_7f49d1af8c18:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f49d1af8c18

COMP_FALSE_BinaryExpression_7f49d1af8c18:
	movq	$0, %rax
COMP_END_BinaryExpression_7f49d1af8c18:
	cmp	$0, %rax
	je	NOT_FALSE_UnaryExpression_7f49d1af8c50

NOT_TRUE_UnaryExpression_7f49d1af8c50:
	movq	$0, %rax
	jmp	NOT_END_UnaryExpression_7f49d1af8c50

NOT_FALSE_UnaryExpression_7f49d1af8c50:
	movq	$1, %rax
NOT_END_UnaryExpression_7f49d1af8c50:
	cmp	$0, %rax
	je	ForExpression_7f49d1b04208_END
ForExpression_7f49d1b04208_BODY:
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

ForExpression_7f49d1b04208_STEP:
	movq	-8(%rbp), %rax
	pushq	%rax
	decq	%rax
	movq	%rax, -8(%rbp)
	popq	%rax
	jmp	ForExpression_7f49d1b04208_COND
ForExpression_7f49d1b04208_END:

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
	movq	$9, -8(%rbp)
WhileExpression_7f49d1b03cc0_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$0, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jl	COMP_FALSE_BinaryExpression_7f49d1b03d30

COMP_TRUE_BinaryExpression_7f49d1b03d30:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f49d1b03d30

COMP_FALSE_BinaryExpression_7f49d1b03d30:
	movq	$0, %rax
COMP_END_BinaryExpression_7f49d1b03d30:
	cmp	$0, %rax
	je	WhileExpression_7f49d1b03cc0_END
WhileExpression_7f49d1b03cc0_BODY:
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

	jmp	WhileExpression_7f49d1b03cc0_COND
WhileExpression_7f49d1b03cc0_END:

	addq	$8, %rsp

	movq	$0, %rax
	leave	
	ret	
