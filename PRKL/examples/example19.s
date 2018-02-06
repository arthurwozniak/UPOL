    .text
            .global main

            .type	main, @function
        .data 
fib:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	subq	$8, %rsp
IfStatement_7f8fb4a569b0_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$1, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jg	COMP_FALSE_BinaryExpression_7f8fb4a061d0

COMP_TRUE_BinaryExpression_7f8fb4a061d0:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f8fb4a061d0

COMP_FALSE_BinaryExpression_7f8fb4a061d0:
	movq	$0, %rax
COMP_END_BinaryExpression_7f8fb4a061d0:
	cmp	$0, %rax
	je	IfStatement_7f8fb4a569b0_ELSE
IfStatement_7f8fb4a569b0_THEN:
	movq	-8(%rbp), %rax
	leave	
	ret	

	jmp	IfStatement_7f8fb4a569b0_END

IfStatement_7f8fb4a569b0_ELSE:
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
	call	fib
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
	movq	$2, %rax
	movq	%rax, %rcx
	popq	%rax
	subq	%rcx, %rax
	movq	%rax, %rdi
	call	fib
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax
	leave	
	ret	

IfStatement_7f8fb4a569b0_END:

	addq	$0, %rsp

	movq	$0, %rax
	leave	
	ret	
main:
	pushq	%rbp
	movq	%rsp, %rbp

	subq	$8, %rsp
	movq	$0, -8(%rbp)
ForExpression_7f8fb4a4a780_INIT:
	movq	$0, %rax

	movq	%rax, -8(%rbp)
ForExpression_7f8fb4a4a780_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$15, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7f8fb4a4a1d0

COMP_TRUE_BinaryExpression_7f8fb4a4a1d0:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f8fb4a4a1d0

COMP_FALSE_BinaryExpression_7f8fb4a4a1d0:
	movq	$0, %rax
COMP_END_BinaryExpression_7f8fb4a4a1d0:
	cmp	$0, %rax
	je	ForExpression_7f8fb4a4a780_END
ForExpression_7f8fb4a4a780_BODY:
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fib
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi
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

ForExpression_7f8fb4a4a780_STEP:
	movq	-8(%rbp), %rax
	pushq	%rax
	incq	%rax
	movq	%rax, -8(%rbp)
	popq	%rax
	jmp	ForExpression_7f8fb4a4a780_COND
ForExpression_7f8fb4a4a780_END:

	addq	$8, %rsp

	movq	$0, %rax
	leave	
	ret	
