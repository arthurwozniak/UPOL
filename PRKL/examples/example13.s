    .text
            .global main

            .type	main, @function
        .data 
fac:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	subq	$8, %rsp
IfStatement_7f00806d19b0_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$1, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jg	COMP_FALSE_BinaryExpression_7f00806735c0

COMP_TRUE_BinaryExpression_7f00806735c0:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f00806735c0

COMP_FALSE_BinaryExpression_7f00806735c0:
	movq	$0, %rax
COMP_END_BinaryExpression_7f00806735c0:
	cmp	$0, %rax
	je	IfStatement_7f00806d19b0_ELSE
IfStatement_7f00806d19b0_THEN:
	movq	$1, %rax
	leave	
	ret	

	jmp	IfStatement_7f00806d19b0_END

IfStatement_7f00806d19b0_ELSE:
	movq	-8(%rbp), %rax

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
	subq	%rcx, %rax
	movq	%rax, %rdi
	call	fac
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi
	movq	%rax, %rcx
	popq	%rax
	imulq	%rcx, %rax
	leave	
	ret	

IfStatement_7f00806d19b0_END:

	addq	$0, %rsp

	movq	$0, %rax
	leave	
	ret	
main:
	pushq	%rbp
	movq	%rsp, %rbp

	subq	$8, %rsp
	movq	$0, -8(%rbp)
ForExpression_7f00806d9c50_INIT:
	movq	$0, %rax

	movq	%rax, -8(%rbp)
ForExpression_7f00806d9c50_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$10, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7f00806cfa20

COMP_TRUE_BinaryExpression_7f00806cfa20:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f00806cfa20

COMP_FALSE_BinaryExpression_7f00806cfa20:
	movq	$0, %rax
COMP_END_BinaryExpression_7f00806cfa20:
	cmp	$0, %rax
	je	ForExpression_7f00806d9c50_END
ForExpression_7f00806d9c50_BODY:
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
	call	fac
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

ForExpression_7f00806d9c50_STEP:
	movq	-8(%rbp), %rax
	pushq	%rax
	incq	%rax
	movq	%rax, -8(%rbp)
	popq	%rax
	jmp	ForExpression_7f00806d9c50_COND
ForExpression_7f00806d9c50_END:

	addq	$8, %rsp

	movq	$0, %rax
	leave	
	ret	
