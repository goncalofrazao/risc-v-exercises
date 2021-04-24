# Programa L3.as

# ZONA I: Definicao de variaveis
.data
	x: .word 2
	y: .word 11

# ZONA II: Codigo
.text

# Programa principal: programa que recebe dois numeros inteiros positivos, x e y, e retorna o valor de x^y
	lw a0, x
	lw a1, y
	addi sp, sp, -8
	sw a0, 4(sp)
	sw a1, 0(sp)
	jal Pow

	lw a0, 0(sp)
	addi sp, sp, 4
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
	addi sp, sp, -8
	sw ra, 4(sp)
	sw s1, 0(sp)
	
	lw t0, 8(sp) # t0 = y
	beq t0, zero, return1 # y = 0 => return1

	srli t1, t0, 1 # t1 = h

	li t2, 1
	ble t0, t2, else # y < 1 => else

	andi t2, t0, 1
	bne t2, zero, else # y % 2 = 1 => else

	lw t3, 12(sp) # t3 = x

	addi sp, sp, -8
	sw t3, 4(sp) # 4(sp) = x
	sw t1, 0(sp) # 0(sp) = h
	jal	Pow

	lw t0, 0(sp) # t0 = pow(x,h)
	addi sp, sp, -4
	sw t0, 0(sp)
	jal Mult
	lw s1, 0(sp)
	addi sp, sp, 4
	j end

else:

	lw t0, 12(sp) # t0 = x
	
	addi sp, sp, -8
	sw t0, 4(sp) # 4(sp) = x
	sw t1, 0(sp) # 0(sp) = h
	jal Pow
	
	lw t0, 0(sp) # t0 = pow(x,h)
	addi sp, sp, -4
	sw t0, 0(sp)
	jal Mult
	lw t0, 16(sp) # t0 = x
	addi sp, sp, -4
	sw t0, 0(sp)
	jal Mult
	lw s1, 0(sp)
	addi sp, sp, 4
	j end

return1:
	li s1, 1

end:
	sw s1, 12(sp)

	lw s1, 0(sp)
	lw ra, 4(sp)
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
