#----------Enunciado----------
# Sem alterar o código da 
# cálculo da sequência de
# Fibonacci, escreva código
# para determinar o menor 
# múltiplo de 2 maior que um 
# elemento da sequência a ser 
# declarado no início do 
# programa como uma variável. 
# Soluções que alterem o código 
# de cálculo da sequência de 
# Fibonacci não serão aceites.


.data
x: .word 1
y: .word 1
min: .word 34

.text

la x10,x
lw x11, min
addi x11, x11, 1
lw x13, w
lw x14, y
li x17, 0



while:
add x15, x14, x13
add x13, x0, x14
add x14, x0, x15

blt x15, x11, while
andix16, x15, 1

bne x16, x17, while
sw x15, 0(x10)
sw x17, 4(x10)
sw x17, 8(x10)

li x17, 10
ecall



