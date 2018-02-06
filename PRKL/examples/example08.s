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
ForExpression_7f60219302e8_INIT:
ForExpression_7f60219302e8_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$0, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7f6021930ba8

COMP_TRUE_BinaryExpression_7f6021930ba8:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f6021930ba8

COMP_FALSE_BinaryExpression_7f6021930ba8:
	movq	$0, %rax
COMP_END_BinaryExpression_7f6021930ba8:
	cmp	$0, %rax
	je	NOT_FALSE_UnaryExpression_7f6021930550

NOT_TRUE_UnaryExpression_7f6021930550:
	movq	$0, %rax
	jmp	NOT_END_UnaryExpression_7f6021930550

NOT_FALSE_UnaryExpression_7f6021930550:
	movq	$1, %rax
NOT_END_UnaryExpression_7f6021930550:
	cmp	$0, %rax
	je	ForExpression_7f60219302e8_END
ForExpression_7f60219302e8_BODY:
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

ForExpression_7f60219302e8_STEP:
	movq	-8(%rbp), %rax
	pushq	%rax
	decq	%rax
	movq	%rax, -8(%rbp)
	popq	%rax
	jmp	ForExpression_7f60219302e8_COND
ForExpression_7f60219302e8_END:

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
WhileExpression_7f602194b748_COND:
	movq	$666, %rax
	cmp	$0, %rax
	je	WhileExpression_7f602194b748_END
WhileExpression_7f602194b748_BODY:
IfStatement_7f6021978748_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$0, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jl	COMP_FALSE_BinaryExpression_7f6021978828

COMP_TRUE_BinaryExpression_7f6021978828:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f6021978828

COMP_FALSE_BinaryExpression_7f6021978828:
	movq	$0, %rax
COMP_END_BinaryExpression_7f6021978828:
	cmp	$0, %rax
	je	IfStatement_7f6021978748_ELSE
IfStatement_7f6021978748_THEN:
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

	jmp	IfStatement_7f6021978748_END

IfStatement_7f6021978748_ELSE:
	jmp	WhileExpression_7f602194b748_END

IfStatement_7f6021978748_END:

	jmp	WhileExpression_7f602194b748_COND
WhileExpression_7f602194b748_END:

	addq	$8, %rsp

	movq	$0, %rax
	leave	
	ret	
