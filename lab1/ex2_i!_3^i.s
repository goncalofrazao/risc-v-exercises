#----------enunciado----------
# Predente-se criar uma tabela
# no memória do processador 
# com os valores de 
# i! + 3^i quando i varia de 0 
# até 10

.data
x:	.word 2

.text
la 	x17, x
li 	x11, 1
li 	x15, 10
li 	x12, 1
li 	x16, 3
li 	x13, 0

while:

addi 	x13, x13, 1
mul 	x12, x12, x13
mul 	x11, x11, x16
add 	x10, x11,x12

sw 	x10, 4(x17)
addi 	x17, x17, 4
blt 	x13, x15, while

li 	x17 10
ecall
