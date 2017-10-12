.data
	factor: .float 2.0

.text

.globl _ZNK7CCircle12PerimeterAsmEv

_ZNK7CCircle12PerimeterAsmEv:

	push %ebp      /* save old base pointer */
	mov %esp, %ebp /* set ebp to current esp */
	mov 8(%ebp), %ebx
	fld 4(%ebx)
	fld factor
	fmulp
	fldpi
	fmulp
	
	leave          /* restore ebp and esp */
        ret            /* return to the caller */
