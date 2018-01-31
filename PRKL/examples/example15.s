    .text
            .global main

            .type	main, @function
        .data 
fa:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	subq	$8, %rsp
IfEvalStatement_7fb3ecafe0b8_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$1, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jg	COMP_FALSE_BinaryExpression_7fb3ecafe1d0

COMP_TRUE_BinaryExpression_7fb3ecafe1d0:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7fb3ecafe1d0

COMP_FALSE_BinaryExpression_7fb3ecafe1d0:
	movq	$0, %rax
COMP_END_BinaryExpression_7fb3ecafe1d0:
	cmp	$0, %rax
	je	IfEvalStatement_7fb3ecafe0b8_ELSE
IfEvalStatement_7fb3ecafe0b8_THEN:
	movq	$1, %rax
	jmp	IfEvalStatement_7fb3ecafe0b8_END

IfEvalStatement_7fb3ecafe0b8_ELSE:
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
	call	fb
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi
	movq	%rax, %rcx
	popq	%rax
	imulq	%rcx, %rax
IfEvalStatement_7fb3ecafe0b8_END:
	leave	
	ret	


	leave	
	ret	
fb:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	subq	$8, %rsp
IfEvalStatement_7fb3ecb07c88_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$1, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jg	COMP_FALSE_BinaryExpression_7fb3ecb06198

COMP_TRUE_BinaryExpression_7fb3ecb06198:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7fb3ecb06198

COMP_FALSE_BinaryExpression_7fb3ecb06198:
	movq	$0, %rax
COMP_END_BinaryExpression_7fb3ecb06198:
	cmp	$0, %rax
	je	IfEvalStatement_7fb3ecb07c88_ELSE
IfEvalStatement_7fb3ecb07c88_THEN:
	movq	$1, %rax
	jmp	IfEvalStatement_7fb3ecb07c88_END

IfEvalStatement_7fb3ecb07c88_ELSE:
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
	call	fa
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi
	movq	%rax, %rcx
	popq	%rax
	imulq	%rcx, %rax
IfEvalStatement_7fb3ecb07c88_END:
	leave	
	ret	


	leave	
	ret	
main:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	$0, -8(%rbp)

	subq	$8, %rsp
ForExpression_7fb3ecb0fa20_INIT:
	movq	$0, %rax

	movq	%rax, -8(%rbp)
ForExpression_7fb3ecb0fa20_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$10, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7fb3ecb0f6a0

COMP_TRUE_BinaryExpression_7fb3ecb0f6a0:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7fb3ecb0f6a0

COMP_FALSE_BinaryExpression_7fb3ecb0f6a0:
	movq	$0, %rax
COMP_END_BinaryExpression_7fb3ecb0f6a0:
	cmp	$0, %rax
	je	ForExpression_7fb3ecb0fa20_END
ForExpression_7fb3ecb0fa20_BODY:
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
	call	fa
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

ForExpression_7fb3ecb0fa20_STEP:
	movq	-8(%rbp), %rax
	pushq	%rax
	incq	%rax
	movq	%rax, -8(%rbp)
	popq	%rax
	jmp	ForExpression_7fb3ecb0fa20_COND
ForExpression_7fb3ecb0fa20_END:


	leave	
	ret	
