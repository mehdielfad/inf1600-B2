.data
	factor: .float 2.0

	p: 	.float 0

	mside1: .float 0

	mside2: .float 0

	mside3: .float 0
.text

.globl _ZNK9CTriangle7AreaAsmEv

_ZNK9CTriangle7AreaAsmEv:

	push %ebp      /* save old base pointer */
	mov %esp, %ebp /* set ebp to current esp */
	
	mov 8(%ebp), %eax
	push %eax
	
	mov (%eax), %ebx
	call *8(%ebx)
	
	fld factor
	fdivrp
	fstp p
	
	fld p
	fld 4(%eax)
	fsubrp
				
	fstp mside1
	
	fld p
	fld 8(%eax)
	fsubrp
	
	fstp mside2
	
	fld p
	fld 12(%eax)
	fsubrp
	
	fstp mside3
	
	fld p
	fld mside1
	fmulp	
	fld mside2
	fmulp
	fld mside3
	fmulp
	
	fsqrt
	
	leave          /* restore ebp and esp */
	ret            /* return to the caller */
