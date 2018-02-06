    .text
            .global main

            .type	main, @function
        .data 
line_of_stars:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	subq	$8, %rsp

	subq	$8, %rsp
	movq	$0, -16(%rbp)
ForExpression_7fc2d28b7278_INIT:
ForExpression_7fc2d28b7278_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$0, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7fc2d28b6f28

COMP_TRUE_BinaryExpression_7fc2d28b6f28:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7fc2d28b6f28

COMP_FALSE_BinaryExpression_7fc2d28b6f28:
	movq	$0, %rax
COMP_END_BinaryExpression_7fc2d28b6f28:
	cmp	$0, %rax
	je	NOT_FALSE_UnaryExpression_7fc2d28b6dd8

NOT_TRUE_UnaryExpression_7fc2d28b6dd8:
	movq	$0, %rax
	jmp	NOT_END_UnaryExpression_7fc2d28b6dd8

NOT_FALSE_UnaryExpression_7fc2d28b6dd8:
	movq	$1, %rax
NOT_END_UnaryExpression_7fc2d28b6dd8:
	cmp	$0, %rax
	je	ForExpression_7fc2d28b7278_END
ForExpression_7fc2d28b7278_BODY:
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$42, %rax
	movq	%rax, %rdi
	call	print_char
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

ForExpression_7fc2d28b7278_STEP:
	movq	-8(%rbp), %rax
	pushq	%rax
	decq	%rax
	movq	%rax, -8(%rbp)
	popq	%rax
	jmp	ForExpression_7fc2d28b7278_COND
ForExpression_7fc2d28b7278_END:

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

	addq	$8, %rsp

	movq	$0, %rax
	leave	
	ret	
main:
	pushq	%rbp
	movq	%rsp, %rbp

	subq	$8, %rsp
	movq	$0, -8(%rbp)
ForExpression_7fc2d28b7b38_INIT:
	movq	$1, %rax

	movq	%rax, -8(%rbp)
ForExpression_7fc2d28b7b38_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$10, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jg	COMP_FALSE_BinaryExpression_7fc2d28b7940

COMP_TRUE_BinaryExpression_7fc2d28b7940:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7fc2d28b7940

COMP_FALSE_BinaryExpression_7fc2d28b7940:
	movq	$0, %rax
COMP_END_BinaryExpression_7fc2d28b7940:
	cmp	$0, %rax
	je	ForExpression_7fc2d28b7b38_END
ForExpression_7fc2d28b7b38_BODY:
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$10, %rax

	pushq	%rax
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	popq	%rax
	subq	%rcx, %rax
	movq	%rax, %rdi
	call	line_of_stars
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

ForExpression_7fc2d28b7b38_STEP:
	movq	-8(%rbp), %rax
	pushq	%rax
	incq	%rax
	movq	%rax, -8(%rbp)
	popq	%rax
	jmp	ForExpression_7fc2d28b7b38_COND
ForExpression_7fc2d28b7b38_END:

	addq	$8, %rsp

	movq	$0, %rax
	leave	
	ret	
