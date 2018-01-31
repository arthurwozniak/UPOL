    .text
            .global main

            .type	main, @function
print_string:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	subq	$24, %rsp
	movq	$0, -24(%rbp)

ForExpression_7f7d150ff080_INIT:
	movq	$0, %rax

	movq	%rax, -24(%rbp)
ForExpression_7f7d150ff080_COND:
	movq	-24(%rbp), %rax

	pushq	%rax
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7f7d150e7c50

COMP_TRUE_BinaryExpression_7f7d150e7c50:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f7d150e7c50

COMP_FALSE_BinaryExpression_7f7d150e7c50:
	movq	$0, %rax
COMP_END_BinaryExpression_7f7d150e7c50:
	cmp	$0, %rax
	je	ForExpression_7f7d150ff080_END
ForExpression_7f7d150ff080_BODY:
	subq	$24, %rsp
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	-24(%rbp), %rax
	imulq	$8, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax
	movq	%rax, %rdi
	call	print_char
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

ForExpression_7f7d150ff080_STEP:
	movq	-24(%rbp), %rax
	incq	%rax
	movq	%rax, -24(%rbp)
	jmp	ForExpression_7f7d150ff080_COND
ForExpression_7f7d150ff080_END:

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
	subq	$0, %rsp
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	%rax, %rdi
	movq	$13, %rax
	movq	%rax, %rsi
	call	print_string
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi


	leave	
	ret	
