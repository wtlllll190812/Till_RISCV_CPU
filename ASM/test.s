addi t1 s1 0
lb s1, 4(t1) # 
lh s1, 0(t1) # 
lw s1, 0(t1) # 
lbu s1, 0(t1) # 
lhu s1, 0(t1) # 
add t0, s1, s2 # t0 = t1 + t2
sub t1, s1, t0
sll t1, t1, s1
addi t0, t1, 10 # t0 = t1 + 10
slli t1, t0,2