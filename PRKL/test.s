    .text
            .global main

            .type	main, @function
        .data 
fill_array:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	$0, -32(%rbp)

	subq	$32, %rsp
ForExpression_7fded779cac8_INIT:
	movq	$0, %rax

	movq	%rax, -32(%rbp)
ForExpression_7fded779cac8_COND:
	movq	-32(%rbp), %rax

	pushq	%rax
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7fded779c828

COMP_TRUE_BinaryExpression_7fded779c828:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7fded779c828

COMP_FALSE_BinaryExpression_7fded779c828:
	movq	$0, %rax
COMP_END_BinaryExpression_7fded779c828:
	cmp	$0, %rax
	je	ForExpression_7fded779cac8_END
ForExpression_7fded779cac8_BODY:
	subq	$32, %rsp
	movq	-16(%rbp), %rax

	pushq	%rax
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax

	movq	%rax, %r11
	movq	-32(%rbp), %rax
	imulq	$8, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax
	movq	%r11, (%rbx)

ForExpression_7fded779cac8_STEP:
	movq	-32(%rbp), %rax
	incq	%rax
	movq	%rax, -32(%rbp)
	jmp	ForExpression_7fded779cac8_COND
ForExpression_7fded779cac8_END:


	leave	
	ret	
print_comma:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$0, %rsp
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


	leave	
	ret	
print_array:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	$0, -24(%rbp)

	subq	$24, %rsp
ForExpression_7fded77a6b00_INIT:
	movq	$0, %rax

	movq	%rax, -24(%rbp)
ForExpression_7fded77a6b00_COND:
	movq	-24(%rbp), %rax

	pushq	%rax
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7fded77a6860

COMP_TRUE_BinaryExpression_7fded77a6860:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7fded77a6860

COMP_FALSE_BinaryExpression_7fded77a6860:
	movq	$0, %rax
COMP_END_BinaryExpression_7fded77a6860:
	cmp	$0, %rax
	je	ForExpression_7fded77a6b00_END
ForExpression_7fded77a6b00_BODY:
	subq	$24, %rsp
IfStatement_7fded77a6978_COND:
	movq	-24(%rbp), %rax
	cmp	$0, %rax
	je	IfStatement_7fded77a6978_ELSE
IfStatement_7fded77a6978_THEN:
	subq	$24, %rsp
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	call	print_comma
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	jmp	IfStatement_7fded77a6978_END

IfStatement_7fded77a6978_ELSE:
IfStatement_7fded77a6978_END:

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

ForExpression_7fded77a6b00_STEP:
	movq	-24(%rbp), %rax
	incq	%rax
	movq	%rax, -24(%rbp)
	jmp	ForExpression_7fded77a6b00_COND
ForExpression_7fded77a6b00_END:

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
	movq	$0, -16(%rbp)
	movq	$0, -24(%rbp)
	movq	$0, -32(%rbp)
	movq	$0, -40(%rbp)
	movq	$0, -48(%rbp)
	movq	$0, -56(%rbp)
	movq	$0, -64(%rbp)
	movq	$0, -72(%rbp)
	movq	$0, -80(%rbp)
	movq	$-88, %rax
	addq	$8, %rax
	addq	%rbp, %rax
	movq	%rax, -88(%rbp)

	movq	$0, -96(%rbp)
	movq	$0, -104(%rbp)
	movq	$0, -112(%rbp)
	movq	$0, -120(%rbp)
	movq	$0, -128(%rbp)
	movq	$0, -136(%rbp)
	movq	$0, -144(%rbp)
	movq	$0, -152(%rbp)
	movq	$0, -160(%rbp)
	movq	$0, -168(%rbp)
	movq	$0, -176(%rbp)
	movq	$0, -184(%rbp)
	movq	$0, -192(%rbp)
	movq	$0, -200(%rbp)
	movq	$0, -208(%rbp)
	movq	$0, -216(%rbp)
	movq	$0, -224(%rbp)
	movq	$0, -232(%rbp)
	movq	$0, -240(%rbp)
	movq	$0, -248(%rbp)
	movq	$-256, %rax
	addq	$8, %rax
	addq	%rbp, %rax
	movq	%rax, -256(%rbp)

	movq	$2, -264(%rbp)
	movq	$4, -272(%rbp)
	movq	$6, -280(%rbp)
	movq	$8, -288(%rbp)
	movq	$9, -296(%rbp)
	movq	$7, -304(%rbp)
	movq	$5, -312(%rbp)
	movq	$3, -320(%rbp)
	movq	$1, -328(%rbp)
	movq	$-336, %rax
	addq	$8, %rax
	addq	%rbp, %rax
	movq	%rax, -336(%rbp)

	subq	$336, %rsp
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	movq	$666, %rax
	movq	%rax, %rsi
	movq	$10, %rax
	movq	%rax, %rdx
	call	fill_array
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
	movq	-256(%rbp), %rax
	movq	%rax, %rdi
	movq	$10, %rax
	movq	%rax, %rsi
	movq	$10, %rax
	movq	%rax, %rdx
	call	fill_array
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
	movq	-256(%rbp), %rax

	pushq	%rax
	movq	$10, %rax

	pushq	%rax
	movq	$8, %rax
	movq	%rax, %rcx
	popq	%rax
	imulq	%rcx, %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax
	movq	%rax, %rdi
	movq	$90, %rax
	movq	%rax, %rsi
	movq	$10, %rax
	movq	%rax, %rdx
	call	fill_array
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
	movq	-88(%rbp), %rax
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

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	-256(%rbp), %rax
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
	movq	-336(%rbp), %rax
	movq	%rax, %rdi
	movq	$9, %rax
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
