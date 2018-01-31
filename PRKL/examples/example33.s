    .text
            .global main

            .type	main, @function
walk:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	subq	$16, %rsp
IfStatement_7f33f97d14e0_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	-0(%rbp), %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jne	COMP_FALSE_BinaryExpression_7f33f97d1080

COMP_TRUE_BinaryExpression_7f33f97d1080:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f33f97d1080

COMP_FALSE_BinaryExpression_7f33f97d1080:
	movq	$0, %rax
COMP_END_BinaryExpression_7f33f97d1080:

	pushq	%rax
	movq	-16(%rbp), %rax

	pushq	%rax
	movq	-0(%rbp), %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jne	COMP_FALSE_BinaryExpression_7f33f97d1198

COMP_TRUE_BinaryExpression_7f33f97d1198:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f33f97d1198

COMP_FALSE_BinaryExpression_7f33f97d1198:
	movq	$0, %rax
COMP_END_BinaryExpression_7f33f97d1198:
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax
	cmp	$0, %rax
	je	IfStatement_7f33f97d14e0_ELSE
IfStatement_7f33f97d14e0_THEN:
	subq	$16, %rsp
	movq	$1, %rax

	movq	%rax, %r11
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$79, %rax

	pushq	%rax
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	popq	%rax
	imulq	%rcx, %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax
	imulq	$8, %rax
	pushq	%rax
	movq	-0(%rbp), %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax
	movq	%r11, (%rbx)

	movq	$1, %rax
	leave	
	ret	

	jmp	IfStatement_7f33f97d14e0_END

IfStatement_7f33f97d14e0_ELSE:
IfStatement_7f33f97d14e0_END:

IfStatement_7f33f97d1a20_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$79, %rax

	pushq	%rax
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	popq	%rax
	imulq	%rcx, %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax
	imulq	$8, %rax
	pushq	%rax
	movq	-0(%rbp), %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax

	pushq	%rax
	movq	$1, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jne	COMP_FALSE_BinaryExpression_7f33f97d1748

COMP_TRUE_BinaryExpression_7f33f97d1748:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f33f97d1748

COMP_FALSE_BinaryExpression_7f33f97d1748:
	movq	$0, %rax
COMP_END_BinaryExpression_7f33f97d1748:

	pushq	%rax
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$79, %rax

	pushq	%rax
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	popq	%rax
	imulq	%rcx, %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax
	imulq	$8, %rax
	pushq	%rax
	movq	-0(%rbp), %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax
	movq	%rax, %rcx
	popq	%rax
	orq	%rcx, %rax
	cmp	$0, %rax
	je	IfStatement_7f33f97d1a20_ELSE
IfStatement_7f33f97d1a20_THEN:
	subq	$16, %rsp
	movq	$0, %rax
	leave	
	ret	

	jmp	IfStatement_7f33f97d1a20_END

IfStatement_7f33f97d1a20_ELSE:
IfStatement_7f33f97d1a20_END:

	movq	$1, %rax

	movq	%rax, %r11
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$79, %rax

	pushq	%rax
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	popq	%rax
	imulq	%rcx, %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax
	imulq	$8, %rax
	pushq	%rax
	movq	-0(%rbp), %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax
	movq	%r11, (%rbx)

IfStatement_7f33f97d75c0_COND:
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
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	call	walk
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
	movq	$1, %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax
	movq	%rax, %rdi
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	call	walk
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi
	movq	%rax, %rcx
	popq	%rax
	orq	%rcx, %rax

	pushq	%rax
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	movq	-16(%rbp), %rax

	pushq	%rax
	movq	$1, %rax
	movq	%rax, %rcx
	popq	%rax
	subq	%rcx, %rax
	movq	%rax, %rsi
	call	walk
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi
	movq	%rax, %rcx
	popq	%rax
	orq	%rcx, %rax

	pushq	%rax
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	movq	-16(%rbp), %rax

	pushq	%rax
	movq	$1, %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax
	movq	%rax, %rsi
	call	walk
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi
	movq	%rax, %rcx
	popq	%rax
	orq	%rcx, %rax
	cmp	$0, %rax
	je	IfStatement_7f33f97d75c0_ELSE
IfStatement_7f33f97d75c0_THEN:
	subq	$16, %rsp
	movq	$1, %rax

	movq	%rax, %r11
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$79, %rax

	pushq	%rax
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	popq	%rax
	imulq	%rcx, %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax
	imulq	$8, %rax
	pushq	%rax
	movq	-0(%rbp), %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax
	movq	%r11, (%rbx)

	movq	$1, %rax
	leave	
	ret	

	jmp	IfStatement_7f33f97d75c0_END

IfStatement_7f33f97d75c0_ELSE:
IfStatement_7f33f97d75c0_END:

	movq	$0, %rax
	leave	
	ret	


	leave	
	ret	
solve:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	$0, -8(%rbp)

ForExpression_7f33f97d7d30_INIT:
	movq	$0, %rax

	movq	%rax, -8(%rbp)
ForExpression_7f33f97d7d30_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$1817, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7f33f97d7a90

COMP_TRUE_BinaryExpression_7f33f97d7a90:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f33f97d7a90

COMP_FALSE_BinaryExpression_7f33f97d7a90:
	movq	$0, %rax
COMP_END_BinaryExpression_7f33f97d7a90:
	cmp	$0, %rax
	je	ForExpression_7f33f97d7d30_END
ForExpression_7f33f97d7d30_BODY:
	subq	$8, %rsp
	movq	$0, %rax

	movq	%rax, %r11
	movq	-8(%rbp), %rax
	imulq	$8, %rax
	pushq	%rax
	movq	-0(%rbp), %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax
	movq	%r11, (%rbx)

	movq	%rax, %r11
	movq	-8(%rbp), %rax
	imulq	$8, %rax
	pushq	%rax
	movq	-0(%rbp), %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax
	movq	%r11, (%rbx)

ForExpression_7f33f97d7d30_STEP:
	movq	-8(%rbp), %rax
	incq	%rax
	movq	%rax, -8(%rbp)
	jmp	ForExpression_7f33f97d7d30_COND
ForExpression_7f33f97d7d30_END:

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	-0(%rbp), %rax
	movq	%rax, %rdi
	movq	-0(%rbp), %rax
	movq	%rax, %rsi
	call	walk
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi
	leave	
	ret	


	leave	
	ret	
print_solution:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movq	$0, -8(%rbp)

	movq	$0, -16(%rbp)

ForExpression_7f33f97e4ac8_INIT:
	movq	$0, %rax

	movq	%rax, -16(%rbp)
ForExpression_7f33f97e4ac8_COND:
	movq	-16(%rbp), %rax

	pushq	%rax
	movq	$23, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7f33f97e4080

COMP_TRUE_BinaryExpression_7f33f97e4080:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f33f97e4080

COMP_FALSE_BinaryExpression_7f33f97e4080:
	movq	$0, %rax
COMP_END_BinaryExpression_7f33f97e4080:
	cmp	$0, %rax
	je	ForExpression_7f33f97e4ac8_END
ForExpression_7f33f97e4ac8_BODY:
	subq	$16, %rsp
ForExpression_7f33f97e4a58_INIT:
	movq	$0, %rax

	movq	%rax, -8(%rbp)
ForExpression_7f33f97e4a58_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$79, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7f33f97e41d0

COMP_TRUE_BinaryExpression_7f33f97e41d0:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f33f97e41d0

COMP_FALSE_BinaryExpression_7f33f97e41d0:
	movq	$0, %rax
COMP_END_BinaryExpression_7f33f97e41d0:
	cmp	$0, %rax
	je	ForExpression_7f33f97e4a58_END
ForExpression_7f33f97e4a58_BODY:
	subq	$16, %rsp
IfStatement_7f33f97e49e8_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$79, %rax

	pushq	%rax
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	popq	%rax
	imulq	%rcx, %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax
	imulq	$8, %rax
	pushq	%rax
	movq	-0(%rbp), %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax

	pushq	%rax
	movq	$0, %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax
	cmp	$0, %rax
	je	IfStatement_7f33f97e49e8_ELSE
IfStatement_7f33f97e49e8_THEN:
	subq	$16, %rsp
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$35, %rax
	movq	%rax, %rdi
	call	print_char
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	jmp	IfStatement_7f33f97e49e8_END

IfStatement_7f33f97e49e8_ELSE:
	subq	$16, %rsp
IfStatement_7f33f97e4978_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$79, %rax

	pushq	%rax
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	popq	%rax
	imulq	%rcx, %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax
	imulq	$8, %rax
	pushq	%rax
	movq	-0(%rbp), %rax
	movq	%rax, %rbx
	popq	%rax
	addq	%rax, %rbx
	movq	(%rbx), %rax
	cmp	$0, %rax
	je	IfStatement_7f33f97e4978_ELSE
IfStatement_7f33f97e4978_THEN:
	subq	$16, %rsp
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$43, %rax
	movq	%rax, %rdi
	call	print_char
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	jmp	IfStatement_7f33f97e4978_END

IfStatement_7f33f97e4978_ELSE:
	subq	$16, %rsp
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

IfStatement_7f33f97e4978_END:

IfStatement_7f33f97e49e8_END:

ForExpression_7f33f97e4a58_STEP:
	movq	-8(%rbp), %rax
	incq	%rax
	movq	%rax, -8(%rbp)
	jmp	ForExpression_7f33f97e4a58_COND
ForExpression_7f33f97e4a58_END:

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

ForExpression_7f33f97e4ac8_STEP:
	movq	-16(%rbp), %rax
	incq	%rax
	movq	%rax, -16(%rbp)
	jmp	ForExpression_7f33f97e4ac8_COND
ForExpression_7f33f97e4ac8_END:


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
	call	solve
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
	call	print_solution
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi


	leave	
	ret	
