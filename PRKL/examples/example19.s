    .text
            .global main

            .type	main, @function
        .data 
fib:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	subq	$8, %rsp
IfStatement_7f0d1549b9b0_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$1, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jg	COMP_FALSE_BinaryExpression_7f0d15490f98

COMP_TRUE_BinaryExpression_7f0d15490f98:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f0d15490f98

COMP_FALSE_BinaryExpression_7f0d15490f98:
	movq	$0, %rax
COMP_END_BinaryExpression_7f0d15490f98:
	cmp	$0, %rax
	je	IfStatement_7f0d1549b9b0_ELSE
IfStatement_7f0d1549b9b0_THEN:
	subq	$8, %rsp
	movq	-8(%rbp), %rax
	leave	
	ret	

	jmp	IfStatement_7f0d1549b9b0_END

IfStatement_7f0d1549b9b0_ELSE:
	subq	$8, %rsp
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
	call	fib
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	pushq	%rax
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$2, %rax
	movq	%rax, %rcx
	popq	%rax
	subq	%rcx, %rax
	movq	%rax, %rdi
	call	fib
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax
	leave	
	ret	

IfStatement_7f0d1549b9b0_END:


	leave	
	ret	
main:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	$0, -8(%rbp)

	subq	$8, %rsp
ForExpression_7f0d154a2b38_INIT:
	movq	$0, %rax

	movq	%rax, -8(%rbp)
ForExpression_7f0d154a2b38_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$15, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7f0d154a26d8

COMP_TRUE_BinaryExpression_7f0d154a26d8:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f0d154a26d8

COMP_FALSE_BinaryExpression_7f0d154a26d8:
	movq	$0, %rax
COMP_END_BinaryExpression_7f0d154a26d8:
	cmp	$0, %rax
	je	ForExpression_7f0d154a2b38_END
ForExpression_7f0d154a2b38_BODY:
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
	call	fib
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

ForExpression_7f0d154a2b38_STEP:
	movq	-8(%rbp), %rax
	pushq	%rax
	incq	%rax
	movq	%rax, -8(%rbp)
	popq	%rax
	jmp	ForExpression_7f0d154a2b38_COND
ForExpression_7f0d154a2b38_END:


	leave	
	ret	
