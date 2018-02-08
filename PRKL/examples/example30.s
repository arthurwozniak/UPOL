    .text
            .global main

            .type	main, @function
        .data 
main:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$1, %rax

	pushq	%rax
	movq	$2, %rax
	movq	%rax, %rcx
	popq	%rax
	orq	%rcx, %rax

	pushq	%rax
	movq	$3, %rax
	movq	%rax, %rcx
	popq	%rax
	orq	%rcx, %rax

	pushq	%rax
	movq	$4, %rax
	movq	%rax, %rcx
	popq	%rax
	orq	%rcx, %rax
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

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$65535, %rax

	pushq	%rax
	movq	$65280, %rax
	movq	%rax, %rcx
	popq	%rax
	andq	%rcx, %rax
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

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$12345, %rax

	pushq	%rax
	movq	$678, %rax
	movq	%rax, %rcx
	popq	%rax
	xorq	%rcx, %rax
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

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$891010, %rax

	pushq	%rax
	movq	$12345, %rax

	pushq	%rax
	movq	$678, %rax
	movq	%rax, %rcx
	popq	%rax
	xorq	%rcx, %rax
	movq	%rax, %rcx
	popq	%rax
	orq	%rcx, %rax
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

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$891010, %rax

	pushq	%rax
	movq	$12345, %rax
	movq	%rax, %rcx
	popq	%rax
	orq	%rcx, %rax

	pushq	%rax
	movq	$678, %rax
	movq	%rax, %rcx
	popq	%rax
	xorq	%rcx, %rax
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

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$891010, %rax

	pushq	%rax
	movq	$12345, %rax

	pushq	%rax
	movq	$678, %rax

	pushq	%rax
	movq	$9, %rax
	movq	%rax, %rcx
	popq	%rax
	cltq	
	salq	%cl, %rax
	movq	%rax, %rcx
	popq	%rax
	xorq	%rcx, %rax
	movq	%rax, %rcx
	popq	%rax
	orq	%rcx, %rax
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

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$891010, %rax

	pushq	%rax
	movq	$12345, %rax

	pushq	%rax
	movq	$678, %rax
	movq	%rax, %rcx
	popq	%rax
	xorq	%rcx, %rax

	pushq	%rax
	movq	$9, %rax
	movq	%rax, %rcx
	popq	%rax
	cltq	
	salq	%cl, %rax
	movq	%rax, %rcx
	popq	%rax
	orq	%rcx, %rax
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

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$891010, %rax

	pushq	%rax
	movq	$12345, %rax

	pushq	%rax
	movq	$678, %rax
	movq	%rax, %rcx
	popq	%rax
	xorq	%rcx, %rax
	movq	%rax, %rcx
	popq	%rax
	orq	%rcx, %rax

	pushq	%rax
	movq	$9, %rax
	movq	%rax, %rcx
	popq	%rax
	cltq	
	salq	%cl, %rax
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

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$10, %rax

	pushq	%rax
	movq	$891010, %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax

	pushq	%rax
	movq	$12345, %rax

	pushq	%rax
	movq	$678, %rax
	movq	%rax, %rcx
	popq	%rax
	xorq	%rcx, %rax

	pushq	%rax
	movq	$9, %rax
	movq	%rax, %rcx
	popq	%rax
	cltq	
	salq	%cl, %rax
	movq	%rax, %rcx
	popq	%rax
	orq	%rcx, %rax
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

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$10, %rax
	notq	%rax

	pushq	%rax
	movq	$891010, %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax

	pushq	%rax
	movq	$12345, %rax

	pushq	%rax
	movq	$678, %rax
	movq	%rax, %rcx
	popq	%rax
	xorq	%rcx, %rax

	pushq	%rax
	movq	$9, %rax
	movq	%rax, %rcx
	popq	%rax
	cltq	
	salq	%cl, %rax
	movq	%rax, %rcx
	popq	%rax
	orq	%rcx, %rax
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

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$10, %rax
	notq	%rax

	pushq	%rax
	movq	$891010, %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax

	pushq	%rax
	movq	$12345, %rax

	pushq	%rax
	movq	$678, %rax
	movq	%rax, %rcx
	popq	%rax
	xorq	%rcx, %rax

	pushq	%rax
	movq	$9, %rax
	movq	%rax, %rcx
	popq	%rax
	cltq	
	salq	%cl, %rax
	movq	%rax, %rcx
	popq	%rax
	orq	%rcx, %rax
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

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$123, %rax
	notq	%rax
	notq	%rax
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

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$10, %rax

	pushq	%rax
	movq	$20, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7fce12a03cf8

COMP_TRUE_BinaryExpression_7fce12a03cf8:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7fce12a03cf8

COMP_FALSE_BinaryExpression_7fce12a03cf8:
	movq	$0, %rax
COMP_END_BinaryExpression_7fce12a03cf8:

	cmp	$0, %rax
	je	COMP_FALSE_BinaryExpression_7fce12a03eb8

	movq	$40, %rax

	pushq	%rax
	movq	$40, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jg	COMP_FALSE_BinaryExpression_7fce12a03e48

COMP_TRUE_BinaryExpression_7fce12a03e48:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7fce12a03e48

COMP_FALSE_BinaryExpression_7fce12a03e48:
	movq	$0, %rax
COMP_END_BinaryExpression_7fce12a03e48:
	jmp	COMP_END_BinaryExpression_7fce12a03eb8

COMP_FALSE_BinaryExpression_7fce12a03eb8:
	movq	$0, %rax
COMP_END_BinaryExpression_7fce12a03eb8:
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

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$10, %rax

	pushq	%rax
	movq	$10, %rax

	pushq	%rax
	movq	$20, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7fce12a06048

COMP_TRUE_BinaryExpression_7fce12a06048:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7fce12a06048

COMP_FALSE_BinaryExpression_7fce12a06048:
	movq	$0, %rax
COMP_END_BinaryExpression_7fce12a06048:

	cmp	$0, %rax
	je	COMP_FALSE_BinaryExpression_7fce12a06160

	movq	$40, %rax

	pushq	%rax
	movq	$40, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jl	COMP_FALSE_BinaryExpression_7fce12a060b8

COMP_TRUE_BinaryExpression_7fce12a060b8:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7fce12a060b8

COMP_FALSE_BinaryExpression_7fce12a060b8:
	movq	$0, %rax
COMP_END_BinaryExpression_7fce12a060b8:
	jmp	COMP_END_BinaryExpression_7fce12a06160

COMP_FALSE_BinaryExpression_7fce12a06160:
	movq	$0, %rax
COMP_END_BinaryExpression_7fce12a06160:

	cmp	$0, %rax
	jne	COMP_FALSE_BinaryExpression_7fce12a06198

	movq	$333, %rax
	jmp	COMP_END_BinaryExpression_7fce12a06198

COMP_FALSE_BinaryExpression_7fce12a06198:
	movq	$1, %rax
COMP_END_BinaryExpression_7fce12a06198:
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax
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


	movq	$0, %rax
	leave	
	ret	
