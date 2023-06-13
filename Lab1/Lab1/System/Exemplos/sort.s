.eqv N 30  # atribui o valor 32 ao simbolo N

.data
Vetor:  	.word   9
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

.text	
MAIN:	la a0,Vetor	# a0 contem Vetor
	li a1,N  	#  a1 contem 32
	jal SHOW  	# chama funçao SHOW e mostra o valor original

	la a0,Vetor 
	li a1,N
	jal SORT   	# chama funçao SORT e ordena os valores

	la a0,Vetor
	li a1,N
	jal SHOW  	# chama a funçao SHOW novamente para mostrar os valores ordenados

	li a7,10  	#finaliza o programa
	ecall


SWAP:	slli t1,a1,2  	# t1 = a1 * 4
	add t1,a0,t1  	# t1 = a0 + t1
	lw t0,0(t1) 	#  carrega t1 + 0 e salva em t0
	lw t2,4(t1) 	#  carrega t1 + 4 e salva em t2
	sw t2,0(t1) 	#  grava t2 em t1 + 0
	sw t0,4(t1) 	#  grava t0 em t1 + 4
	ret  		# Retorna para for2

SORT:	addi sp,sp,-20  # sp = sp - 20
	sw ra,16(sp) 	# grava ra em sp + 16
	sw s3,12(sp) 	# grava s3 em sp + 12
	sw s2,8(sp)  	# grava s2 em sp + 8
	sw s1,4(sp)  	# grava s1 em sp + 4
	sw s0,0(sp)  	# grava s0 em sp + 0
	mv s2,a0  	# s2 = a0
	mv s3,a1 	# s3 = a1
	mv s0,zero 	# s0 = zero
	
for1:	bge s0,s3,exit1 	# if s0 >= s3  go to exit1
	addi s1,s0,-1  		# s1 = s0 - 1
	
for2:	blt s1,zero,exit2 	# if s1 < zero  go to exit2
	slli t1,s1,2  		# t1 = s1 * 4
	add t2,s2,t1  		# t2 = s2 + t1
	lw t3,0(t2) 		# carrega t2 + 0 e salva em t3
	lw t4,4(t2) 		# carrega t2 + 4 e salva em t4
	bge t4,t3,exit2  	# if  t4 >= t3  go to exit2
	mv a0,s2  		# a0 = s2
	mv a1,s1 		# a1 = s1
	jal SWAP 		# Chama SWAP
	addi s1,s1,-1 		# s1 = s1 - 1
	j for2  		# jump to for2
	
exit2:	addi s0,s0,1 		# s0 = s0 + 1
	j for1  		# pula para for1
	
exit1: 	lw s0,0(sp) 		# carrega sp + 0 e salva em s0
	lw s1,4(sp) 		# carrega sp + 4 e salva em s1
	lw s2,8(sp) 		# carrega sp + 8 e salva em s2
	lw s3,12(sp)		# carrega sp + 12 e salva em s3
	lw ra,16(sp)		# carrega sp + 16 e salva em ra
	addi sp,sp,20 		# sp = sp + 20  
	ret 			# Retorna para quem chamou (SORT)
	
	
	

SHOW:	mv t0,a0	# t0 = a0
	mv t1,a1  	# t1 = a1
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

fim1:	li a7,11  	# syscall de PrintChar
	li a0,10  	# a0 = 10 / a0 = character to print (only lowest byte is considered)
	ecall		# chama a syscall
	ret  		# retorna a quem chamou  (SHOW)

	
	
	
