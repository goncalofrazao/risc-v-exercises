# Programa L3.as

# Rotinas:
# Pow(x,y) :: return x^y :: input and output by registers
# Mult(x,y) :: return x*y :: input and output by stack

# ZONA I: Definicao de variaveis
.data
	x: .word 7
	y: .word 3

# ZONA II: Codigo
.text

# Programa principal: programa que recebe dois numeros inteiros positivos, x e y, e retorna o valor de x^y
	lw a0, x
	lw a1, y # 0xC
	jal Pow # 0x10 ra <- PC + 4 = 0x10 + 4 = 0x14

	li a7, 1 # 0x14
	ecall

	li a7, 10
	ecall

# Pow: Rotina que efectua o calculo de x^y, sendo x e y dois numeros inteiros positivos
# 	Entradas: 	a0 - x
#			  	a1 - y
#	Saidas:   	a0 - resultado
# 	Efeitos:  	---

Pow:
	addi sp, sp, -12
	sw ra, 8(sp)
	sw s1, 4(sp)
	sw a1, 0(sp)

	li s1, 1

PowLoop:
	addi a1, a1, -1
	blt a1, zero, EndLoop

	addi sp, sp, -8
	sw s1, 4(sp)
	sw a0, 0(sp)
	jal Mult
	lw s1, 0(sp)
	addi sp, sp, 4
	j PowLoop

EndLoop:
	mv a0, s1

	lw a1, 0(sp)
	lw s1, 4(sp)
	lw ra, 8(sp)
	addi sp, sp, 12
	ret

# Mult: Rotina que efectua o calculo de a*b, sendo a e b numeros inteiros positivos
# 	Entradas:	0(sp), 4(sp) - numeros a multiplicar
#	Saidas:		0(sp) - resultado
#	Efeitos:	---

Mult:
	addi sp, sp, -12
	sw s1, 8(sp)
	sw s2, 4(sp)
	sw s3, 0(sp)

	lw s2, 16(sp)
	lw s1, 12(sp)

	li s3, 0
	beq s2, zero, OutMul
	beq s1, zero, OutMul

MulLoop:
	add s3, s3, s1
	addi, s2, s2, -1
	bne s2, zero, MulLoop

OutMul:
	sw s3, 16(sp)

	lw s3, 0(sp)
	lw s2, 4(sp)
	lw s1, 8(sp)
	addi sp, sp, 16
	ret
