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
	jge	COMP_FALSE_BinaryExpression_7fae12ca77f0

COMP_TRUE_BinaryExpression_7fae12ca77f0:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7fae12ca77f0

COMP_FALSE_BinaryExpression_7fae12ca77f0:
	movq	$0, %rax
COMP_END_BinaryExpression_7fae12ca77f0:

	cmp	$0, %rax
	je	COMP_FALSE_BinaryExpression_7fae12ca79b0

	movq	$40, %rax

	pushq	%rax
	movq	$40, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jg	COMP_FALSE_BinaryExpression_7fae12ca7940

COMP_TRUE_BinaryExpression_7fae12ca7940:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7fae12ca7940

COMP_FALSE_BinaryExpression_7fae12ca7940:
	movq	$0, %rax
COMP_END_BinaryExpression_7fae12ca7940:
	jmp	COMP_END_BinaryExpression_7fae12ca79b0

COMP_FALSE_BinaryExpression_7fae12ca79b0:
	movq	$0, %rax
COMP_END_BinaryExpression_7fae12ca79b0:
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
	jge	COMP_FALSE_BinaryExpression_7fae12ca7b00

COMP_TRUE_BinaryExpression_7fae12ca7b00:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7fae12ca7b00

COMP_FALSE_BinaryExpression_7fae12ca7b00:
	movq	$0, %rax
COMP_END_BinaryExpression_7fae12ca7b00:

	cmp	$0, %rax
	je	COMP_FALSE_BinaryExpression_7fae12ca7c18

	movq	$40, %rax

	pushq	%rax
	movq	$40, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jl	COMP_FALSE_BinaryExpression_7fae12ca7b70

COMP_TRUE_BinaryExpression_7fae12ca7b70:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7fae12ca7b70

COMP_FALSE_BinaryExpression_7fae12ca7b70:
	movq	$0, %rax
COMP_END_BinaryExpression_7fae12ca7b70:
	jmp	COMP_END_BinaryExpression_7fae12ca7c18

COMP_FALSE_BinaryExpression_7fae12ca7c18:
	movq	$0, %rax
COMP_END_BinaryExpression_7fae12ca7c18:

	cmp	$0, %rax
	jne	COMP_FALSE_BinaryExpression_7fae12ca7c50

	movq	$333, %rax
	jmp	COMP_END_BinaryExpression_7fae12ca7c50

COMP_FALSE_BinaryExpression_7fae12ca7c50:
	movq	$1, %rax
COMP_END_BinaryExpression_7fae12ca7c50:
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
