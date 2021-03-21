.data
vals: .word 3, 7, 4, 6
vacc: .word 0

.text
la x10, vals

lw x11, 0(x10)
addi x10, x10, 4

lw x12, 0(x10)
addi x10, x10, 4

lw x13, 0(x10)
addi x10, x10, 4

lw x14, 0(x10)
addi x10, x10, 4

sw x11, 0(x10) 
addi x10, x10, 4

add x11, x11, x12
sw x11, 0(x10) 
addi x10, x10, 4

add x11, x11, x13
sw x11, 0(x10) 
addi x10, x10, 4

add x11, x11, x14
sw x11, 0(x10) 
addi x10, x10, 4

li x17,1
ecall

li x17,10
ecall