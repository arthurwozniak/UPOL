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

ForExpression_7fbac13050b8_INIT:
	movq	$0, %rax

	movq	%rax, -24(%rbp)
ForExpression_7fbac13050b8_COND:
	movq	-24(%rbp), %rax

	pushq	%rax
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7fbac136fc50

COMP_TRUE_BinaryExpression_7fbac136fc50:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7fbac136fc50

COMP_FALSE_BinaryExpression_7fbac136fc50:
	movq	$0, %rax
COMP_END_BinaryExpression_7fbac136fc50:
	cmp	$0, %rax
	je	ForExpression_7fbac13050b8_END
ForExpression_7fbac13050b8_BODY:
	subq	$24, %rsp
IfStatement_7fbac136fe80_COND:
	movq	-24(%rbp), %rax
	cmp	$0, %rax
	je	IfStatement_7fbac136fe80_ELSE
IfStatement_7fbac136fe80_THEN:
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

	jmp	IfStatement_7fbac136fe80_END

IfStatement_7fbac136fe80_ELSE:
IfStatement_7fbac136fe80_END:

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

ForExpression_7fbac13050b8_STEP:
	movq	-24(%rbp), %rax
	incq	%rax
	movq	%rax, -24(%rbp)
	jmp	ForExpression_7fbac13050b8_COND
ForExpression_7fbac13050b8_END:

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
bubble_sort:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	subq	$32, %rsp
	movq	$0, -24(%rbp)

	movq	$0, -32(%rbp)

DoWhileExpression_7fbac130e630_BODY:
	subq	$32, %rsp
	movq	$0, %rax

	movq	%rax, -32(%rbp)

ForExpression_7fbac130e5f8_INIT:
	movq	$1, %rax

	movq	%rax, -24(%rbp)
ForExpression_7fbac130e5f8_COND:
	movq	-24(%rbp), %rax

	pushq	%rax
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7fbac130a898

COMP_TRUE_BinaryExpression_7fbac130a898:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7fbac130a898

COMP_FALSE_BinaryExpression_7fbac130a898:
	movq	$0, %rax
COMP_END_BinaryExpression_7fbac130a898:
	cmp	$0, %rax
	je	ForExpression_7fbac130e5f8_END
ForExpression_7fbac130e5f8_BODY:
	subq	$32, %rsp
IfStatement_7fbac130e588_COND:
	movq	-24(%rbp), %rax

	pushq	%rax
	movq	$1, %rax
	movq	%rax, %rcx
	popq	%rax
	subq	%rcx, %rax
	imulq	$8, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax

	pushq	%rax
	movq	-24(%rbp), %rax
	imulq	$8, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jle	COMP_FALSE_BinaryExpression_7fbac130aba8

COMP_TRUE_BinaryExpression_7fbac130aba8:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7fbac130aba8

COMP_FALSE_BinaryExpression_7fbac130aba8:
	movq	$0, %rax
COMP_END_BinaryExpression_7fbac130aba8:
	cmp	$0, %rax
	je	IfStatement_7fbac130e588_ELSE
IfStatement_7fbac130e588_THEN:
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
	movq	-24(%rbp), %rax

	pushq	%rax
	movq	$1, %rax
	movq	%rax, %rcx
	popq	%rax
	subq	%rcx, %rax
	imulq	$8, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax
	xorq	%r11, %rax
	movq	%rax, (%rbx)

	movq	-24(%rbp), %rax

	pushq	%rax
	movq	$1, %rax
	movq	%rax, %rcx
	popq	%rax
	subq	%rcx, %rax
	imulq	$8, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax

	movq	%rax, %r11
	movq	-24(%rbp), %rax
	imulq	$8, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax
	xorq	%r11, %rax
	movq	%rax, (%rbx)

	movq	-24(%rbp), %rax
	imulq	$8, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax

	movq	%rax, %r11
	movq	-24(%rbp), %rax

	pushq	%rax
	movq	$1, %rax
	movq	%rax, %rcx
	popq	%rax
	subq	%rcx, %rax
	imulq	$8, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax
	xorq	%r11, %rax
	movq	%rax, (%rbx)

	movq	$1, %rax

	movq	%rax, -32(%rbp)

	jmp	IfStatement_7fbac130e588_END

IfStatement_7fbac130e588_ELSE:
IfStatement_7fbac130e588_END:

ForExpression_7fbac130e5f8_STEP:
	movq	-24(%rbp), %rax
	incq	%rax
	movq	%rax, -24(%rbp)
	jmp	ForExpression_7fbac130e5f8_COND
ForExpression_7fbac130e5f8_END:

DoWhileExpression_7fbac130e630_COND:
	movq	-32(%rbp), %rax
	cmp	$0, %rax
	je	DoWhileExpression_7fbac130e630_END
	jmp	DoWhileExpression_7fbac130e630_BODY
DoWhileExpression_7fbac130e630_END:


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
	call	bubble_sort
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
	call	bubble_sort
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
	call	bubble_sort
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
