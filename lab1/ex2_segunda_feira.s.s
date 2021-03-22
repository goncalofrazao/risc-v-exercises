.data
x: .word 2

.text
la x15, x
lw x10, x
li x11, 10
li x12, 2
while:
addi x15, x15, 4
slli x10, x10, 1
sw x10, 0(x15) 

addi x12, x12, 1
blt x12, x11, while

li x17,1
ecall

li x17,10
ecall