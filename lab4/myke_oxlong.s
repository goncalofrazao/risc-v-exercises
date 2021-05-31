.data
a:        .word  1, 5, 2, 7, 3, 2, 1, 0
b:        .zero  32

.text
    li x10, 0x10000000 # endereco de a
    nop
    nop
    addi x11, x10, 32 # endereco de b
    nop
    nop
    mv x12, x11
    nop
    nop
loop:
    bge x10, x12, end

    lw x13, 0(x10)         # primeira iteracao
    lw x13, 4(x10)        # segunda iteracao
    addi x10, x10, 8
    mul x13, x13, x13   # usa o valor lido pelo primeiro lw
		mul x13, x13, x13
		addi x11, x11, 8
		sw x13, 0(x11)
		sw x13, 4(x11)
    j loop
end: