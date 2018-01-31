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
IfStatement_7ff3258fc4a8_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$0, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jg	COMP_FALSE_BinaryExpression_7ff325972cc0

COMP_TRUE_BinaryExpression_7ff325972cc0:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7ff325972cc0

COMP_FALSE_BinaryExpression_7ff325972cc0:
	movq	$0, %rax
COMP_END_BinaryExpression_7ff325972cc0:
	cmp	$0, %rax
	je	IfStatement_7ff3258fc4a8_ELSE
IfStatement_7ff3258fc4a8_THEN:
	subq	$16, %rsp
	movq	-16(%rbp), %rax
	leave	
	ret	

	jmp	IfStatement_7ff3258fc4a8_END

IfStatement_7ff3258fc4a8_ELSE:
IfStatement_7ff3258fc4a8_END:

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


	leave	
	ret	
main:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	$0, -8(%rbp)

	subq	$8, %rsp
ForExpression_7ff3259076a0_INIT:
	movq	$0, %rax

	movq	%rax, -8(%rbp)
ForExpression_7ff3259076a0_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$10, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7ff325904128

COMP_TRUE_BinaryExpression_7ff325904128:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7ff325904128

COMP_FALSE_BinaryExpression_7ff325904128:
	movq	$0, %rax
COMP_END_BinaryExpression_7ff325904128:
	cmp	$0, %rax
	je	ForExpression_7ff3259076a0_END
ForExpression_7ff3259076a0_BODY:
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

ForExpression_7ff3259076a0_STEP:
	movq	-8(%rbp), %rax
	pushq	%rax
	incq	%rax
	movq	%rax, -8(%rbp)
	popq	%rax
	jmp	ForExpression_7ff3259076a0_COND
ForExpression_7ff3259076a0_END:


	leave	
	ret	
