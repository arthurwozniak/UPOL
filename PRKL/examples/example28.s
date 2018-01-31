    .text
            .global main

            .type	main, @function
print_array:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	subq	$24, %rsp
	movq	$0, -24(%rbp)

ForExpression_7f06441d4400_INIT:
	movq	$0, %rax

	movq	%rax, -24(%rbp)
ForExpression_7f06441d4400_COND:
	movq	-24(%rbp), %rax

	pushq	%rax
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7f06441d4160

COMP_TRUE_BinaryExpression_7f06441d4160:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f06441d4160

COMP_FALSE_BinaryExpression_7f06441d4160:
	movq	$0, %rax
COMP_END_BinaryExpression_7f06441d4160:
	cmp	$0, %rax
	je	ForExpression_7f06441d4400_END
ForExpression_7f06441d4400_BODY:
	subq	$24, %rsp
IfStatement_7f06441d4320_COND:
	movq	-24(%rbp), %rax
	cmp	$0, %rax
	je	IfStatement_7f06441d4320_ELSE
IfStatement_7f06441d4320_THEN:
	subq	$24, %rsp
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$44, %rax
	movq	%rax, %rdi
	call	print_char
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
	movq	$32, %rax
	movq	%rax, %rdi
	call	print_char
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	jmp	IfStatement_7f06441d4320_END

IfStatement_7f06441d4320_ELSE:
IfStatement_7f06441d4320_END:

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
	call	print_long
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

ForExpression_7f06441d4400_STEP:
	movq	-24(%rbp), %rax
	incq	%rax
	movq	%rax, -24(%rbp)
	jmp	ForExpression_7f06441d4400_COND
ForExpression_7f06441d4400_END:

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
swap:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	subq	$32, %rsp

	movq	-24(%rbp), %rax
	imulq	$8, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax

	movq	%rax, %r11
	movq	-16(%rbp), %rax
	imulq	$8, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax
	movq	%r11, (%rbx)

	movq	-32(%rbp), %rax

	movq	%rax, %r11
	movq	-24(%rbp), %rax
	imulq	$8, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax
	movq	%r11, (%rbx)


	leave	
	ret	
partition:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	subq	$48, %rsp
	movq	$0, -32(%rbp)



ForExpression_7f0644169ac8_INIT:
	movq	-16(%rbp), %rax

	movq	%rax, -32(%rbp)
ForExpression_7f0644169ac8_COND:
	movq	-32(%rbp), %rax

	pushq	%rax
	movq	-24(%rbp), %rax

	pushq	%rax
	movq	$1, %rax
	movq	%rax, %rcx
	popq	%rax
	subq	%rcx, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jg	COMP_FALSE_BinaryExpression_7f0644169550

COMP_TRUE_BinaryExpression_7f0644169550:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f0644169550

COMP_FALSE_BinaryExpression_7f0644169550:
	movq	$0, %rax
COMP_END_BinaryExpression_7f0644169550:
	cmp	$0, %rax
	je	ForExpression_7f0644169ac8_END
ForExpression_7f0644169ac8_BODY:
	subq	$48, %rsp
IfStatement_7f0644169a58_COND:
	movq	-32(%rbp), %rax
	imulq	$8, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax

	pushq	%rax
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jg	COMP_FALSE_BinaryExpression_7f0644169780

COMP_TRUE_BinaryExpression_7f0644169780:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f0644169780

COMP_FALSE_BinaryExpression_7f0644169780:
	movq	$0, %rax
COMP_END_BinaryExpression_7f0644169780:
	cmp	$0, %rax
	je	IfStatement_7f0644169a58_ELSE
IfStatement_7f0644169a58_THEN:
	subq	$48, %rsp
	movq	-48(%rbp), %rax
	incq	%rax
	movq	%rax, -48(%rbp)

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	movq	-48(%rbp), %rax
	movq	%rax, %rsi
	movq	-32(%rbp), %rax
	movq	%rax, %rdx
	call	swap
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	jmp	IfStatement_7f0644169a58_END

IfStatement_7f0644169a58_ELSE:
IfStatement_7f0644169a58_END:

ForExpression_7f0644169ac8_STEP:
	movq	-32(%rbp), %rax
	incq	%rax
	movq	%rax, -32(%rbp)
	jmp	ForExpression_7f0644169ac8_COND
ForExpression_7f0644169ac8_END:

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	movq	-48(%rbp), %rax

	pushq	%rax
	movq	$1, %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax
	movq	%rax, %rsi
	movq	-24(%rbp), %rax
	movq	%rax, %rdx
	call	swap
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	movq	-48(%rbp), %rax

	pushq	%rax
	movq	$1, %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax
	leave	
	ret	


	leave	
	ret	
quick_sort_rec:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	subq	$24, %rsp
IfStatement_7f0644170b70_COND:
	movq	-16(%rbp), %rax

	pushq	%rax
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7f0644170668

COMP_TRUE_BinaryExpression_7f0644170668:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f0644170668

COMP_FALSE_BinaryExpression_7f0644170668:
	movq	$0, %rax
COMP_END_BinaryExpression_7f0644170668:
	cmp	$0, %rax
	je	IfStatement_7f0644170b70_ELSE
IfStatement_7f0644170b70_THEN:
	subq	$32, %rsp

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
	movq	-32(%rbp), %rax

	pushq	%rax
	movq	$1, %rax
	movq	%rax, %rcx
	popq	%rax
	subq	%rcx, %rax
	movq	%rax, %rdx
	call	quick_sort_rec
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
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	movq	-32(%rbp), %rax

	pushq	%rax
	movq	$1, %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax
	movq	%rax, %rsi
	movq	-24(%rbp), %rax
	movq	%rax, %rdx
	call	quick_sort_rec
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	jmp	IfStatement_7f0644170b70_END

IfStatement_7f0644170b70_ELSE:
IfStatement_7f0644170b70_END:


	leave	
	ret	
quick_sort:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	subq	$16, %rsp
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	movq	$0, %rax
	movq	%rax, %rsi
	movq	-16(%rbp), %rax

	pushq	%rax
	movq	$1, %rax
	movq	%rax, %rcx
	popq	%rax
	subq	%rcx, %rax
	movq	%rax, %rdx
	call	quick_sort_rec
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
	subq	$384, %rsp
	movq	$5, -8(%rbp)
	movq	$3, -16(%rbp)
	movq	$2, -24(%rbp)
	movq	$9, -32(%rbp)
	movq	$8, -40(%rbp)
	movq	$4, -48(%rbp)
	movq	$6, -56(%rbp)
	movq	$3, -64(%rbp)
	movq	$2, -72(%rbp)
	movq	$3, -80(%rbp)
	movq	$4, -88(%rbp)
	movq	$3, -96(%rbp)
	movq	$9, -104(%rbp)
	movq	$8, -112(%rbp)
	movq	$2, -120(%rbp)
	movq	$5, -128(%rbp)
	movq	$1, -136(%rbp)
	movq	$2, -144(%rbp)
	movq	$4, -152(%rbp)
	movq	$8, -160(%rbp)
	movq	$-168, %rax
	addq	$8, %rax
	addq	%rbp, %rax
	movq	%rax, -168(%rbp)

	movq	$4, -176(%rbp)
	movq	$2, -184(%rbp)
	movq	$1, -192(%rbp)
	movq	$4, -200(%rbp)
	movq	$3, -208(%rbp)
	movq	$0, -216(%rbp)
	movq	$4, -224(%rbp)
	movq	$2, -232(%rbp)
	movq	$1, -240(%rbp)
	movq	$3, -248(%rbp)
	movq	$3, -256(%rbp)
	movq	$2, -264(%rbp)
	movq	$4, -272(%rbp)
	movq	$3, -280(%rbp)
	movq	$4, -288(%rbp)
	movq	$-296, %rax
	addq	$8, %rax
	addq	%rbp, %rax
	movq	%rax, -296(%rbp)

	movq	$0, -304(%rbp)
	movq	$1, -312(%rbp)
	movq	$2, -320(%rbp)
	movq	$3, -328(%rbp)
	movq	$4, -336(%rbp)
	movq	$5, -344(%rbp)
	movq	$6, -352(%rbp)
	movq	$7, -360(%rbp)
	movq	$8, -368(%rbp)
	movq	$9, -376(%rbp)
	movq	$-384, %rax
	addq	$8, %rax
	addq	%rbp, %rax
	movq	%rax, -384(%rbp)

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	-168(%rbp), %rax
	movq	%rax, %rdi
	movq	$20, %rax
	movq	%rax, %rsi
	call	quick_sort
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
	movq	-168(%rbp), %rax
	movq	%rax, %rdi
	movq	$20, %rax
	movq	%rax, %rsi
	call	print_array
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
	movq	-296(%rbp), %rax
	movq	%rax, %rdi
	movq	$15, %rax
	movq	%rax, %rsi
	call	quick_sort
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
	movq	-296(%rbp), %rax
	movq	%rax, %rdi
	movq	$15, %rax
	movq	%rax, %rsi
	call	print_array
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
	movq	-384(%rbp), %rax
	movq	%rax, %rdi
	movq	$10, %rax
	movq	%rax, %rsi
	call	quick_sort
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
	movq	-384(%rbp), %rax
	movq	%rax, %rdi
	movq	$10, %rax
	movq	%rax, %rsi
	call	print_array
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi


	leave	
	ret	
