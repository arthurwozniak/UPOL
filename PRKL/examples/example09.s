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
ForExpression_7fb4fbdea978_INIT:
ForExpression_7fb4fbdea978_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$0, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7fb4fbdea668

COMP_TRUE_BinaryExpression_7fb4fbdea668:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7fb4fbdea668

COMP_FALSE_BinaryExpression_7fb4fbdea668:
	movq	$0, %rax
COMP_END_BinaryExpression_7fb4fbdea668:
	cmp	$0, %rax
	je	NOT_FALSE_UnaryExpression_7fb4fbdea940

NOT_TRUE_UnaryExpression_7fb4fbdea940:
	movq	$0, %rax
	jmp	NOT_END_UnaryExpression_7fb4fbdea940

NOT_FALSE_UnaryExpression_7fb4fbdea940:
	movq	$1, %rax
NOT_END_UnaryExpression_7fb4fbdea940:
	cmp	$0, %rax
	je	ForExpression_7fb4fbdea978_END
ForExpression_7fb4fbdea978_BODY:
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

ForExpression_7fb4fbdea978_STEP:
	movq	-8(%rbp), %rax
	pushq	%rax
	decq	%rax
	movq	%rax, -8(%rbp)
	popq	%rax
	jmp	ForExpression_7fb4fbdea978_COND
ForExpression_7fb4fbdea978_END:

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
DoWhileExpression_7fb4fbdeabe0_BODY:
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

DoWhileExpression_7fb4fbdeabe0_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$0, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jl	COMP_FALSE_BinaryExpression_7fb4fbdeaac8

COMP_TRUE_BinaryExpression_7fb4fbdeaac8:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7fb4fbdeaac8

COMP_FALSE_BinaryExpression_7fb4fbdeaac8:
	movq	$0, %rax
COMP_END_BinaryExpression_7fb4fbdeaac8:
	cmp	$0, %rax
	je	DoWhileExpression_7fb4fbdeabe0_END
	jmp	DoWhileExpression_7fb4fbdeabe0_BODY
DoWhileExpression_7fb4fbdeabe0_END:

	addq	$8, %rsp

	movq	$0, %rax
	leave	
	ret	
