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
ForExpression_7f87c5a52f60_INIT:
ForExpression_7f87c5a52f60_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$0, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7f87c5aa68d0

COMP_TRUE_BinaryExpression_7f87c5aa68d0:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f87c5aa68d0

COMP_FALSE_BinaryExpression_7f87c5aa68d0:
	movq	$0, %rax
COMP_END_BinaryExpression_7f87c5aa68d0:
	cmp	$0, %rax
	je	NOT_FALSE_UnaryExpression_7f87c5aa6080

NOT_TRUE_UnaryExpression_7f87c5aa6080:
	movq	$0, %rax
	jmp	NOT_END_UnaryExpression_7f87c5aa6080

NOT_FALSE_UnaryExpression_7f87c5aa6080:
	movq	$1, %rax
NOT_END_UnaryExpression_7f87c5aa6080:
	cmp	$0, %rax
	je	ForExpression_7f87c5a52f60_END
ForExpression_7f87c5a52f60_BODY:
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

ForExpression_7f87c5a52f60_STEP:
	movq	-8(%rbp), %rax
	pushq	%rax
	decq	%rax
	movq	%rax, -8(%rbp)
	popq	%rax
	jmp	ForExpression_7f87c5a52f60_COND
ForExpression_7f87c5a52f60_END:

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
WhileExpression_7f87c5a7a240_COND:
	movq	$666, %rax
	cmp	$0, %rax
	je	WhileExpression_7f87c5a7a240_END
WhileExpression_7f87c5a7a240_BODY:
	subq	$8, %rsp
IfStatement_7f87c5a7a828_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$0, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jl	COMP_FALSE_BinaryExpression_7f87c5a7a630

COMP_TRUE_BinaryExpression_7f87c5a7a630:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f87c5a7a630

COMP_FALSE_BinaryExpression_7f87c5a7a630:
	movq	$0, %rax
COMP_END_BinaryExpression_7f87c5a7a630:
	cmp	$0, %rax
	je	IfStatement_7f87c5a7a828_ELSE
IfStatement_7f87c5a7a828_THEN:
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

	jmp	IfStatement_7f87c5a7a828_END

IfStatement_7f87c5a7a828_ELSE:
	subq	$8, %rsp
	jmp	WhileExpression_7f87c5a7a240_END

IfStatement_7f87c5a7a828_END:

	jmp	WhileExpression_7f87c5a7a240_COND
WhileExpression_7f87c5a7a240_END:


	leave	
	ret	
