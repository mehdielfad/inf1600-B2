.data
	factor: .float 2.0
	A:	.float 0

.text	

.globl	_ZNK9CTriangle9HeightAsmEv

_ZNK9CTriangle9HeightAsmEv:

	push %ebp      /* save old base pointer */
	mov %esp, %ebp /* set ebp to current esp */
	
	8(%ebp), %eax
	push %eax
	mov (%eax), %ebx
	call *16(%ebx)
	fstp A
	
	fld factor
	fld A
	fmulp
	
	fld 12(%eax)
	fdivrp
	
	leave          /* restore ebp and esp */
	ret            /* return to the caller */
