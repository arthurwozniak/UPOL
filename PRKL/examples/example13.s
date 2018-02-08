    .text
            .global main

            .type	main, @function
        .data 
fac:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	subq	$8, %rsp
IfStatement_7fb5d5e0aac8_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$1, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jg	COMP_FALSE_BinaryExpression_7fb5d5e0ceb8

COMP_TRUE_BinaryExpression_7fb5d5e0ceb8:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7fb5d5e0ceb8

COMP_FALSE_BinaryExpression_7fb5d5e0ceb8:
	movq	$0, %rax
COMP_END_BinaryExpression_7fb5d5e0ceb8:
	cmp	$0, %rax
	je	IfStatement_7fb5d5e0aac8_ELSE
IfStatement_7fb5d5e0aac8_THEN:
	movq	$1, %rax
	leave	
	ret	

	jmp	IfStatement_7fb5d5e0aac8_END

IfStatement_7fb5d5e0aac8_ELSE:
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

IfStatement_7fb5d5e0aac8_END:

	addq	$0, %rsp

	movq	$0, %rax
	leave	
	ret	
main:
	pushq	%rbp
	movq	%rsp, %rbp

	subq	$8, %rsp
	movq	$0, -8(%rbp)
ForExpression_7fb5d5dd1e10_INIT:
	movq	$0, %rax

	movq	%rax, -8(%rbp)
ForExpression_7fb5d5dd1e10_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$10, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7fb5d5dc6550

COMP_TRUE_BinaryExpression_7fb5d5dc6550:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7fb5d5dc6550

COMP_FALSE_BinaryExpression_7fb5d5dc6550:
	movq	$0, %rax
COMP_END_BinaryExpression_7fb5d5dc6550:
	cmp	$0, %rax
	je	ForExpression_7fb5d5dd1e10_END
ForExpression_7fb5d5dd1e10_BODY:
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

ForExpression_7fb5d5dd1e10_STEP:
	movq	-8(%rbp), %rax
	pushq	%rax
	incq	%rax
	movq	%rax, -8(%rbp)
	popq	%rax
	jmp	ForExpression_7fb5d5dd1e10_COND
ForExpression_7fb5d5dd1e10_END:

	addq	$8, %rsp

	movq	$0, %rax
	leave	
	ret	
