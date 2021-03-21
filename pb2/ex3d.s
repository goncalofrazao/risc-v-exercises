.data
x: .word 5
y: .word 0


.text
la x11, y
lw x13, x
li x14, 7
lw x15, x
add x10, x10, x14
li x14, 5
mul x12, x13, x14
add x10, x10, x12
li x14, 2
mul x13, x13, x15
mul x12, x13, x14
sub x10, x10, x12
li x14, 3
mul x13, x13, x15
mul x12, x13, x14
add x10, x10, x12
sw x10, 0(x11)


li x17,1
ecall

li x17,10
ecall