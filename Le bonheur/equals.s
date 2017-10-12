.globl matrix_equals_asm

matrix_equals_asm:
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
            
            movl 8(%ebp),%ebx /* %ebx <- inmatdata1*/
            movl (%ebx,%eax,4),%edx /* %edx <- inmatdata1[c + r*matorder]*/
            
            movl 12(%ebp),%esi /* %esi <- inmatdata2*/
            movl (%esi,%eax,4),%ebx /* %ebx <- inmatdata2[c + r*matorder]*/

            cmpl %ebx,%edx /* comparaison inmatdata1[c + r*matorder] et inmatdata2[c + r*matorder] */
            jne _difference /* Jump si au moins une différence est trouvée */
            
            incl %ecx /* c++ */
            cmpl %ecx,16(%ebp) /* comparaison entre c et matorder */
            jne _boucle_c /* Jump si on a toujours pas atteint la fin de la ligne */
            
            incl -4(%ebp) /* r++ */
            movl 16(%ebp),%ecx /* %ecx <- matorder */
            cmpl %ecx,-4(%ebp) /* comparaison entre r et matorder */
            jne _boucle_r /* Jump si on a toujours pas atteint la fin du tableau */
            jmp _scanned /* Aucune différence trouvée */

        _difference:
            movl $0,%eax /* return 0 */
            jmp End

        _scanned:
            mov $1, %eax /* return 1 */
            jmp End
          
        End:
            add $4,%esp /* Désalocation de mémoire */
            mov %ebp,%esp
            
            leave          /* Restore ebp and esp */
            ret            /* Return to the caller */
