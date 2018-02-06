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
IfEvalStatement_7f1662691a20_COND:
	movq	-8(%rbp), %rax
	cmp	$0, %rax
	je	IfEvalStatement_7f1662691a20_ELSE
IfEvalStatement_7f1662691a20_THEN:
	movq	$20, %rax
	jmp	IfEvalStatement_7f1662691a20_END

IfEvalStatement_7f1662691a20_ELSE:
	movq	$30, %rax
IfEvalStatement_7f1662691a20_END:
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
IfEvalStatement_7f1662691c18_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$10, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jne	COMP_FALSE_BinaryExpression_7f1662691b70

COMP_TRUE_BinaryExpression_7f1662691b70:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f1662691b70

COMP_FALSE_BinaryExpression_7f1662691b70:
	movq	$0, %rax
COMP_END_BinaryExpression_7f1662691b70:
	cmp	$0, %rax
	je	IfEvalStatement_7f1662691c18_ELSE
IfEvalStatement_7f1662691c18_THEN:
	movq	$20, %rax
	jmp	IfEvalStatement_7f1662691c18_END

IfEvalStatement_7f1662691c18_ELSE:
	movq	$30, %rax
IfEvalStatement_7f1662691c18_END:
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
IfEvalStatement_7f1662691da0_COND:
	movq	$10, %rax
	cmp	$0, %rax
	je	IfEvalStatement_7f1662691da0_ELSE
IfEvalStatement_7f1662691da0_THEN:
	movq	$20, %rax
	jmp	IfEvalStatement_7f1662691da0_END

IfEvalStatement_7f1662691da0_ELSE:
	movq	$30, %rax
IfEvalStatement_7f1662691da0_END:
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jne	COMP_FALSE_BinaryExpression_7f1662691e10

COMP_TRUE_BinaryExpression_7f1662691e10:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f1662691e10

COMP_FALSE_BinaryExpression_7f1662691e10:
	movq	$0, %rax
COMP_END_BinaryExpression_7f1662691e10:
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
IfEvalStatement_7f1662695048_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
IfEvalStatement_7f1662691f98_COND:
	movq	$10, %rax
	cmp	$0, %rax
	je	IfEvalStatement_7f1662691f98_ELSE
IfEvalStatement_7f1662691f98_THEN:
	movq	$20, %rax
	jmp	IfEvalStatement_7f1662691f98_END

IfEvalStatement_7f1662691f98_ELSE:
	movq	$30, %rax
IfEvalStatement_7f1662691f98_END:
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jne	COMP_FALSE_BinaryExpression_7f16626952e8

COMP_TRUE_BinaryExpression_7f16626952e8:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f16626952e8

COMP_FALSE_BinaryExpression_7f16626952e8:
	movq	$0, %rax
COMP_END_BinaryExpression_7f16626952e8:
	cmp	$0, %rax
	je	IfEvalStatement_7f1662695048_ELSE
IfEvalStatement_7f1662695048_THEN:
	movq	$40, %rax
	jmp	IfEvalStatement_7f1662695048_END

IfEvalStatement_7f1662695048_ELSE:
	movq	$50, %rax
IfEvalStatement_7f1662695048_END:
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
IfEvalStatement_7f1662695320_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$10, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jne	COMP_FALSE_BinaryExpression_7f1662695198

COMP_TRUE_BinaryExpression_7f1662695198:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f1662695198

COMP_FALSE_BinaryExpression_7f1662695198:
	movq	$0, %rax
COMP_END_BinaryExpression_7f1662695198:
	cmp	$0, %rax
	je	IfEvalStatement_7f1662695320_ELSE
IfEvalStatement_7f1662695320_THEN:
	movq	$20, %rax
	jmp	IfEvalStatement_7f1662695320_END

IfEvalStatement_7f1662695320_ELSE:
IfEvalStatement_7f16626952b0_COND:
	movq	$30, %rax
	cmp	$0, %rax
	je	IfEvalStatement_7f16626952b0_ELSE
IfEvalStatement_7f16626952b0_THEN:
	movq	$40, %rax
	jmp	IfEvalStatement_7f16626952b0_END

IfEvalStatement_7f16626952b0_ELSE:
	movq	$50, %rax
IfEvalStatement_7f16626952b0_END:
IfEvalStatement_7f1662695320_END:
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
IfEvalStatement_7f1662695630_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$10, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	je	COMP_FALSE_BinaryExpression_7f16626954e0

COMP_TRUE_BinaryExpression_7f16626954e0:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f16626954e0

COMP_FALSE_BinaryExpression_7f16626954e0:
	movq	$0, %rax
COMP_END_BinaryExpression_7f16626954e0:
	cmp	$0, %rax
	je	IfEvalStatement_7f1662695630_ELSE
IfEvalStatement_7f1662695630_THEN:
	movq	$20, %rax
	jmp	IfEvalStatement_7f1662695630_END

IfEvalStatement_7f1662695630_ELSE:
IfEvalStatement_7f16626955f8_COND:
	movq	$30, %rax
	cmp	$0, %rax
	je	IfEvalStatement_7f16626955f8_ELSE
IfEvalStatement_7f16626955f8_THEN:
	movq	$40, %rax
	jmp	IfEvalStatement_7f16626955f8_END

IfEvalStatement_7f16626955f8_ELSE:
	movq	$50, %rax
IfEvalStatement_7f16626955f8_END:
IfEvalStatement_7f1662695630_END:
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
