#----------enunciado----------
# Exercício Surpresa (2):
# Pretende-se criar uma tabela
# na memória do processador 
# com os valores de 3^(i+1) +
# 5*i quando i varia de 0 até
# 10. 3^(i+1) representa 3 
# elevado a i+1.

.data
x: .word 1

.text
la x15, x
li x11, 5
li x12, 3
li x13, 1
li x14, 11
li x16, 3
li x17, 5

for:
mul x11, x13, x17
mul x12, x12, x16
add x10, x11, x12
sw x10, 0(x15)
addi x15, x15, 4
addi x13, x13, 1

blt x13, x14, for




li x17,1
ecall

li x17,10
ecall
