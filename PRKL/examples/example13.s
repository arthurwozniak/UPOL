    .text
            .global main

            .type	main, @function
        .data 
fac:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	subq	$8, %rsp
IfStatement_7f78ac7a06a0_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$1, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jg	COMP_FALSE_BinaryExpression_7f78ac79cda0

COMP_TRUE_BinaryExpression_7f78ac79cda0:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f78ac79cda0

COMP_FALSE_BinaryExpression_7f78ac79cda0:
	movq	$0, %rax
COMP_END_BinaryExpression_7f78ac79cda0:
	cmp	$0, %rax
	je	IfStatement_7f78ac7a06a0_ELSE
IfStatement_7f78ac7a06a0_THEN:
	subq	$8, %rsp
	movq	$1, %rax
	leave	
	ret	

	jmp	IfStatement_7f78ac7a06a0_END

IfStatement_7f78ac7a06a0_ELSE:
	subq	$8, %rsp
	movq	-8(%rbp), %rax

	pushq	%rax
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$1, %rax
	movq	%rax, %rcx
	popq	%rax
	subq	%rcx, %rax
	movq	%rax, %rdi
	call	fac
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi
	movq	%rax, %rcx
	popq	%rax
	imulq	%rcx, %rax
	leave	
	ret	

IfStatement_7f78ac7a06a0_END:


	leave	
	ret	
main:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	$0, -8(%rbp)

	subq	$8, %rsp
ForExpression_7f78ac7abcc0_INIT:
	movq	$0, %rax

	movq	%rax, -8(%rbp)
ForExpression_7f78ac7abcc0_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$10, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7f78ac7a6470

COMP_TRUE_BinaryExpression_7f78ac7a6470:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f78ac7a6470

COMP_FALSE_BinaryExpression_7f78ac7a6470:
	movq	$0, %rax
COMP_END_BinaryExpression_7f78ac7a6470:
	cmp	$0, %rax
	je	ForExpression_7f78ac7abcc0_END
ForExpression_7f78ac7abcc0_BODY:
	subq	$8, %rsp
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fac
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi
	movq	%rax, %rdi
	call	print_long
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

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

ForExpression_7f78ac7abcc0_STEP:
	movq	-8(%rbp), %rax
	pushq	%rax
	incq	%rax
	movq	%rax, -8(%rbp)
	popq	%rax
	jmp	ForExpression_7f78ac7abcc0_COND
ForExpression_7f78ac7abcc0_END:


	leave	
	ret	
