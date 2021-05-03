# Programa L3.as

# ZONA I: Definicao de variaveis
.data
	x: .word 5
	

# ZONA II: Codigo
.text

# Programa principal: programa que recebe dois numeros inteiros positivos, x e y, e retorna o valor de x^y
	 
   lw a0, x
   
	addi sp, sp, -4
	sw a0, 0(sp)
	jal Sucessao

	lw a0, 0(sp)
	addi sp, sp, 4

	li a7, 1
	ecall

	li a7, 10
	ecall

# Pow: Rotina que efectua o calculo de x^y, sendo x e y dois numeros inteiros positivos
# 	Entradas: 	a0 - x
#			  	a1 - y
#	Saidas:   	a0 - resultado
# 	Efeitos:  	---

Sucessao:
	addi sp, sp, -12
	sw ra, 8(sp)
	sw a0, 4(sp)
	sw a1, 0(sp)
	
	lw a0, 12(sp) # a0 = n
   li a1, 1 
	ble a0, a1, resultado1 # se n <=1

	andi a1, a0, 1
	bne a1, zero, else # n impar
  
    srai a1, a0, 1 #a1 = n/2

	addi sp, sp, -4
	sw a1, 0(sp) # 0(sp) = n
	jal Sucessao
   lw a0, 0(sp) 
   
  
   addi a1, a1, -1 
	sw a1, 0(sp) # 0(sp) = n
   jal Sucessao
   lw a1, 0(sp) 
	addi sp, sp, 4

   mul a0, a0, a1 
	j end

else:
  
  addi a0, a0, -1 
  srai a0, a0, 1
 
  addi sp, sp, -4 
  sw a0, 0(sp) # (n-1)/2
  
  jal Sucessao

  lw a0, 0(sp)
  addi sp, sp, 4 
  addi a0, a0, 1
  j end

resultado1:
	li a0, 1 

end:
	sw a0, 12(sp)

	lw ra, 8(sp)
	lw a0, 4(sp)
	lw a1, 0(sp)
	
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
