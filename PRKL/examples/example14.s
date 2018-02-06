    .text
            .global main

            .type	main, @function
        .data 
fac:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	subq	$8, %rsp
IfEvalStatement_7fa1a5c887f0_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$1, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jg	COMP_FALSE_BinaryExpression_7fa1a5c81748

COMP_TRUE_BinaryExpression_7fa1a5c81748:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7fa1a5c81748

COMP_FALSE_BinaryExpression_7fa1a5c81748:
	movq	$0, %rax
COMP_END_BinaryExpression_7fa1a5c81748:
	cmp	$0, %rax
	je	IfEvalStatement_7fa1a5c887f0_ELSE
IfEvalStatement_7fa1a5c887f0_THEN:
	movq	$1, %rax
	jmp	IfEvalStatement_7fa1a5c887f0_END

IfEvalStatement_7fa1a5c887f0_ELSE:
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
IfEvalStatement_7fa1a5c887f0_END:
	leave	
	ret	

	addq	$0, %rsp

	movq	$0, %rax
	leave	
	ret	
main:
	pushq	%rbp
	movq	%rsp, %rbp

	subq	$8, %rsp
	movq	$0, -8(%rbp)
ForExpression_7fa1a5c39b38_INIT:
	movq	$0, %rax

	movq	%rax, -8(%rbp)
ForExpression_7fa1a5c39b38_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$10, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7fa1a5c33400

COMP_TRUE_BinaryExpression_7fa1a5c33400:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7fa1a5c33400

COMP_FALSE_BinaryExpression_7fa1a5c33400:
	movq	$0, %rax
COMP_END_BinaryExpression_7fa1a5c33400:
	cmp	$0, %rax
	je	ForExpression_7fa1a5c39b38_END
ForExpression_7fa1a5c39b38_BODY:
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

ForExpression_7fa1a5c39b38_STEP:
	movq	-8(%rbp), %rax
	pushq	%rax
	incq	%rax
	movq	%rax, -8(%rbp)
	popq	%rax
	jmp	ForExpression_7fa1a5c39b38_COND
ForExpression_7fa1a5c39b38_END:

	addq	$8, %rsp

	movq	$0, %rax
	leave	
	ret	
