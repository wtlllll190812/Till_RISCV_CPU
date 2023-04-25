addi s2, x0, 100
addi s1, x0, 100
sw s1 4(zero)
sw s2 8(zero)
lw s3, 4(zero)
lw s4, 8(zero)
label1:
    sub s3, s3, s4
add t0, s3, s4
jalr t0, x0,label1