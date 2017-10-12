.globl _ZNK7CCircle7AreaAsmEv

_ZNK7CCircle7AreaAsmEv:
	push %ebp      /* save old base pointer */
	mov %esp, %ebp /* set ebp to current esp */
	
	mov 8(%ebp), %ecx
	
	fld 4(%ecx)
	fldpi
	fmulp
	
	fld 4(%ecx)
	fmulp
	
	leave          /* restore ebp and esp */
	ret            /* return to the caller */
