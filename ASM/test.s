addi s2, s1, 100
addi x0, x0, 100
sw s1 4(zero)
sw s2 8(zero)
lw s3, 4(zero)
lw s4, 8(zero)
add t0, s3, s4