    .text
            .global main

            .type	main, @function
        .data 
fac:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	subq	$8, %rsp
IfEvalStatement_7fe5a5a5a198_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$1, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jg	COMP_FALSE_BinaryExpression_7fe5a5a50da0

COMP_TRUE_BinaryExpression_7fe5a5a50da0:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7fe5a5a50da0

COMP_FALSE_BinaryExpression_7fe5a5a50da0:
	movq	$0, %rax
COMP_END_BinaryExpression_7fe5a5a50da0:
	cmp	$0, %rax
	je	IfEvalStatement_7fe5a5a5a198_ELSE
IfEvalStatement_7fe5a5a5a198_THEN:
	movq	$1, %rax
	jmp	IfEvalStatement_7fe5a5a5a198_END

IfEvalStatement_7fe5a5a5a198_ELSE:
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
IfEvalStatement_7fe5a5a5a198_END:
	leave	
	ret	


	leave	
	ret	
main:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	$0, -8(%rbp)

	subq	$8, %rsp
ForExpression_7fe5a5a5ff28_INIT:
	movq	$0, %rax

	movq	%rax, -8(%rbp)
ForExpression_7fe5a5a5ff28_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$10, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7fe5a5a5f710

COMP_TRUE_BinaryExpression_7fe5a5a5f710:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7fe5a5a5f710

COMP_FALSE_BinaryExpression_7fe5a5a5f710:
	movq	$0, %rax
COMP_END_BinaryExpression_7fe5a5a5f710:
	cmp	$0, %rax
	je	ForExpression_7fe5a5a5ff28_END
ForExpression_7fe5a5a5ff28_BODY:
	subq	$8, %rsp
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

ForExpression_7fe5a5a5ff28_STEP:
	movq	-8(%rbp), %rax
	pushq	%rax
	incq	%rax
	movq	%rax, -8(%rbp)
	popq	%rax
	jmp	ForExpression_7fe5a5a5ff28_COND
ForExpression_7fe5a5a5ff28_END:


	leave	
	ret	
