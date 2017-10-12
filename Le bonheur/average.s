.globl matrix_diagonal_asm

matrix_diagonal_asm:
            push %ebp      /* Save old base pointer */
            mov %esp, %ebp /* Set ebp to current esp */
            
            sub $8,%esp /* Allocation */
            movl $0,-4(%ebp) /* Initialisation de r */
            
  _boulcle_r:
            movl $0,%ecx /* Initialisation de c */
            movl $0,-8(%ebp)
            
  _boucle_c:
            movl 16(%ebp),%eax
            mull -4(%ebp)
            addl %ecx,%eax
            movl 8(%ebp),%ebx
            movl (%ebx,%eax,4),%edx
            addl %edx,-8(%ebp)
            incl %ecx
            cmpl %ecx,16(%ebp)
            jne _boulcle_c
            movl $0,%edx
            movl -8(%ebp),%eax
            divl 16(%ebp)
            movl %eax,%edx
            movl -4(%ebp),%eax
            movl 12(%ebp),%ebx
            movl %edx,(%ebx,%eax,4)
            incl -4(%ebp)
            movl 16(%ebp),%ecx
            cmpl %ecx,-4(%ebp)
            jne _boulcle_r


  End:
            add $4,%esp /* Désalocation de la mémoire */
            mov %ebp,%esp
            leave          /* Restore ebp and esp */
            ret            /* Return to the caller */
