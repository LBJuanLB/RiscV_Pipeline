addi x10, x0, 20
addi x11, x0, 20
addi x12, x0, 30
label:
    bne x10, x11, label1
    add x11, x11, x12
    beq x0, x0, label
label1:
    add x14, x12,x11
