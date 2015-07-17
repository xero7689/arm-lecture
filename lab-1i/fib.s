/*
Fibonacci Sequence Arm Assembly Implementation
(Non-Recursive version)
Unfinish yet.
*/

.global _start
_start:
    mov r1, #0  /* f(0) */
    mov r2, #1  /* f(1) */
    mov r3, #2  /* index of i */
    mov r4, #12 /* index of fibo */
    
    /*
    if (index == 0)
        return 0;
    if (index == 1)
        return 1;
    */
    cmp r1, r4
    moveq r0, r1
    beq exit

    cmp r2, r4
    moveq r0, r2
    beq exit

    add r4, r4, #1

loop_cond:
    cmp r3, r4
    blt loop
    mov r0, r5  @ Save result to r0
    b exit

loop:
    add r5, r1, r2
    mov r1, r2
    mov r2, r5
    add r3, #1
    b loop_cond

exit:
    mov r7, #1
    swi 0
