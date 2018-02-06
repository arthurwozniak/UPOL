    .text
            .global main

            .type	main, @function
        .data 
fac_iter:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	subq	$16, %rsp
IfStatement_7f768d325c18_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$0, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jg	COMP_FALSE_BinaryExpression_7f768d382438

COMP_TRUE_BinaryExpression_7f768d382438:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f768d382438

COMP_FALSE_BinaryExpression_7f768d382438:
	movq	$0, %rax
COMP_END_BinaryExpression_7f768d382438:
	cmp	$0, %rax
	je	IfStatement_7f768d325c18_ELSE
IfStatement_7f768d325c18_THEN:
	movq	-16(%rbp), %rax
	leave	
	ret	

	jmp	IfStatement_7f768d325c18_END

IfStatement_7f768d325c18_ELSE:
IfStatement_7f768d325c18_END:

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

	pushq	%rax
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	popq	%rax
	imulq	%rcx, %rax
	movq	%rax, %rsi
	call	fac_iter
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi
	leave	
	ret	

	addq	$0, %rsp

	movq	$0, %rax
	leave	
	ret	
fac:
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
	movq	$1, %rax
	movq	%rax, %rsi
	call	fac_iter
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi
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
ForExpression_7f768d355208_INIT:
	movq	$0, %rax

	movq	%rax, -8(%rbp)
ForExpression_7f768d355208_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$10, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7f768d388470

COMP_TRUE_BinaryExpression_7f768d388470:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f768d388470

COMP_FALSE_BinaryExpression_7f768d388470:
	movq	$0, %rax
COMP_END_BinaryExpression_7f768d388470:
	cmp	$0, %rax
	je	ForExpression_7f768d355208_END
ForExpression_7f768d355208_BODY:
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

ForExpression_7f768d355208_STEP:
	movq	-8(%rbp), %rax
	pushq	%rax
	incq	%rax
	movq	%rax, -8(%rbp)
	popq	%rax
	jmp	ForExpression_7f768d355208_COND
ForExpression_7f768d355208_END:

	addq	$8, %rsp

	movq	$0, %rax
	leave	
	ret	
