#----------enunciado----------
#Determinar a maior potencia
#de 2 menor que u(10)
#u(10) e o 10º elemento
#da sequencia de fibonacci

.data
x: .word 2


.text
la x15, x
lw x10, x
li x12, 55

for:
blt x10, x12, this
bgt x10,x12, otherwise

otherwise:
srli x10,x10,1
j end

this:
slli x10, x10, 1
j for

end:
addi x15, x15, 4
sw x10, 0(x15) 

li x17,1
ecall

li x17,10
ecall