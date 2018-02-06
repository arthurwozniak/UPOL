    .text
            .global main

            .type	main, @function
        .data 
main:
	pushq	%rbp
	movq	%rsp, %rbp



	subq	$24, %rsp
	movq	$0, -8(%rbp)
	movq	$1, -16(%rbp)
	movq	$0, -24(%rbp)
ForExpression_7fae884b6eb8_INIT:
	movq	$0, %rax

	movq	%rax, -24(%rbp)
ForExpression_7fae884b6eb8_COND:
	movq	-24(%rbp), %rax

	pushq	%rax
	movq	$20, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7fae884b6b38

COMP_TRUE_BinaryExpression_7fae884b6b38:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7fae884b6b38

COMP_FALSE_BinaryExpression_7fae884b6b38:
	movq	$0, %rax
COMP_END_BinaryExpression_7fae884b6b38:
	cmp	$0, %rax
	je	ForExpression_7fae884b6eb8_END
ForExpression_7fae884b6eb8_BODY:

	subq	$8, %rsp
	movq	-16(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax

	movq	%rax, -16(%rbp)

	movq	-32(%rbp), %rax

	movq	%rax, -8(%rbp)

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	-8(%rbp), %rax
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

ForExpression_7fae884b6eb8_STEP:
	movq	-24(%rbp), %rax
	pushq	%rax
	incq	%rax
	movq	%rax, -24(%rbp)
	popq	%rax
	jmp	ForExpression_7fae884b6eb8_COND
ForExpression_7fae884b6eb8_END:

	addq	$24, %rsp

	movq	$0, %rax
	leave	
	ret	
