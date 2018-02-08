    .text
            .global main

            .type	main, @function
        .data 
print_array:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	subq	$16, %rsp

	subq	$8, %rsp
	movq	$0, -24(%rbp)
ForExpression_7f1ff76f8358_INIT:
	movq	$0, %rax

	movq	%rax, -24(%rbp)
ForExpression_7f1ff76f8358_COND:
	movq	-24(%rbp), %rax

	pushq	%rax
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7f1ff7761f60

COMP_TRUE_BinaryExpression_7f1ff7761f60:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f1ff7761f60

COMP_FALSE_BinaryExpression_7f1ff7761f60:
	movq	$0, %rax
COMP_END_BinaryExpression_7f1ff7761f60:
	cmp	$0, %rax
	je	ForExpression_7f1ff76f8358_END
ForExpression_7f1ff76f8358_BODY:
IfStatement_7f1ff76f81d0_COND:
	movq	-24(%rbp), %rax
	cmp	$0, %rax
	je	IfStatement_7f1ff76f81d0_ELSE
IfStatement_7f1ff76f81d0_THEN:
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

	jmp	IfStatement_7f1ff76f81d0_END

IfStatement_7f1ff76f81d0_ELSE:
IfStatement_7f1ff76f81d0_END:

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	-24(%rbp), %rax
	imulq	$8, %rax
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

ForExpression_7f1ff76f8358_STEP:
	movq	-24(%rbp), %rax
	pushq	%rax
	incq	%rax
	movq	%rax, -24(%rbp)
	popq	%rax
	jmp	ForExpression_7f1ff76f8358_COND
ForExpression_7f1ff76f8358_END:

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

	addq	$8, %rsp

	movq	$0, %rax
	leave	
	ret	
swap:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	subq	$24, %rsp

	subq	$8, %rsp
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	imulq	$8, %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax
	movq	%rax, -32(%rbp)
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	-24(%rbp), %rax
	imulq	$8, %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax

	movq	%rax, %r11
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	imulq	$8, %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax
	movq	%r11, (%rbx)

	movq	-32(%rbp), %rax

	movq	%rax, %r11
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	-24(%rbp), %rax
	imulq	$8, %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax
	movq	%r11, (%rbx)

	addq	$8, %rsp

	movq	$0, %rax
	leave	
	ret	
partition:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	subq	$24, %rsp



	subq	$24, %rsp
	movq	$0, -32(%rbp)
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	-24(%rbp), %rax
	imulq	$8, %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax
	movq	%rax, -40(%rbp)
	movq	-16(%rbp), %rax

	pushq	%rax
	movq	$1, %rax
	movq	%rax, %rcx
	popq	%rax
	subq	%rcx, %rax
	movq	%rax, -48(%rbp)
ForExpression_7f1ff77062b0_INIT:
	movq	-16(%rbp), %rax

	movq	%rax, -32(%rbp)
ForExpression_7f1ff77062b0_COND:
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
	jg	COMP_FALSE_BinaryExpression_7f1ff76ffcf8

COMP_TRUE_BinaryExpression_7f1ff76ffcf8:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f1ff76ffcf8

COMP_FALSE_BinaryExpression_7f1ff76ffcf8:
	movq	$0, %rax
COMP_END_BinaryExpression_7f1ff76ffcf8:
	cmp	$0, %rax
	je	ForExpression_7f1ff77062b0_END
ForExpression_7f1ff77062b0_BODY:
IfStatement_7f1ff7706240_COND:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	-32(%rbp), %rax
	imulq	$8, %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax

	pushq	%rax
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jg	COMP_FALSE_BinaryExpression_7f1ff76fff98

COMP_TRUE_BinaryExpression_7f1ff76fff98:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f1ff76fff98

COMP_FALSE_BinaryExpression_7f1ff76fff98:
	movq	$0, %rax
COMP_END_BinaryExpression_7f1ff76fff98:
	cmp	$0, %rax
	je	IfStatement_7f1ff7706240_ELSE
IfStatement_7f1ff7706240_THEN:
	movq	-48(%rbp), %rax
	pushq	%rax
	incq	%rax
	movq	%rax, -48(%rbp)
	popq	%rax

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

	jmp	IfStatement_7f1ff7706240_END

IfStatement_7f1ff7706240_ELSE:
IfStatement_7f1ff7706240_END:

ForExpression_7f1ff77062b0_STEP:
	movq	-32(%rbp), %rax
	pushq	%rax
	incq	%rax
	movq	%rax, -32(%rbp)
	popq	%rax
	jmp	ForExpression_7f1ff77062b0_COND
ForExpression_7f1ff77062b0_END:

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

	addq	$24, %rsp

	movq	$0, %rax
	leave	
	ret	
quick_sort_rec:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	subq	$24, %rsp
IfStatement_7f1ff7708358_COND:
	movq	-16(%rbp), %rax

	pushq	%rax
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7f1ff7706e10

COMP_TRUE_BinaryExpression_7f1ff7706e10:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f1ff7706e10

COMP_FALSE_BinaryExpression_7f1ff7706e10:
	movq	$0, %rax
COMP_END_BinaryExpression_7f1ff7706e10:
	cmp	$0, %rax
	je	IfStatement_7f1ff7708358_ELSE
IfStatement_7f1ff7708358_THEN:

	subq	$8, %rsp
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
	movq	-24(%rbp), %rax
	movq	%rax, %rdx
	call	partition
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi
	movq	%rax, -32(%rbp)
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

	jmp	IfStatement_7f1ff7708358_END

IfStatement_7f1ff7708358_ELSE:
IfStatement_7f1ff7708358_END:

	addq	$0, %rsp

	movq	$0, %rax
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

	addq	$0, %rsp

	movq	$0, %rax
	leave	
	ret	
main:
	pushq	%rbp
	movq	%rsp, %rbp



	subq	$360, %rsp
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
	movq	$4, -168(%rbp)
	movq	$2, -176(%rbp)
	movq	$1, -184(%rbp)
	movq	$4, -192(%rbp)
	movq	$3, -200(%rbp)
	movq	$0, -208(%rbp)
	movq	$4, -216(%rbp)
	movq	$2, -224(%rbp)
	movq	$1, -232(%rbp)
	movq	$3, -240(%rbp)
	movq	$3, -248(%rbp)
	movq	$2, -256(%rbp)
	movq	$4, -264(%rbp)
	movq	$3, -272(%rbp)
	movq	$4, -280(%rbp)
	movq	$0, -288(%rbp)
	movq	$1, -296(%rbp)
	movq	$2, -304(%rbp)
	movq	$3, -312(%rbp)
	movq	$4, -320(%rbp)
	movq	$5, -328(%rbp)
	movq	$6, -336(%rbp)
	movq	$7, -344(%rbp)
	movq	$8, -352(%rbp)
	movq	$9, -360(%rbp)
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	leaq	-160(%rbp), %rax
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
	leaq	-160(%rbp), %rax
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
	leaq	-280(%rbp), %rax
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
	leaq	-280(%rbp), %rax
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
	leaq	-360(%rbp), %rax
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
	leaq	-360(%rbp), %rax
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

	addq	$360, %rsp

	movq	$0, %rax
	leave	
	ret	
