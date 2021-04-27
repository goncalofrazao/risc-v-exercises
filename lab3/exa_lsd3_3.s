# Programa L3.as

# ZONA I: Definicao de variaveis
.data
	x: .word 3
	y: .word 9

# ZONA II: Codigo
.text

# Programa principal: programa que recebe dois numeros inteiros positivos, x e y, e retorna o valor de x^y
	lw a0, x
	lw a1, y
	addi sp, sp, -8
	sw a0, 4(sp)
	sw a1, 0(sp)
	jal Pow


	li a7, 1
	ecall

	li a7, 10
	ecall

# Pow: Rotina que efectua o calculo de x^y, sendo x e y dois numeros inteiros positivos
# 	Entradas: 	a0 - x
#			  				a1 - y
#	Saidas:   	a0 - resultado
# 	Efeitos:  	---

Pow:
	addi sp, sp, -20
	sw ra, 16(sp)
	sw s1, 12(sp)
	sw a1, 8(sp)
	sw a2, 4(sp)
	sw a3, 0(sp)
	
	lw a0, 20(sp) # a0 = y
	beq a0, zero, return1 # y = 0 => return1

	srli a1, a0, 1 # a1 = h

	li a2, 1
	ble a0, a2, else # y < 1 ou y = 1 => else

	andi a2, a0, 1
	bne a2, zero, else # y % 2 = 1 => else

	lw a3, 24(sp) # a3 = x

	addi sp, sp, -8
	sw a3, 4(sp) # 4(sp) = x
	sw a1, 0(sp) # 0(sp) = h
	jal	Pow

	addi sp, sp, -8
	sw a0, 0(sp)
	sw a0, 4(sp)
	jal Mult # Mult(pow(x,h), pow(x,h))
	lw a0, 0(sp)
	addi sp, sp, 4
	j end

else:

	lw a0, 24(sp) # a0 = x
	
	addi sp, sp, -8
	sw a0, 4(sp) # 4(sp) = x
	sw a1, 0(sp) # 0(sp) = h
	jal Pow
	
	addi sp, sp, -8
	sw a0, 0(sp)
	sw a0, 4(sp)
	jal Mult
	lw a0, 28(sp) # a0 = x
	addi sp, sp, -4
	sw a0, 0(sp)
	jal Mult
	lw a0, 0(sp)
	addi sp, sp, 4
	j end

return1:
	li a0, 1

end:
	lw ra, 16(sp)
	lw s1, 12(sp)
	lw a1, 8(sp)
	lw a2, 4(sp)
	lw a3, 0(sp)
	addi sp, sp, 28
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
