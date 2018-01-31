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
ForExpression_7fb87abd6208_INIT:
ForExpression_7fb87abd6208_COND:
ForExpression_7fb87abd6208_BODY:
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

IfStatement_7fb87abd6320_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$0, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jg	COMP_FALSE_BinaryExpression_7fb87abd62b0

COMP_TRUE_BinaryExpression_7fb87abd62b0:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7fb87abd62b0

COMP_FALSE_BinaryExpression_7fb87abd62b0:
	movq	$0, %rax
COMP_END_BinaryExpression_7fb87abd62b0:
	cmp	$0, %rax
	je	IfStatement_7fb87abd6320_ELSE
IfStatement_7fb87abd6320_THEN:
	subq	$16, %rsp
	jmp	ForExpression_7fb87abd6208_END

	jmp	IfStatement_7fb87abd6320_END

IfStatement_7fb87abd6320_ELSE:
IfStatement_7fb87abd6320_END:

ForExpression_7fb87abd6208_STEP:
	movq	-8(%rbp), %rax
	pushq	%rax
	decq	%rax
	movq	%rax, -8(%rbp)
	popq	%rax
	jmp	ForExpression_7fb87abd6208_COND
ForExpression_7fb87abd6208_END:

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
	movq	$0, -8(%rbp)

	subq	$8, %rsp
ForExpression_7fb87abd6438_INIT:
	movq	$1, %rax

	movq	%rax, -8(%rbp)
ForExpression_7fb87abd6438_COND:
ForExpression_7fb87abd6438_BODY:
	subq	$8, %rsp
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

IfStatement_7fb87abd62e8_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$10, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jle	COMP_FALSE_BinaryExpression_7fb87abd6780

COMP_TRUE_BinaryExpression_7fb87abd6780:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7fb87abd6780

COMP_FALSE_BinaryExpression_7fb87abd6780:
	movq	$0, %rax
COMP_END_BinaryExpression_7fb87abd6780:
	cmp	$0, %rax
	je	IfStatement_7fb87abd62e8_ELSE
IfStatement_7fb87abd62e8_THEN:
	subq	$8, %rsp
	jmp	ForExpression_7fb87abd6438_END

	jmp	IfStatement_7fb87abd62e8_END

IfStatement_7fb87abd62e8_ELSE:
IfStatement_7fb87abd62e8_END:

ForExpression_7fb87abd6438_STEP:
	jmp	ForExpression_7fb87abd6438_COND
ForExpression_7fb87abd6438_END:


	leave	
	ret	
