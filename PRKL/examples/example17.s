    .text
            .global main

            .type	main, @function
        .data 
fac:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	subq	$16, %rsp
IfStatement_7fadd318f710_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$0, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jle	COMP_FALSE_BinaryExpression_7fadd317def0

COMP_TRUE_BinaryExpression_7fadd317def0:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7fadd317def0

COMP_FALSE_BinaryExpression_7fadd317def0:
	movq	$0, %rax
COMP_END_BinaryExpression_7fadd317def0:
	cmp	$0, %rax
	je	IfStatement_7fadd318f710_ELSE
IfStatement_7fadd318f710_THEN:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	popq	%r11
	imulq	%r11, %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rbx
	movq	%rbx, (%rax)

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
	call	fac
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	jmp	IfStatement_7fadd318f710_END

IfStatement_7fadd318f710_ELSE:
IfStatement_7fadd318f710_END:

	addq	$0, %rsp

	movq	$0, %rax
	leave	
	ret	
main:
	pushq	%rbp
	movq	%rsp, %rbp


	subq	$16, %rsp
	movq	$0, -8(%rbp)
	movq	$0, -16(%rbp)
ForExpression_7fadd31dab38_INIT:
	movq	$0, %rax

	movq	%rax, -8(%rbp)
ForExpression_7fadd31dab38_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$10, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7fadd31daef0

COMP_TRUE_BinaryExpression_7fadd31daef0:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7fadd31daef0

COMP_FALSE_BinaryExpression_7fadd31daef0:
	movq	$0, %rax
COMP_END_BinaryExpression_7fadd31daef0:
	cmp	$0, %rax
	je	ForExpression_7fadd31dab38_END
ForExpression_7fadd31dab38_BODY:
	movq	$1, %rax

	movq	%rax, -16(%rbp)

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	call	fac
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

ForExpression_7fadd31dab38_STEP:
	movq	-8(%rbp), %rax
	pushq	%rax
	incq	%rax
	movq	%rax, -8(%rbp)
	popq	%rax
	jmp	ForExpression_7fadd31dab38_COND
ForExpression_7fadd31dab38_END:

	addq	$16, %rsp

	movq	$0, %rax
	leave	
	ret	
