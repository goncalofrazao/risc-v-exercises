#----------enunciado----------
# Predente-se criar uma tabela
# no memória do processador 
# com os valores de 
# i! - i quando i varia de 0 
# até 10


.data
x: .word 1


.text
la x15, x
lw x10, x
li x13, 10
li x12, 1

for:
addi x15, x15, 4
addi x11, x11, 1
mul x12, x12, x11
sub x10, x12, x11
sw x10, 0(x15)

blt x11, x13, for



li x17,1
ecall

li x17,10
ecall
