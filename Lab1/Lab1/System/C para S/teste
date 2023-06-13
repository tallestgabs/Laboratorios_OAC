.eqv N 30  # quantos numeros vao ser printados por linha

.data
v:
        .word   9
        .word   2
        .word   5
        .word   1
        .word   8
        .word   2
        .word   4
        .word   3
        .word   6
        .word   7
        .word   10
        .word   2
        .word   32
        .word   54
        .word   2
        .word   12
        .word   6
        .word   3
        .word   1
        .word   78
        .word   54
        .word   23
        .word   1
        .word   54
        .word   2
        .word   65
        .word   3
        .word   6
        .word   55
        .word   31
.LC0:
        .string "%d\t"  # ?
        
.text

main:	addi    sp,sp,-16 	# libera 4 espaços na memoria
        sw      ra,12(sp)	# grava ra em sp + 12
        sw      s0,8(sp)	# grava s0 em sp + 8
        addi    s0,sp,16	# s0 = sp + 16
        li      a1,30		# a1 = 31
        lui     a5,%hi(v)	# adiciona os high bits em a5
        addi    a0,a5,%lo(v)	# adiciona em a0 os bits superiores e inferiores
        call    show		# chama show
        li      a1,30		# a1 = 30
        lui     a5,%hi(v)	# adiciona os high bits em a5	
        addi    a0,a5,%lo(v)	# adiciona em a0 os bits superiores e inferiores
        call    sort		# chama sort
        li      a1,30		# a1 = 30
        lui     a5,%hi(v)	# adiciona os high bits em a5		
        addi    a0,a5,%lo(v)	# adiciona em a0 os bits superiores e inferiores
        call    show		# chama show
        li      a5,0		# a5 = 0
        mv      a0,a5		# a0 = a5
        lw      ra,12(sp)	# carrega sp + 12 e salva em ra
        lw      s0,8(sp)	# carrega sp + 8 e salva em s0
        addi    sp,sp,16	# sp = sp + 16
        #jr      ra		# jump to address on ra
        
        li a7, 10 # finaliza o programa
        ecall

show:	addi    sp,sp,-48	# sp = sp - 48
        sw      ra,44(sp)	# grava ra em sp + 44
        sw      s0,40(sp)	# grava s0 em sp + 40
        addi    s0,sp,48	# s0 = sp + 48
        sw      a0,-36(s0)	# grava a0 em s0 - 36
        sw      a1,-40(s0)	# grava a1 em s0 - 40
        sw      zero,-20(s0)	# grava zero em s0 - 20
        j       .L3		# jump to .L2
        
.L3:	lw      a5,-20(s0)	# carrega s0 - 20 e salva em a5
        slli    a5,a5,2		# a5 = a5 * 4
        lw      a4,-36(s0)	# carrega s0 - 36 e salva em a4
        add     a5,a4,a5	# a5 = a4 + a5
        lw      a5,0(a5)	# carrega a5 + 0 e salva em a5
        mv      a1,a5		# a1 = a5
        lui     a5,%hi(.LC0)	# adiciona os high bits em a5	
        addi    a0,a5,%lo(.LC0)	# adiciona em a0 os bits superiores e inferiores	
        call    SHOW		# chama SHOW para printar
        lw      a5,-20(s0)	# carrega s0 - 20 e salva em a5
        addi    a5,a5,1		# a5 = a5 + 1
        sw      a5,-20(s0)	# grava a5 em s0 - 20
        
.L2:	lw      a4,-20(s0)	# carrega s0 - 20 e salva em a4
        lw      a5,-40(s0)	# carrega s0 - 40 e salva em a5
        #blt     a4,a5,.L3	# if a4 < a5  go to .L3
        li      a0,10		# a0 = 10
        #call    SHOW		# chama SHOW para printar
        nop			# nada 
        lw      ra,44(sp)	# carrega sp + 44 e salva em ra
        lw      s0,40(sp)	# carrega sp + 40 e salva em s0
        addi    sp,sp,48	# sp sp + 48
        jr      ra		# jump to address on ra
        
swap:	addi    sp,sp,-48	# sp = sp - 48
        sw      s0,44(sp)	# grava s0 em sp + 44
        addi    s0,sp,48	# s0 = sp + 48
        sw      a0,-36(s0)	# grava a0 em s0 - 36
        sw      a1,-40(s0)	# grava a1 em s0 - 40
        lw      a5,-40(s0)	# carrega s0 - 40 e salva em a5
        slli    a5,a5,2		# a5 = a5 * 4
        lw      a4,-36(s0)	# carrega s0 - 36 e salva em a4
        add     a5,a4,a5	# a5 = a4 + a5
        lw      a5,0(a5)	# carrega a5 + 0 e salva em a5
        sw      a5,-20(s0)	# grava a5 em s0 - 20
        lw      a5,-40(s0)	# carrega s0 - 40 e salva em a5
        addi    a5,a5,1		# a5 = a5 + 1
        slli    a5,a5,2		# a5 = a5 * 4
        lw      a4,-36(s0)	# carrega s0 - 36 e salva em a4
        add     a4,a4,a5	# a4 = a4 + a5
        lw      a5,-40(s0)	# carrega s0 = 40 e salva em a5
        slli    a5,a5,2		# a5 = a5 * 4
        lw      a3,-36(s0)	# carrega s0 - 36 e salva em a3
        add     a5,a3,a5	# a5 = a3 + a5
        lw      a4,0(a4)	# carrega a4 + 0 e salva em a4
        sw      a4,0(a5)	# grava a4 em a5 + 0
        lw      a5,-40(s0)	# carrega s0 - 40 e salva em a5
        addi    a5,a5,1		# a5 = a5 + 1
        slli    a5,a5,2		# a5 = a5 * 4
        lw      a4,-36(s0)	# carrega s0 - 36 e salva em a4
        add     a5,a4,a5	# a5 = a4 + a5
        lw      a4,-20(s0)	# carrega s0 - 20 e salva em a4
        sw      a4,0(a5)	# grava a4 em a5 + 0
        nop			# nada
        lw      s0,44(sp)	# carrega sp + 44 e salva em s0
        addi    sp,sp,48	# sp = sp + 48
        jr      ra		# jump to address on ra
        
sort:	addi    sp,sp,-48	# sp = sp - 48
        sw      ra,44(sp)	# grava ra em sp + 44
        sw      s0,40(sp)	# grava s0 em sp + 40
        addi    s0,sp,48	# s0 = sp + 48
        sw      a0,-36(s0)	# grava a0 em s0 - 36
        sw      a1,-40(s0)	# grava a1 em s0 - 40
        sw      zero,-20(s0)	# grava zero em s0 - 20
        j       .L6		# jump to .L6
        
.L10:	lw      a5,-20(s0)	# carrega s0 - 20 e salva em a5
        addi    a5,a5,-1	# a5 = a5 - 1
        sw      a5,-24(s0)	# grava a5 em s0 - 24
        j       .L7		# jump to .L7
        
.L9:	lw      a1,-24(s0)	# carrega s0 - 24 e salva em a1
        lw      a0,-36(s0)	# carrega s0 - 36 e salva em a0
        call    swap		# chama swap
        lw      a5,-24(s0)	# carrega s0 - 24 e salva em a5
        addi    a5,a5,-1	# a5 = a5 - 1
        sw      a5,-24(s0)	# grava a5 em s0 - 24
        
.L7:	lw      a5,-24(s0)	# carrega s0 - 24 e saçva e, a5
        blt     a5,zero,.L8	# if a5 < zero  go to .L8
        lw      a5,-24(s0)	# carrega s0 - 24 e salva em a5
        slli    a5,a5,2		# a5 = a5 * 4
        lw      a4,-36(s0)	# carrega s0 - 36 e salva em a4
        add     a5,a4,a5	# a5 = a4 + a5
        lw      a4,0(a5)	# carrega s5 + 0 e salva em a4
        lw      a5,-24(s0)	# carrega s0 - 24 e salva em a5
        addi    a5,a5,1		# a5 = a5 + 1
        slli    a5,a5,2		# a5 = a5 * 4
        lw      a3,-36(s0)	# carrega s0 - 36 e salva em a3
        add     a5,a3,a5	# a5 = a3 + a5
        lw      a5,0(a5)	# carrega a5 + 0 e salva em a5
        bgt     a4,a5,.L9	# if a4 > a5  go to .L9
        
.L8:	lw      a5,-20(s0)	# carrega s0 - 20 e salva em a5
        addi    a5,a5,1		# a5 = a5 + 1
        sw      a5,-20(s0)	# grava a5 em s0 - 20
        
.L6:	lw      a4,-20(s0)	# carrega s0 - 20 e salva em a4
        lw      a5,-40(s0)	# carrega s0 - 40 e salva em a5
        blt     a4,a5,.L10	# if a4 < a5  go to .L10
        nop			# nada
        nop			# nada
        lw      ra,44(sp)	# carrega sp + 44 e salva em ra
        lw      s0,40(sp)	# carrega sp + 40 e salva em s0
        addi    sp,sp,48	# sp = sp + 48
        jr      ra		# jump to address on ra
        
        
SHOW:	lw t0, -36(s0)	# t0 = a0
	li t1,N  	# t1 = 30
	mv t2,zero  	# t2 = 0

loop1: 	beq t2,t1,fim1  # if  t2 == t1  go to fim1
	li a7,1  	# sycall de print int
	lw a0,0(t0)  	# carrega t0 + 0 e salva em a0
	ecall  		# chama a syscall para printar a0
	li a7,11  	# syscall de PrintChar
	li a0,9  	# a0 = 9 / a0 = character to print (only lowest byte is considered)
	ecall 		# chama a syscall
	addi t0,t0,4 	# t0 = t0 + 4
	addi t2,t2,1 	# t2 = t2 + 1
	j loop1  	# jump to loop1

fim1:	li a7,11  	# syscall de PrintChar  \n basicamente
	li a0,10  	# a0 = 10 / a0 = character to print (only lowest byte is considered)
	ecall		# chama a syscall
	ret  		# retorna a quem chamou  (SHOW)
