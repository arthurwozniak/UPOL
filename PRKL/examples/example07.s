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
ForExpression_7fef26b597b8_INIT:
ForExpression_7fef26b597b8_COND:
ForExpression_7fef26b597b8_BODY:
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

IfStatement_7fef26b59eb8_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$0, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jg	COMP_FALSE_BinaryExpression_7fef26b59438

COMP_TRUE_BinaryExpression_7fef26b59438:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7fef26b59438

COMP_FALSE_BinaryExpression_7fef26b59438:
	movq	$0, %rax
COMP_END_BinaryExpression_7fef26b59438:
	cmp	$0, %rax
	je	IfStatement_7fef26b59eb8_ELSE
IfStatement_7fef26b59eb8_THEN:
	jmp	ForExpression_7fef26b597b8_END

	jmp	IfStatement_7fef26b59eb8_END

IfStatement_7fef26b59eb8_ELSE:
IfStatement_7fef26b59eb8_END:

ForExpression_7fef26b597b8_STEP:
	movq	-8(%rbp), %rax
	pushq	%rax
	decq	%rax
	movq	%rax, -8(%rbp)
	popq	%rax
	jmp	ForExpression_7fef26b597b8_COND
ForExpression_7fef26b597b8_END:

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
	movq	$0, -8(%rbp)
ForExpression_7fef26b55ef0_INIT:
	movq	$1, %rax

	movq	%rax, -8(%rbp)
ForExpression_7fef26b55ef0_COND:
ForExpression_7fef26b55ef0_BODY:
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

	movq	-8(%rbp), %rax
	pushq	%rax
	incq	%rax
	movq	%rax, -8(%rbp)
	popq	%rax

IfStatement_7fef26b55b00_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$10, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jle	COMP_FALSE_BinaryExpression_7fef26b55ba8

COMP_TRUE_BinaryExpression_7fef26b55ba8:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7fef26b55ba8

COMP_FALSE_BinaryExpression_7fef26b55ba8:
	movq	$0, %rax
COMP_END_BinaryExpression_7fef26b55ba8:
	cmp	$0, %rax
	je	IfStatement_7fef26b55b00_ELSE
IfStatement_7fef26b55b00_THEN:
	jmp	ForExpression_7fef26b55ef0_END

	jmp	IfStatement_7fef26b55b00_END

IfStatement_7fef26b55b00_ELSE:
IfStatement_7fef26b55b00_END:

ForExpression_7fef26b55ef0_STEP:
	jmp	ForExpression_7fef26b55ef0_COND
ForExpression_7fef26b55ef0_END:

	addq	$8, %rsp

	movq	$0, %rax
	leave	
	ret	
