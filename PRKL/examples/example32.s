    .text
            .global main

            .type	main, @function
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
IfEvalStatement_7f374298b898_COND:
	movq	-8(%rbp), %rax
	cmp	$0, %rax
	je	IfEvalStatement_7f374298b898_ELSE
IfEvalStatement_7f374298b898_THEN:
	movq	$20, %rax
	jmp	IfEvalStatement_7f374298b898_END

IfEvalStatement_7f374298b898_ELSE:
	movq	$30, %rax
IfEvalStatement_7f374298b898_END:
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
IfEvalStatement_7f374298ba90_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$10, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jne	COMP_FALSE_BinaryExpression_7f374298b9e8

COMP_TRUE_BinaryExpression_7f374298b9e8:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f374298b9e8

COMP_FALSE_BinaryExpression_7f374298b9e8:
	movq	$0, %rax
COMP_END_BinaryExpression_7f374298b9e8:
	cmp	$0, %rax
	je	IfEvalStatement_7f374298ba90_ELSE
IfEvalStatement_7f374298ba90_THEN:
	movq	$20, %rax
	jmp	IfEvalStatement_7f374298ba90_END

IfEvalStatement_7f374298ba90_ELSE:
	movq	$30, %rax
IfEvalStatement_7f374298ba90_END:
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
IfEvalStatement_7f374298bf28_COND:
	movq	$10, %rax
	cmp	$0, %rax
	je	IfEvalStatement_7f374298bf28_ELSE
IfEvalStatement_7f374298bf28_THEN:
	movq	$20, %rax
	jmp	IfEvalStatement_7f374298bf28_END

IfEvalStatement_7f374298bf28_ELSE:
	movq	$30, %rax
IfEvalStatement_7f374298bf28_END:
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jne	COMP_FALSE_BinaryExpression_7f374298bc18

COMP_TRUE_BinaryExpression_7f374298bc18:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f374298bc18

COMP_FALSE_BinaryExpression_7f374298bc18:
	movq	$0, %rax
COMP_END_BinaryExpression_7f374298bc18:
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
IfEvalStatement_7f374298beb8_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
IfEvalStatement_7f374298bda0_COND:
	movq	$10, %rax
	cmp	$0, %rax
	je	IfEvalStatement_7f374298bda0_ELSE
IfEvalStatement_7f374298bda0_THEN:
	movq	$20, %rax
	jmp	IfEvalStatement_7f374298bda0_END

IfEvalStatement_7f374298bda0_ELSE:
	movq	$30, %rax
IfEvalStatement_7f374298bda0_END:
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jne	COMP_FALSE_BinaryExpression_7f374298be10

COMP_TRUE_BinaryExpression_7f374298be10:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f374298be10

COMP_FALSE_BinaryExpression_7f374298be10:
	movq	$0, %rax
COMP_END_BinaryExpression_7f374298be10:
	cmp	$0, %rax
	je	IfEvalStatement_7f374298beb8_ELSE
IfEvalStatement_7f374298beb8_THEN:
	movq	$40, %rax
	jmp	IfEvalStatement_7f374298beb8_END

IfEvalStatement_7f374298beb8_ELSE:
	movq	$50, %rax
IfEvalStatement_7f374298beb8_END:
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
IfEvalStatement_7f3742987208_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$10, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jne	COMP_FALSE_BinaryExpression_7f37429870b8

COMP_TRUE_BinaryExpression_7f37429870b8:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f37429870b8

COMP_FALSE_BinaryExpression_7f37429870b8:
	movq	$0, %rax
COMP_END_BinaryExpression_7f37429870b8:
	cmp	$0, %rax
	je	IfEvalStatement_7f3742987208_ELSE
IfEvalStatement_7f3742987208_THEN:
	movq	$20, %rax
	jmp	IfEvalStatement_7f3742987208_END

IfEvalStatement_7f3742987208_ELSE:
IfEvalStatement_7f37429871d0_COND:
	movq	$30, %rax
	cmp	$0, %rax
	je	IfEvalStatement_7f37429871d0_ELSE
IfEvalStatement_7f37429871d0_THEN:
	movq	$40, %rax
	jmp	IfEvalStatement_7f37429871d0_END

IfEvalStatement_7f37429871d0_ELSE:
	movq	$50, %rax
IfEvalStatement_7f37429871d0_END:
IfEvalStatement_7f3742987208_END:
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
IfEvalStatement_7f37429874a8_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$10, %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax
	cmp	$0, %rax
	je	IfEvalStatement_7f37429874a8_ELSE
IfEvalStatement_7f37429874a8_THEN:
	movq	$20, %rax
	jmp	IfEvalStatement_7f37429874a8_END

IfEvalStatement_7f37429874a8_ELSE:
IfEvalStatement_7f3742987470_COND:
	movq	$30, %rax
	cmp	$0, %rax
	je	IfEvalStatement_7f3742987470_ELSE
IfEvalStatement_7f3742987470_THEN:
	movq	$40, %rax
	jmp	IfEvalStatement_7f3742987470_END

IfEvalStatement_7f3742987470_ELSE:
	movq	$50, %rax
IfEvalStatement_7f3742987470_END:
IfEvalStatement_7f37429874a8_END:
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


	leave	
	ret	
