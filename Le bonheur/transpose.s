.globl matrix_transpose_asm

matrix_transpose_asm:
            push %ebp      /* Save old base pointer */
            mov %esp, %ebp /* Set ebp to current esp */

            sub $4,%esp /* Allocation de r */
            movl $0,-4(%ebp) /* Initialisation de r */

        _boucle_r:
            movl $0,%ecx /* Initialisation de c */
       
        _boucle_c:
            movl 16(%ebp),%eax  /* %eax <- matorder */
            mull -4(%ebp) /* %edx#%eax <- r*matorder */
            addl %ecx,%eax /* %eax <- c + r*matorder */
       
            movl 8(%ebp),%ebx /* %ebx <- inmatdata*/
            movl (%ebx,%eax,4),%esi /* %esi <- inmatdata[c + r*matorder]*/
            
            movl 16(%ebp),%eax  /* %eax <- matorder */
            mull %ecx /* %edx#%eax <- c*matorder */
            addl -4(%ebp),%eax /* %eax <- r + c*matorder */
            
            movl 12(%ebp),%ebx /* %ebx <- outmatdata*/
            movl %esi,(%ebx,%eax,4) /* outmatdata[c + r * matorder] <- inmatdata[c + r * matorder*/
            
            incl %ecx /* c++ */
            cmpl %ecx,16(%ebp) /* comparaison entre c et matorder */
            jne _boucle_c /* Jump si on a toujours pas atteint la fin de la ligne */
            
            incl -4(%ebp) /* r++ */
            movl 16(%ebp),%ecx /* %ecx <- matorder */
            cmpl %ecx,-4(%ebp) /* comparaison entre r et matorder */
            jne _boucle_r /* Jump si on a toujours pas atteint la fin du tableau */

        End:
          add $4,%esp /* Désalocation de mémoire */
          mov %ebp,%esp
          leave          /* Restore ebp and esp */
          ret            /* Return to the caller */
