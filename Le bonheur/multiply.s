.globl matrix_diagonal_asm

matrix_diagonal_asm:
            push %ebp      /* Save old base pointer */
            mov %esp, %ebp /* Set ebp to current esp */
            
            sub $8,%esp /* Allocation */
            movl $0,-4(%ebp) /* Initialisation de r */
            
    _boucle_r:
            movl $0,%ecx /* Initialisation de c */
            
    _boucle_c:
            movl $0,%edi /* Initialisation de i*/
            movl $0,-8(%ebp)
            
    _boucle_i:
            movl 20(%ebp),%eax
            mull -4(%ebp)
            addl %edi,%eax
            movl 8(%ebp),%ebx
            movl (%ebx,%eax,4),%ebx
            movl 20(%ebp),%eax
            mull %edi
            addl %ecx,%eax
            movl 12(%ebp),%esi
            movl (%esi,%eax,4),%edx
            imull %ebx,%edx
            addl %edx,-8(%ebp)
            incl %edi
            cmpl %edi,20(%ebp)
            jne _boucle_i
            movl 20(%ebp),%eax
            mull -4(%ebp)
            addl %ecx,%eax
            movl 16(%ebp),%esi
            movl -8(%ebp),%edx
            movl %edx,(%esi,%eax,4)
            incl %ecx
            cmpl %ecx,20(%ebp)
            jne _boucle_c
            incl -4(%ebp)
            movl 20(%ebp),%ecx
            cmpl %ecx,-4(%ebp)
            jne _boucle_r


    End:
           add $4,%esp /* Désalocation de mémoire */
           mov %ebp,%esp
           leave          /* Restore ebp and esp */
           ret            /* Return to the caller */
