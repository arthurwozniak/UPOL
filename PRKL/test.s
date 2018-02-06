    .text
            .global main

            .type	main, @function
        .data 
	pc:
		.quad 0
	sp:
		.quad 0
	prgm:
		.quad 0
	stack:
		.zero 524288
print_stack:
	pushq	%rbp
	movq	%rsp, %rbp

	subq	$8, %rsp
	movq	$0, -8(%rbp)
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$91, %rax
	movq	%rax, %rdi
	call	print_char
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

ForExpression_7f399517b7f0_INIT:
	movq	$0, %rax

	movq	%rax, -8(%rbp)
ForExpression_7f399517b7f0_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	sp, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7f399517b358

COMP_TRUE_BinaryExpression_7f399517b358:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f399517b358

COMP_FALSE_BinaryExpression_7f399517b358:
	movq	$0, %rax
COMP_END_BinaryExpression_7f399517b358:
	cmp	$0, %rax
	je	ForExpression_7f399517b7f0_END
ForExpression_7f399517b7f0_BODY:
IfStatement_7f399517b588_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$0, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jle	COMP_FALSE_BinaryExpression_7f399517b438

COMP_TRUE_BinaryExpression_7f399517b438:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f399517b438

COMP_FALSE_BinaryExpression_7f399517b438:
	movq	$0, %rax
COMP_END_BinaryExpression_7f399517b438:
	cmp	$0, %rax
	je	IfStatement_7f399517b588_ELSE
IfStatement_7f399517b588_THEN:
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

	jmp	IfStatement_7f399517b588_END

IfStatement_7f399517b588_ELSE:
IfStatement_7f399517b588_END:

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	leaq	stack, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
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

ForExpression_7f399517b7f0_STEP:
	movq	-8(%rbp), %rax
	pushq	%rax
	incq	%rax
	movq	%rax, -8(%rbp)
	popq	%rax
	jmp	ForExpression_7f399517b7f0_COND
ForExpression_7f399517b7f0_END:

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
push1:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	subq	$8, %rsp
	movq	-8(%rbp), %rax

	movq	%rax, %r11
	leaq	stack, %rax
	pushq	%rax
	movq	sp, %rax
	imulq	$8, %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax
	movq	%r11, (%rbx)

	movq	sp, %rax
	pushq	%rax
	incq	%rax
	movq	%rax, sp
	popq	%rax

	addq	$0, %rsp

	movq	$0, %rax
	leave	
	ret	
pop1:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	subq	$8, %rsp
	addq	$0, %rsp

	movq	$0, %rax
	leave	
	ret	
jrz1:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	subq	$8, %rsp
	movq	sp, %rax
	pushq	%rax
	decq	%rax
	movq	%rax, sp
	popq	%rax

IfStatement_7f399517b940_COND:
	leaq	stack, %rax
	pushq	%rax
	movq	sp, %rax
	imulq	$8, %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax

	pushq	%rax
	movq	$0, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jne	COMP_FALSE_BinaryExpression_7f399517ba90

COMP_TRUE_BinaryExpression_7f399517ba90:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f399517ba90

COMP_FALSE_BinaryExpression_7f399517ba90:
	movq	$0, %rax
COMP_END_BinaryExpression_7f399517ba90:
	cmp	$0, %rax
	je	IfStatement_7f399517b940_ELSE
IfStatement_7f399517b940_THEN:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	pc, %rax
	popq	%r11
	addq	%r11, %rax
	movq	%rax, pc

	jmp	IfStatement_7f399517b940_END

IfStatement_7f399517b940_ELSE:
IfStatement_7f399517b940_END:

	addq	$0, %rsp

	movq	$0, %rax
	leave	
	ret	
add2:
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

	pushq	%rax
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax
	movq	%rax, %rdi
	call	push1
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
mul2:
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

	pushq	%rax
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	popq	%rax
	imulq	%rcx, %rax
	movq	%rax, %rdi
	call	push1
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
leq2:
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
	movq	-16(%rbp), %rax

	pushq	%rax
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jg	COMP_FALSE_BinaryExpression_7f3994e634e0

COMP_TRUE_BinaryExpression_7f3994e634e0:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f3994e634e0

COMP_FALSE_BinaryExpression_7f3994e634e0:
	movq	$0, %rax
COMP_END_BinaryExpression_7f3994e634e0:
	movq	%rax, %rdi
	call	push1
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
dup1:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	subq	$8, %rsp
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	push1
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
	call	push1
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
swap2:
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
	call	push1
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
	call	push1
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
rot3:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	subq	$24, %rsp
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	push1
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
	call	push1
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
	call	push1
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
eval:
	pushq	%rbp
	movq	%rsp, %rbp

	subq	$8, %rsp
	movq	$0, -8(%rbp)
DoWhileExpression_7f3994e4ff98_BODY:
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	call	print_stack
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	movq	prgm, %rax
	pushq	%rax
	movq	pc, %rax
	imulq	$8, %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax

	movq	%rax, -8(%rbp)

IfStatement_7f3994d8cb70_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$-1, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jne	COMP_FALSE_BinaryExpression_7f3994d8c668

COMP_TRUE_BinaryExpression_7f3994d8c668:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f3994d8c668

COMP_FALSE_BinaryExpression_7f3994d8c668:
	movq	$0, %rax
COMP_END_BinaryExpression_7f3994d8c668:
	cmp	$0, %rax
	je	IfStatement_7f3994d8cb70_ELSE
IfStatement_7f3994d8cb70_THEN:
	movq	$3, %rax

	pushq	%rax
	movq	pc, %rax
	popq	%r11
	addq	%r11, %rax
	movq	%rax, pc

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	prgm, %rax
	pushq	%rax
	movq	pc, %rax

	pushq	%rax
	movq	$1, %rax
	movq	%rax, %rcx
	popq	%rax
	subq	%rcx, %rax
	imulq	$8, %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax
	movq	%rax, %rdi
	movq	prgm, %rax
	pushq	%rax
	movq	pc, %rax

	pushq	%rax
	movq	$2, %rax
	movq	%rax, %rcx
	popq	%rax
	subq	%rcx, %rax
	imulq	$8, %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax
	call	*%rax
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	jmp	DoWhileExpression_7f3994e4ff98_COND

	jmp	IfStatement_7f3994d8cb70_END

IfStatement_7f3994d8cb70_ELSE:
IfStatement_7f3994d8cb70_END:

IfStatement_7f3994e4f400_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$1, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jne	COMP_FALSE_BinaryExpression_7f3994d8cc88

COMP_TRUE_BinaryExpression_7f3994d8cc88:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f3994d8cc88

COMP_FALSE_BinaryExpression_7f3994d8cc88:
	movq	$0, %rax
COMP_END_BinaryExpression_7f3994d8cc88:
	cmp	$0, %rax
	je	IfStatement_7f3994e4f400_ELSE
IfStatement_7f3994e4f400_THEN:

	subq	$8, %rsp
	leaq	stack, %rax
	pushq	%rax
	movq	sp, %rax

	pushq	%rax
	movq	$1, %rax
	movq	%rax, %rcx
	popq	%rax
	subq	%rcx, %rax
	imulq	$8, %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax
	movq	%rax, -16(%rbp)
	movq	$2, %rax

	pushq	%rax
	movq	pc, %rax
	popq	%r11
	addq	%r11, %rax
	movq	%rax, pc

	movq	$1, %rax

	pushq	%rax
	movq	sp, %rax
	popq	%r11
	subq	%r11, %rax
	movq	%rax, sp

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	movq	prgm, %rax
	pushq	%rax
	movq	pc, %rax

	pushq	%rax
	movq	$1, %rax
	movq	%rax, %rcx
	popq	%rax
	subq	%rcx, %rax
	imulq	$8, %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax
	call	*%rax
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	jmp	DoWhileExpression_7f3994e4ff98_COND

	jmp	IfStatement_7f3994e4f400_END

IfStatement_7f3994e4f400_ELSE:
IfStatement_7f3994e4f400_END:

IfStatement_7f3994e63d30_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$2, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jne	COMP_FALSE_BinaryExpression_7f3994e4f518

COMP_TRUE_BinaryExpression_7f3994e4f518:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f3994e4f518

COMP_FALSE_BinaryExpression_7f3994e4f518:
	movq	$0, %rax
COMP_END_BinaryExpression_7f3994e4f518:
	cmp	$0, %rax
	je	IfStatement_7f3994e63d30_ELSE
IfStatement_7f3994e63d30_THEN:


	subq	$16, %rsp
	leaq	stack, %rax
	pushq	%rax
	movq	sp, %rax

	pushq	%rax
	movq	$1, %rax
	movq	%rax, %rcx
	popq	%rax
	subq	%rcx, %rax
	imulq	$8, %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax
	movq	%rax, -16(%rbp)
	leaq	stack, %rax
	pushq	%rax
	movq	sp, %rax

	pushq	%rax
	movq	$2, %rax
	movq	%rax, %rcx
	popq	%rax
	subq	%rcx, %rax
	imulq	$8, %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax
	movq	%rax, -24(%rbp)
	movq	$2, %rax

	pushq	%rax
	movq	pc, %rax
	popq	%r11
	addq	%r11, %rax
	movq	%rax, pc

	movq	$2, %rax

	pushq	%rax
	movq	sp, %rax
	popq	%r11
	subq	%r11, %rax
	movq	%rax, sp

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	movq	prgm, %rax
	pushq	%rax
	movq	pc, %rax

	pushq	%rax
	movq	$1, %rax
	movq	%rax, %rcx
	popq	%rax
	subq	%rcx, %rax
	imulq	$8, %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax
	call	*%rax
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	jmp	DoWhileExpression_7f3994e4ff98_COND

	jmp	IfStatement_7f3994e63d30_END

IfStatement_7f3994e63d30_ELSE:
IfStatement_7f3994e63d30_END:

IfStatement_7f3994e4ff28_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$3, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jne	COMP_FALSE_BinaryExpression_7f3994e63be0

COMP_TRUE_BinaryExpression_7f3994e63be0:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f3994e63be0

COMP_FALSE_BinaryExpression_7f3994e63be0:
	movq	$0, %rax
COMP_END_BinaryExpression_7f3994e63be0:
	cmp	$0, %rax
	je	IfStatement_7f3994e4ff28_ELSE
IfStatement_7f3994e4ff28_THEN:



	subq	$24, %rsp
	leaq	stack, %rax
	pushq	%rax
	movq	sp, %rax

	pushq	%rax
	movq	$1, %rax
	movq	%rax, %rcx
	popq	%rax
	subq	%rcx, %rax
	imulq	$8, %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax
	movq	%rax, -16(%rbp)
	leaq	stack, %rax
	pushq	%rax
	movq	sp, %rax

	pushq	%rax
	movq	$2, %rax
	movq	%rax, %rcx
	popq	%rax
	subq	%rcx, %rax
	imulq	$8, %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax
	movq	%rax, -24(%rbp)
	leaq	stack, %rax
	pushq	%rax
	movq	sp, %rax

	pushq	%rax
	movq	$3, %rax
	movq	%rax, %rcx
	popq	%rax
	subq	%rcx, %rax
	imulq	$8, %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax
	movq	%rax, -32(%rbp)
	movq	$2, %rax

	pushq	%rax
	movq	pc, %rax
	popq	%r11
	addq	%r11, %rax
	movq	%rax, pc

	movq	$3, %rax

	pushq	%rax
	movq	sp, %rax
	popq	%r11
	subq	%r11, %rax
	movq	%rax, sp

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	movq	-32(%rbp), %rax
	movq	%rax, %rdx
	movq	prgm, %rax
	pushq	%rax
	movq	pc, %rax

	pushq	%rax
	movq	$1, %rax
	movq	%rax, %rcx
	popq	%rax
	subq	%rcx, %rax
	imulq	$8, %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax
	call	*%rax
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	jmp	DoWhileExpression_7f3994e4ff98_COND

	jmp	IfStatement_7f3994e4ff28_END

IfStatement_7f3994e4ff28_ELSE:
IfStatement_7f3994e4ff28_END:

DoWhileExpression_7f3994e4ff98_COND:
	movq	-8(%rbp), %rax
	cmp	$0, %rax
	je	DoWhileExpression_7f3994e4ff98_END
	jmp	DoWhileExpression_7f3994e4ff98_BODY
DoWhileExpression_7f3994e4ff98_END:

	addq	$8, %rsp

	movq	$0, %rax
	leave	
	ret	
run:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	subq	$8, %rsp
	movq	-8(%rbp), %rax

	movq	%rax, prgm

	movq	$0, %rax

	movq	%rax, sp

	movq	%rax, pc

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	call	eval
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


	subq	$312, %rsp
	movq	$-32, -8(%rbp)
	leaq	jrz1, %rax
	movq	%rax, -16(%rbp)
	movq	$-1, -24(%rbp)
	movq	$0, -32(%rbp)
	leaq	push1, %rax
	movq	%rax, -40(%rbp)
	movq	$-1, -48(%rbp)
	leaq	mul2, %rax
	movq	%rax, -56(%rbp)
	movq	$2, -64(%rbp)
	leaq	rot3, %rax
	movq	%rax, -72(%rbp)
	movq	$3, -80(%rbp)
	leaq	add2, %rax
	movq	%rax, -88(%rbp)
	movq	$2, -96(%rbp)
	movq	$-1, -104(%rbp)
	leaq	push1, %rax
	movq	%rax, -112(%rbp)
	movq	$-1, -120(%rbp)
	leaq	dup1, %rax
	movq	%rax, -128(%rbp)
	movq	$1, -136(%rbp)
	movq	$0, -144(%rbp)
	leaq	pop1, %rax
	movq	%rax, -152(%rbp)
	movq	$1, -160(%rbp)
	movq	$3, -168(%rbp)
	leaq	jrz1, %rax
	movq	%rax, -176(%rbp)
	movq	$-1, -184(%rbp)
	leaq	leq2, %rax
	movq	%rax, -192(%rbp)
	movq	$2, -200(%rbp)
	movq	$1, -208(%rbp)
	leaq	push1, %rax
	movq	%rax, -216(%rbp)
	movq	$-1, -224(%rbp)
	leaq	dup1, %rax
	movq	%rax, -232(%rbp)
	movq	$1, -240(%rbp)
	leaq	swap2, %rax
	movq	%rax, -248(%rbp)
	movq	$2, -256(%rbp)
	movq	$1, -264(%rbp)
	leaq	push1, %rax
	movq	%rax, -272(%rbp)
	movq	$-1, -280(%rbp)
	movq	$10, -288(%rbp)
	leaq	push1, %rax
	movq	%rax, -296(%rbp)
	movq	$-1, -304(%rbp)
	movq	$4, -312(%rbp)
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	leaq	-304(%rbp), %rax
	movq	%rax, %rdi
	call	run
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	addq	$312, %rsp

	movq	$0, %rax
	leave	
	ret	
