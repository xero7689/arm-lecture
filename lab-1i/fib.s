@Fibonacci Sequence Arm Assembly Implementation
@(Non-Recursive version)

    .syntax unified
    .arch armv7-a
    .text
    .align 2
    .thumb
    .thumb_func

    .global fibonacci
    .type fibonacci, function

fibonacci:
    push {r3, r4, r5, lr}    

    mov r1, #0  @f(0)
    mov r2, #1  @f(1)
    mov r3, #2  @loop index
    sub r4, r0, #0
    
    @if (index == 0)
    @    return 0;
    cmp r1, r4
    it eq
    moveq r0, r1
    beq exit

    @if (index == 1)
    @    return 1;
    cmp r2, r4
    it eq
    moveq r0, r2
    beq exit

    add r4, r4, #1

@ Loop condition testing
.loop_cond:
    @ if(index < parameter)
    cmp r3, r4
    blt .loop

    @ Save result to r0
    mov r0, r5      
    b exit

.loop:
    add r5, r1, r2
    mov r1, r2
    mov r2, r5
    add r3, #1
    b .loop_cond

exit:
    pop {r3, r4, r5, pc}
    
    .size fibonacci, .-fibonacci
    .end
