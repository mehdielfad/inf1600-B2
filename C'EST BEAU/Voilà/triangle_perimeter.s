
.globl _ZNK9CTriangle12PerimeterAsmEv

_ZNK9CTriangle12PerimeterAsmEv:

	push %ebp      /* save old base pointer */
	mov %esp, %ebp /* set ebp to current esp */
	
	mov 8(%ebp), %ebx
	
	fld 4(%ebx)
	fld 8(%ebx)
	faddp
	
	fld 12(%ebx)
	faddp
	
	leave          /* restore ebp and esp */
	ret            /* return to the caller */
