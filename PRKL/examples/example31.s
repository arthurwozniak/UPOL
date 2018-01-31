    .text
            .global main

            .type	main, @function
main:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$40, %rsp
	movq	$0, -8(%rbp)

	movq	$20, -16(%rbp)

	movq	$30, -24(%rbp)

	movq	$0, -32(%rbp)

	movq	$0, -40(%rbp)

	movq	$10, %rax

	movq	%rax, -8(%rbp)

	movq	-16(%rbp), %rax

	pushq	%rax
	movq	$2, %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax

	movq	%rax, %r11
	movq	-8(%rbp), %rax
	imulq	%r11, %rax
	movq	%rax, -8(%rbp)

	movq	-16(%rbp), %rax

	pushq	%rax
	movq	$16, %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax

	movq	-24(%rbp), %rax

	pushq	%rax
	movq	$5, %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax

	movq	-16(%rbp), %rax

	pushq	%rax
	movq	$1, %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax

	movq	-8(%rbp), %rax
	incq	%rax
	movq	%rax, -8(%rbp)


	movq	-16(%rbp), %rax
	decq	%rax
	movq	%rax, -16(%rbp)

	pushq	%rax
	movq	%rax, %rcx
	popq	%rax
	subq	%rcx, %rax

	movq	%rax, -24(%rbp)


	pushq	%rax
	movq	$20, %rax
	movq	%rax, %rcx
	popq	%rax
	imulq	%rcx, %rax

	movq	%rax, -32(%rbp)

	movq	-8(%rbp), %rax
	incq	%rax
	movq	%rax, -8(%rbp)

	movq	-8(%rbp), %rax
	decq	%rax
	movq	%rax, -8(%rbp)

	pushq	%rax
	movq	$20, %rax
	movq	%rax, %rcx
	popq	%rax
	imulq	%rcx, %rax

	movq	%rax, -40(%rbp)

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

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	-16(%rbp), %rax
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
	movq	-24(%rbp), %rax
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
	movq	-32(%rbp), %rax
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
	movq	-40(%rbp), %rax
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


	leave	
	ret	
