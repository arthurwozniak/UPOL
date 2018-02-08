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
ForExpression_7f2415564320_INIT:
ForExpression_7f2415564320_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$0, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7f241555c5c0

COMP_TRUE_BinaryExpression_7f241555c5c0:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f241555c5c0

COMP_FALSE_BinaryExpression_7f241555c5c0:
	movq	$0, %rax
COMP_END_BinaryExpression_7f241555c5c0:
	cmp	$0, %rax
	je	NOT_FALSE_UnaryExpression_7f241555c9e8

NOT_TRUE_UnaryExpression_7f241555c9e8:
	movq	$0, %rax
	jmp	NOT_END_UnaryExpression_7f241555c9e8

NOT_FALSE_UnaryExpression_7f241555c9e8:
	movq	$1, %rax
NOT_END_UnaryExpression_7f241555c9e8:
	cmp	$0, %rax
	je	ForExpression_7f2415564320_END
ForExpression_7f2415564320_BODY:
IfStatement_7f2415564ba8_COND:
	movq	-16(%rbp), %rax

	cmp	$0, %rax
	jne	COMP_FALSE_BinaryExpression_7f241555c9b0

	movq	-8(%rbp), %rax

	pushq	%rax
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jne	COMP_FALSE_BinaryExpression_7f241555c898

COMP_TRUE_BinaryExpression_7f241555c898:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f241555c898

COMP_FALSE_BinaryExpression_7f241555c898:
	movq	$0, %rax
COMP_END_BinaryExpression_7f241555c898:
	jmp	COMP_END_BinaryExpression_7f241555c9b0

COMP_FALSE_BinaryExpression_7f241555c9b0:
	movq	$1, %rax
COMP_END_BinaryExpression_7f241555c9b0:

	cmp	$0, %rax
	jne	COMP_FALSE_BinaryExpression_7f2415564588

	movq	-8(%rbp), %rax
	cmp	$0, %rax
	je	NOT_FALSE_UnaryExpression_7f241555c780

NOT_TRUE_UnaryExpression_7f241555c780:
	movq	$0, %rax
	jmp	NOT_END_UnaryExpression_7f241555c780

NOT_FALSE_UnaryExpression_7f241555c780:
	movq	$1, %rax
NOT_END_UnaryExpression_7f241555c780:
	jmp	COMP_END_BinaryExpression_7f2415564588

COMP_FALSE_BinaryExpression_7f2415564588:
	movq	$1, %rax
COMP_END_BinaryExpression_7f2415564588:
	cmp	$0, %rax
	je	IfStatement_7f2415564ba8_ELSE
IfStatement_7f2415564ba8_THEN:
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

	jmp	ForExpression_7f2415564320_STEP

	jmp	IfStatement_7f2415564ba8_END

IfStatement_7f2415564ba8_ELSE:
IfStatement_7f2415564ba8_END:

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

ForExpression_7f2415564320_STEP:
	movq	-8(%rbp), %rax
	pushq	%rax
	decq	%rax
	movq	%rax, -8(%rbp)
	popq	%rax
	jmp	ForExpression_7f2415564320_COND
ForExpression_7f2415564320_END:

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
DoWhileExpression_7f241555c588_BODY:
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

DoWhileExpression_7f241555c588_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$0, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jl	COMP_FALSE_BinaryExpression_7f24155b72b0

COMP_TRUE_BinaryExpression_7f24155b72b0:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f24155b72b0

COMP_FALSE_BinaryExpression_7f24155b72b0:
	movq	$0, %rax
COMP_END_BinaryExpression_7f24155b72b0:
	cmp	$0, %rax
	je	DoWhileExpression_7f241555c588_END
	jmp	DoWhileExpression_7f241555c588_BODY
DoWhileExpression_7f241555c588_END:

	addq	$16, %rsp

	movq	$0, %rax
	leave	
	ret	
