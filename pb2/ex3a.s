.data

a: .word 0xD

.text

lw x10, a
li x14, 15

loop:
andi x11, x10, 1
add x12, x12, x11
srli x10, x10, 1
addi x13, x13, 1
bne x13, x14, loop


li x17,1
ecall
	
li x17,10
ecall