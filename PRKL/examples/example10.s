    .text
            .global main

            .type	main, @function
        .data 
line_of_stars:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	subq	$16, %rsp

	subq	$8, %rsp
	movq	-8(%rbp), %rax
	movq	%rax, -24(%rbp)
ForExpression_7f3b2adffb38_INIT:
ForExpression_7f3b2adffb38_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$0, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7f3b2adff9b0

COMP_TRUE_BinaryExpression_7f3b2adff9b0:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f3b2adff9b0

COMP_FALSE_BinaryExpression_7f3b2adff9b0:
	movq	$0, %rax
COMP_END_BinaryExpression_7f3b2adff9b0:
	cmp	$0, %rax
	je	NOT_FALSE_UnaryExpression_7f3b2adae1d0

NOT_TRUE_UnaryExpression_7f3b2adae1d0:
	movq	$0, %rax
	jmp	NOT_END_UnaryExpression_7f3b2adae1d0

NOT_FALSE_UnaryExpression_7f3b2adae1d0:
	movq	$1, %rax
NOT_END_UnaryExpression_7f3b2adae1d0:
	cmp	$0, %rax
	je	ForExpression_7f3b2adffb38_END
ForExpression_7f3b2adffb38_BODY:
IfStatement_7f3b2adffbe0_COND:
	movq	-16(%rbp), %rax

	cmp	$0, %rax
	jne	COMP_FALSE_BinaryExpression_7f3b2adff390

	movq	-8(%rbp), %rax

	pushq	%rax
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jne	COMP_FALSE_BinaryExpression_7f3b2adff588

COMP_TRUE_BinaryExpression_7f3b2adff588:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f3b2adff588

COMP_FALSE_BinaryExpression_7f3b2adff588:
	movq	$0, %rax
COMP_END_BinaryExpression_7f3b2adff588:
	jmp	COMP_END_BinaryExpression_7f3b2adff390

COMP_FALSE_BinaryExpression_7f3b2adff390:
	movq	$1, %rax
COMP_END_BinaryExpression_7f3b2adff390:

	cmp	$0, %rax
	jne	COMP_FALSE_BinaryExpression_7f3b2adff9e8

	movq	-8(%rbp), %rax
	cmp	$0, %rax
	je	NOT_FALSE_UnaryExpression_7f3b2adff5c0

NOT_TRUE_UnaryExpression_7f3b2adff5c0:
	movq	$0, %rax
	jmp	NOT_END_UnaryExpression_7f3b2adff5c0

NOT_FALSE_UnaryExpression_7f3b2adff5c0:
	movq	$1, %rax
NOT_END_UnaryExpression_7f3b2adff5c0:
	jmp	COMP_END_BinaryExpression_7f3b2adff9e8

COMP_FALSE_BinaryExpression_7f3b2adff9e8:
	movq	$1, %rax
COMP_END_BinaryExpression_7f3b2adff9e8:
	cmp	$0, %rax
	je	IfStatement_7f3b2adffbe0_ELSE
IfStatement_7f3b2adffbe0_THEN:
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

	jmp	ForExpression_7f3b2adffb38_STEP

	jmp	IfStatement_7f3b2adffbe0_END

IfStatement_7f3b2adffbe0_ELSE:
IfStatement_7f3b2adffbe0_END:

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$32, %rax
	movq	%rax, %rdi
	call	print_char
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

ForExpression_7f3b2adffb38_STEP:
	movq	-8(%rbp), %rax
	pushq	%rax
	decq	%rax
	movq	%rax, -8(%rbp)
	popq	%rax
	jmp	ForExpression_7f3b2adffb38_COND
ForExpression_7f3b2adffb38_END:

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


	subq	$16, %rsp
	movq	$9, -8(%rbp)
	movq	$1, -16(%rbp)
DoWhileExpression_7f3b2adae6a0_BODY:
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	call	line_of_stars
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	movq	$0, %rax

	movq	%rax, -16(%rbp)

	movq	-8(%rbp), %rax
	pushq	%rax
	decq	%rax
	movq	%rax, -8(%rbp)
	popq	%rax

DoWhileExpression_7f3b2adae6a0_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$0, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jl	COMP_FALSE_BinaryExpression_7f3b2ae107b8

COMP_TRUE_BinaryExpression_7f3b2ae107b8:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f3b2ae107b8

COMP_FALSE_BinaryExpression_7f3b2ae107b8:
	movq	$0, %rax
COMP_END_BinaryExpression_7f3b2ae107b8:
	cmp	$0, %rax
	je	DoWhileExpression_7f3b2adae6a0_END
	jmp	DoWhileExpression_7f3b2adae6a0_BODY
DoWhileExpression_7f3b2adae6a0_END:

	addq	$16, %rsp

	movq	$0, %rax
	leave	
	ret	
