    .text
            .global main

            .type	main, @function
        .data 
fib:
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
	movq	$43, %rax
	movq	%rax, %rdi
	call	print_char
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

IfStatement_7f1043d6b5c0_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$1, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jg	COMP_FALSE_BinaryExpression_7f1043d6b320

COMP_TRUE_BinaryExpression_7f1043d6b320:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f1043d6b320

COMP_FALSE_BinaryExpression_7f1043d6b320:
	movq	$0, %rax
COMP_END_BinaryExpression_7f1043d6b320:
	cmp	$0, %rax
	je	IfStatement_7f1043d6b5c0_ELSE
IfStatement_7f1043d6b5c0_THEN:
	subq	$8, %rsp
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$46, %rax
	movq	%rax, %rdi
	call	print_char
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	jmp	IfStatement_7f1043d6b5c0_END

IfStatement_7f1043d6b5c0_ELSE:
	subq	$8, %rsp
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
	call	fib
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
	movq	$2, %rax
	movq	%rax, %rcx
	popq	%rax
	subq	%rcx, %rax
	movq	%rax, %rdi
	call	fib
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

IfStatement_7f1043d6b5c0_END:

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$45, %rax
	movq	%rax, %rdi
	call	print_char
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi


	leave	
	ret	
main:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	$0, -8(%rbp)

	subq	$8, %rsp
ForExpression_7f1043d633c8_INIT:
	movq	$0, %rax

	movq	%rax, -8(%rbp)
ForExpression_7f1043d633c8_COND:
	movq	-8(%rbp), %rax

	pushq	%rax
	movq	$7, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7f1043d6b828

COMP_TRUE_BinaryExpression_7f1043d6b828:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7f1043d6b828

COMP_FALSE_BinaryExpression_7f1043d6b828:
	movq	$0, %rax
COMP_END_BinaryExpression_7f1043d6b828:
	cmp	$0, %rax
	je	ForExpression_7f1043d633c8_END
ForExpression_7f1043d633c8_BODY:
	subq	$8, %rsp
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fib
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

ForExpression_7f1043d633c8_STEP:
	movq	-8(%rbp), %rax
	pushq	%rax
	incq	%rax
	movq	%rax, -8(%rbp)
	popq	%rax
	jmp	ForExpression_7f1043d633c8_COND
ForExpression_7f1043d633c8_END:


	leave	
	ret	
