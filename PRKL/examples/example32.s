    .text
            .global main

            .type	main, @function
        .data 
main:
	pushq	%rbp
	movq	%rsp, %rbp

	subq	$8, %rsp
	movq	$10, -8(%rbp)
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
IfEvalStatement_7ff74a648f28_COND:
	movq	-8(%rbp), %rax
	cmp	$0, %rax
	je	IfEvalStatement_7ff74a648f28_ELSE
IfEvalStatement_7ff74a648f28_THEN:
	movq	$20, %rax
	jmp	IfEvalStatement_7ff74a648f28_END

IfEvalStatement_7ff74a648f28_ELSE:
	movq	$30, %rax
IfEvalStatement_7ff74a648f28_END:
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
IfEvalStatement_7ff74a65a160_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$10, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jne	COMP_FALSE_BinaryExpression_7ff74a65a0b8

COMP_TRUE_BinaryExpression_7ff74a65a0b8:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7ff74a65a0b8

COMP_FALSE_BinaryExpression_7ff74a65a0b8:
	movq	$0, %rax
COMP_END_BinaryExpression_7ff74a65a0b8:
	cmp	$0, %rax
	je	IfEvalStatement_7ff74a65a160_ELSE
IfEvalStatement_7ff74a65a160_THEN:
	movq	$20, %rax
	jmp	IfEvalStatement_7ff74a65a160_END

IfEvalStatement_7ff74a65a160_ELSE:
	movq	$30, %rax
IfEvalStatement_7ff74a65a160_END:
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
	movq	-8(%rbp), %rax

	pushq	%rax
IfEvalStatement_7ff74a65a5f8_COND:
	movq	$10, %rax
	cmp	$0, %rax
	je	IfEvalStatement_7ff74a65a5f8_ELSE
IfEvalStatement_7ff74a65a5f8_THEN:
	movq	$20, %rax
	jmp	IfEvalStatement_7ff74a65a5f8_END

IfEvalStatement_7ff74a65a5f8_ELSE:
	movq	$30, %rax
IfEvalStatement_7ff74a65a5f8_END:
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jne	COMP_FALSE_BinaryExpression_7ff74a65a668

COMP_TRUE_BinaryExpression_7ff74a65a668:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7ff74a65a668

COMP_FALSE_BinaryExpression_7ff74a65a668:
	movq	$0, %rax
COMP_END_BinaryExpression_7ff74a65a668:
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
IfEvalStatement_7ff74a65a4a8_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
IfEvalStatement_7ff74a65a7f0_COND:
	movq	$10, %rax
	cmp	$0, %rax
	je	IfEvalStatement_7ff74a65a7f0_ELSE
IfEvalStatement_7ff74a65a7f0_THEN:
	movq	$20, %rax
	jmp	IfEvalStatement_7ff74a65a7f0_END

IfEvalStatement_7ff74a65a7f0_ELSE:
	movq	$30, %rax
IfEvalStatement_7ff74a65a7f0_END:
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jne	COMP_FALSE_BinaryExpression_7ff74a65a860

COMP_TRUE_BinaryExpression_7ff74a65a860:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7ff74a65a860

COMP_FALSE_BinaryExpression_7ff74a65a860:
	movq	$0, %rax
COMP_END_BinaryExpression_7ff74a65a860:
	cmp	$0, %rax
	je	IfEvalStatement_7ff74a65a4a8_ELSE
IfEvalStatement_7ff74a65a4a8_THEN:
	movq	$40, %rax
	jmp	IfEvalStatement_7ff74a65a4a8_END

IfEvalStatement_7ff74a65a4a8_ELSE:
	movq	$50, %rax
IfEvalStatement_7ff74a65a4a8_END:
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
IfEvalStatement_7ff74a65a828_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$10, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jne	COMP_FALSE_BinaryExpression_7ff74a65a630

COMP_TRUE_BinaryExpression_7ff74a65a630:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7ff74a65a630

COMP_FALSE_BinaryExpression_7ff74a65a630:
	movq	$0, %rax
COMP_END_BinaryExpression_7ff74a65a630:
	cmp	$0, %rax
	je	IfEvalStatement_7ff74a65a828_ELSE
IfEvalStatement_7ff74a65a828_THEN:
	movq	$20, %rax
	jmp	IfEvalStatement_7ff74a65a828_END

IfEvalStatement_7ff74a65a828_ELSE:
IfEvalStatement_7ff74a65a7b8_COND:
	movq	$30, %rax
	cmp	$0, %rax
	je	IfEvalStatement_7ff74a65a7b8_ELSE
IfEvalStatement_7ff74a65a7b8_THEN:
	movq	$40, %rax
	jmp	IfEvalStatement_7ff74a65a7b8_END

IfEvalStatement_7ff74a65a7b8_ELSE:
	movq	$50, %rax
IfEvalStatement_7ff74a65a7b8_END:
IfEvalStatement_7ff74a65a828_END:
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
IfEvalStatement_7ff74a65ab38_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$10, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	je	COMP_FALSE_BinaryExpression_7ff74a65a9e8

COMP_TRUE_BinaryExpression_7ff74a65a9e8:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7ff74a65a9e8

COMP_FALSE_BinaryExpression_7ff74a65a9e8:
	movq	$0, %rax
COMP_END_BinaryExpression_7ff74a65a9e8:
	cmp	$0, %rax
	je	IfEvalStatement_7ff74a65ab38_ELSE
IfEvalStatement_7ff74a65ab38_THEN:
	movq	$20, %rax
	jmp	IfEvalStatement_7ff74a65ab38_END

IfEvalStatement_7ff74a65ab38_ELSE:
IfEvalStatement_7ff74a65ab00_COND:
	movq	$30, %rax
	cmp	$0, %rax
	je	IfEvalStatement_7ff74a65ab00_ELSE
IfEvalStatement_7ff74a65ab00_THEN:
	movq	$40, %rax
	jmp	IfEvalStatement_7ff74a65ab00_END

IfEvalStatement_7ff74a65ab00_ELSE:
	movq	$50, %rax
IfEvalStatement_7ff74a65ab00_END:
IfEvalStatement_7ff74a65ab38_END:
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

	addq	$8, %rsp

	movq	$0, %rax
	leave	
	ret	
