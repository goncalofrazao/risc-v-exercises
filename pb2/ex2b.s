.data

vals: .word 3, 7, 4, 6

.text

la x10, vals
addi x13, x10, 16

loop:
lw x12, 0(x10)
add x11, x11, x12
addi x10, x10, 4
bne x10, x13, loop
srai x11, x11, 2

li x17,1
ecall
	
li x17,10
ecall