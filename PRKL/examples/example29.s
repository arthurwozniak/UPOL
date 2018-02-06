    .text
            .global main

            .type	main, @function
        .data 
main:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$10, %rax

	pushq	%rax
	movq	$20, %rax

	pushq	%rax
	movq	$30, %rax
	movq	%rax, %rcx
	popq	%rax
	imulq	%rcx, %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax
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

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$10, %rax

	pushq	%rax
	movq	$20, %rax
	movq	%rax, %rcx
	popq	%rax
	imulq	%rcx, %rax

	pushq	%rax
	movq	$30, %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax
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

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$5, %rax

	pushq	%rax
	movq	$6, %rax

	pushq	%rax
	movq	$7, %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax
	movq	%rax, %rcx
	popq	%rax
	cltq	
	salq	%cl, %rax
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

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$5, %rax

	pushq	%rax
	movq	$6, %rax
	movq	%rax, %rcx
	popq	%rax
	cltq	
	salq	%cl, %rax

	pushq	%rax
	movq	$7, %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax
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

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$50000, %rax

	pushq	%rax
	movq	$6, %rax

	pushq	%rax
	movq	$2, %rax
	movq	%rax, %rcx
	popq	%rax
	imulq	%rcx, %rax
	movq	%rax, %rcx
	popq	%rax
	cltq	
	sarq	%cl, %rax
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

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$50000, %rax

	pushq	%rax
	movq	$6, %rax
	movq	%rax, %rcx
	popq	%rax
	cltq	
	sarq	%cl, %rax

	pushq	%rax
	movq	$2, %rax
	movq	%rax, %rcx
	popq	%rax
	imulq	%rcx, %rax
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

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$10, %rax

	pushq	%rax
	movq	$3, %rax
	movq	%rax, %rbx
	popq	%rax
	cqto	
	idivq	%rbx
	movq	%rdx, %rax

	pushq	%rax
	movq	$1, %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax
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

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$10, %rax

	pushq	%rax
	movq	$3, %rax
	movq	%rax, %rbx
	popq	%rax
	cqto	
	idivq	%rbx
	movq	%rdx, %rax

	pushq	%rax
	movq	$10, %rax
	movq	%rax, %rcx
	popq	%rax
	imulq	%rcx, %rax
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

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$10, %rax

	pushq	%rax
	movq	$10, %rax
	movq	%rax, %rcx
	popq	%rax
	imulq	%rcx, %rax

	pushq	%rax
	movq	$3, %rax
	movq	%rax, %rbx
	popq	%rax
	cqto	
	idivq	%rbx
	movq	%rdx, %rax
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

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$66, %rax

	pushq	%rax
	movq	$10, %rax
	movq	%rax, %rcx
	popq	%rax
	imulq	%rcx, %rax

	pushq	%rax
	movq	$10, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jne	COMP_FALSE_BinaryExpression_7f3794d826a0

COMP_TRUE_BinaryExpression_7f3794d826a0:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f3794d826a0

COMP_FALSE_BinaryExpression_7f3794d826a0:
	movq	$0, %rax
COMP_END_BinaryExpression_7f3794d826a0:
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

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$66, %rax

	pushq	%rax
	movq	$10, %rax

	pushq	%rax
	movq	$10, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jne	COMP_FALSE_BinaryExpression_7f3794d827f0

COMP_TRUE_BinaryExpression_7f3794d827f0:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f3794d827f0

COMP_FALSE_BinaryExpression_7f3794d827f0:
	movq	$0, %rax
COMP_END_BinaryExpression_7f3794d827f0:
	movq	%rax, %rcx
	popq	%rax
	imulq	%rcx, %rax
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


	movq	$0, %rax
	leave	
	ret	
