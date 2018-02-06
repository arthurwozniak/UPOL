    .text
            .global main

            .type	main, @function
        .data 
fa:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	subq	$8, %rsp
IfEvalStatement_7f249076e780_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$1, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jg	COMP_FALSE_BinaryExpression_7f24907ab2b0

COMP_TRUE_BinaryExpression_7f24907ab2b0:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f24907ab2b0

COMP_FALSE_BinaryExpression_7f24907ab2b0:
	movq	$0, %rax
COMP_END_BinaryExpression_7f24907ab2b0:
	cmp	$0, %rax
	je	IfEvalStatement_7f249076e780_ELSE
IfEvalStatement_7f249076e780_THEN:
	movq	$1, %rax
	jmp	IfEvalStatement_7f249076e780_END

IfEvalStatement_7f249076e780_ELSE:
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
IfEvalStatement_7f249076e780_END:
	leave	
	ret	

	addq	$0, %rsp

	movq	$0, %rax
	leave	
	ret	
fb:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	subq	$8, %rsp
IfEvalStatement_7f249076bdd8_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$1, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jg	COMP_FALSE_BinaryExpression_7f24907d60b8

COMP_TRUE_BinaryExpression_7f24907d60b8:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f24907d60b8

COMP_FALSE_BinaryExpression_7f24907d60b8:
	movq	$0, %rax
COMP_END_BinaryExpression_7f24907d60b8:
	cmp	$0, %rax
	je	IfEvalStatement_7f249076bdd8_ELSE
IfEvalStatement_7f249076bdd8_THEN:
	movq	$1, %rax
	jmp	IfEvalStatement_7f249076bdd8_END

IfEvalStatement_7f249076bdd8_ELSE:
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
IfEvalStatement_7f249076bdd8_END:
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
ForExpression_7f2490728358_INIT:
	movq	$0, %rax

	movq	%rax, -8(%rbp)
ForExpression_7f2490728358_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$10, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7f24907665f8

COMP_TRUE_BinaryExpression_7f24907665f8:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f24907665f8

COMP_FALSE_BinaryExpression_7f24907665f8:
	movq	$0, %rax
COMP_END_BinaryExpression_7f24907665f8:
	cmp	$0, %rax
	je	ForExpression_7f2490728358_END
ForExpression_7f2490728358_BODY:
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

ForExpression_7f2490728358_STEP:
	movq	-8(%rbp), %rax
	pushq	%rax
	incq	%rax
	movq	%rax, -8(%rbp)
	popq	%rax
	jmp	ForExpression_7f2490728358_COND
ForExpression_7f2490728358_END:

	addq	$8, %rsp

	movq	$0, %rax
	leave	
	ret	
