    .text
            .global main

            .type	main, @function
        .data 
line_of_stars:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -24(%rbp)

	subq	$24, %rsp
ForExpression_7f8f5891b7f0_INIT:
ForExpression_7f8f5891b7f0_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$0, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7f8f5891bac8

COMP_TRUE_BinaryExpression_7f8f5891bac8:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f8f5891bac8

COMP_FALSE_BinaryExpression_7f8f5891bac8:
	movq	$0, %rax
COMP_END_BinaryExpression_7f8f5891bac8:
	cmp	$0, %rax
	je	NOT_FALSE_UnaryExpression_7f8f58918780

NOT_TRUE_UnaryExpression_7f8f58918780:
	movq	$0, %rax
	jmp	NOT_END_UnaryExpression_7f8f58918780

NOT_FALSE_UnaryExpression_7f8f58918780:
	movq	$1, %rax
NOT_END_UnaryExpression_7f8f58918780:
	cmp	$0, %rax
	je	ForExpression_7f8f5891b7f0_END
ForExpression_7f8f5891b7f0_BODY:
	subq	$24, %rsp
IfStatement_7f8f5891b550_COND:
	movq	-16(%rbp), %rax

	pushq	%rax
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jne	COMP_FALSE_BinaryExpression_7f8f5891b588

COMP_TRUE_BinaryExpression_7f8f5891b588:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f8f5891b588

COMP_FALSE_BinaryExpression_7f8f5891b588:
	movq	$0, %rax
COMP_END_BinaryExpression_7f8f5891b588:
	movq	%rax, %rcx
	popq	%rax
	orq	%rcx, %rax

	pushq	%rax
	movq	-8(%rbp), %rax
	cmp	$0, %rax
	je	NOT_FALSE_UnaryExpression_7f8f5891be48

NOT_TRUE_UnaryExpression_7f8f5891be48:
	movq	$0, %rax
	jmp	NOT_END_UnaryExpression_7f8f5891be48

NOT_FALSE_UnaryExpression_7f8f5891be48:
	movq	$1, %rax
NOT_END_UnaryExpression_7f8f5891be48:
	movq	%rax, %rcx
	popq	%rax
	orq	%rcx, %rax
	cmp	$0, %rax
	je	IfStatement_7f8f5891b550_ELSE
IfStatement_7f8f5891b550_THEN:
	subq	$24, %rsp
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

	jmp	ForExpression_7f8f5891b7f0_STEP

	jmp	IfStatement_7f8f5891b550_END

IfStatement_7f8f5891b550_ELSE:
IfStatement_7f8f5891b550_END:

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

ForExpression_7f8f5891b7f0_STEP:
	movq	-8(%rbp), %rax
	pushq	%rax
	decq	%rax
	movq	%rax, -8(%rbp)
	popq	%rax
	jmp	ForExpression_7f8f5891b7f0_COND
ForExpression_7f8f5891b7f0_END:

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

	movq	$1, -16(%rbp)

	subq	$16, %rsp
DoWhileExpression_7f8f5891ddd8_BODY:
	subq	$16, %rsp
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

DoWhileExpression_7f8f5891ddd8_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$0, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jl	COMP_FALSE_BinaryExpression_7f8f5891d198

COMP_TRUE_BinaryExpression_7f8f5891d198:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f8f5891d198

COMP_FALSE_BinaryExpression_7f8f5891d198:
	movq	$0, %rax
COMP_END_BinaryExpression_7f8f5891d198:
	cmp	$0, %rax
	je	DoWhileExpression_7f8f5891ddd8_END
	jmp	DoWhileExpression_7f8f5891ddd8_BODY
DoWhileExpression_7f8f5891ddd8_END:


	leave	
	ret	
