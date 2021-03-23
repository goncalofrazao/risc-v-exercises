.data
x: .word 1
y: .word 1

.text
la x10, y
li x11, 18
li x12, 2
lw x14, x
lw x15, y
li x16, 1
li x17, 1
while:

add x13, x0, x14
add x14, x0, x15

add x15, x14, x13



addi x12, x12, 1
andi x16, x12, 1
bne x16, x17, while

sw x15, 0(x10)
addi x10, x10, 4

blt x12, x11, while

li x17,1
ecall

li x17,10
ecall