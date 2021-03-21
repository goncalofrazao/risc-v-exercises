.data
x: .word 1
y: .word 1
z: .word 

.text
la x10, z
li x11, 8
lw x13, x
lw x14, y
while:
add x15, x14, x13
sw x15, 0(x10)
addi x10, x10, 4
add x13, x0, x14
add x14, x0, x15


addi x12, x12, 1
bne x12, x11, while

li x17,1
ecall

li x17,10
ecall