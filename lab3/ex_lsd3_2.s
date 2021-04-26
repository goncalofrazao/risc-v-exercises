# Programa L3.as

# if (n <= 1)
#		u(n) 1;
# else
# 		if ( n % 2 = 0)
#			u(n) = 2u(n/2)
#		else 
#			u(n) = 3u((n-1)/2)


# ZONA I: Definicao de variaveis
.data
	u: .word 90

# ZONA II: Codigo
.text

# Programa principal: programa que recebe dois numeros inteiros positivos, x e y, e retorna o valor de x^y
	lw a0, u
	addi sp, sp, -4
	sw a0, 0(sp)
	jal un

	lw a0, 0(sp)
	addi sp, sp, 4

	li a7, 1
	ecall

	li a7, 10
	ecall

# 	Entradas: 	0(sp) - u
#	Saidas:   	0(sp) - resultado
# 	Efeitos:  	---

un:
	addi sp, sp, -12
	sw ra, 8(sp)
	sw a0, 4(sp)
	sw a1, 0(sp)

	
	lw a0, 12(sp) # a0 = n
	li a1, 1
	ble a0, a1, return1 # n < 1 or n = 1 => return1

	andi a1, a0, 1
	bne a1, zero, else # y % 2 = 1 => else

	srai a1, a0, 1 # a1 = n/2

	addi sp, sp, -4
	sw a1, 0(sp) # 0(sp) = n/2
	jal	un

	lw a0, 0(sp)
	addi sp, sp, 4
	slli a0, a0, 1
	j end

else:

	addi a0, a0, -1	

	srai a0, a0, 1

	addi sp, sp, -4
	
	sw a0, 0(sp) # 0(sp) = (n-1)/2
	jal un
	
	lw a0, 0(sp)
	addi sp, sp, 4
	slli a1, a0, 1
	add a0, a0, a1

	j end

return1:
	li a0, 1

end:
	sw a0, 12(sp)

	lw ra, 8(sp)
	lw a0, 4(sp)
	lw a1, 0(sp)

	addi sp, sp, 12
	ret

