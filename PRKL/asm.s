    .text
            .globl main

            .type	main, @function
main:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$24, %rbp
	movq	$0, -0(%rbp)

	movq	$1, -8(%rbp)

	movq	$0, -16(%rbp)

FORLOOP_0x7ff6a91947f0_INIT:
	movq	-16(%rbp), %rax

	pushq	%rax
	movq	$0, %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax
FORLOOP_0x7ff6a91947f0_COND:
	movq	-16(%rbp), %rax

	pushq	%rax
	movq	$20, %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax
FORLOOP_0x7ff6a91947f0_BODY:
	subq	$8, %rbp
	movq	$b, -0(%rbp)

	movq	-8(%rbp), %rax

	pushq	%rax
	movq	-0(%rbp), %rax

	pushq	%rax
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax

	movq	-0(%rbp), %rax

	pushq	%rax
	movq	-0(%rbp), %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax

	movq	-0(%rbp), %rax
	movq	%rax, %rdi
	call	print_long

	call	print_nl

	jmp	FORLOOP_0x7ff6a91947f0_COND
FORLOOP_0x7ff6a91947f0_END:

	movq	-0(%rbp), %rax
	movq	%rax, %rdi
	call	print_long


	ret	
