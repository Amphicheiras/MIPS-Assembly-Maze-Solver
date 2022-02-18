.data 
  
	msg2: .asciiz "Labyriddnth"
	msg1: .asciiz "Labyrinth"
	nwl: .asciiz "\n"
  
  
	map: .align 2
		.space 231
		.ascii "I.IIIIIIIIIIIIIIIIIIII....I....I.......I.IIII.IIIII.I.I.III.I.II.I.....I..I..I.....II.I.III.II...II.I.IIII...I...III.I...I...IIIIII.IIIII.III.III.II.............I.I...IIIIIIIIIIIIIIII.I.III@...............I..IIIIIIIIIIIIIIIIIIIIIII"
               
	temp: .space 100
	
.text

main:  
	
	
	la $s1,map					# Map array address
	la $s4,temp					# Current row address
	addi $s2,$s2,11				# Hightt
	addi $s3,$s3,21				# Widthh 
	li $t8,231
	li $a0,1				
	jal makeMove
	
	li  $v0, 10					# exit  program
    syscall
	
	
makeMove: 
	
	addi $sp, $sp, -8			# sp = -8

	sw $t0, 0($sp)				# sto prwto stoixeio ths stoivas vazoyme to S0 
	add $t0, $a0, $zero			# to orisma mas mpainei ston t0

	addi $t1,$t1,42				# t1 = *

	addi $t2,$t2,35				# t2 = #

	addi $t3,$t3,46				# t3 = .

	addi $t4,$t4,64				# t4 = @

	addi $t5,$t5,37				# t5 = %

	addi $t9, $t9,1				# t9 = 1
	
	li $v0, 1	 				# service 1 (print integer)
	move $a0,$t0   				# print t0 = curr pos
	syscall  
	
	li $v0, 4 			        # service 1 (print integer)
	la $a0,nwl					# newline
	syscall  
	
	blt $t0,$zero,end_move		# (t0<0)	 map boundaries

	bgt $t0,$t8,end_move		# (t0>t8, totalelemets)
	


	add $t6,$s1,$t0				# t6 = map[t0] = s1+t0  	??

	lb $t7,0($t6)				# t7 = &t6

	move $a0, $t6 		 		#				debug 3	
	li $v0, 4       			# service 1 (print integer in register)
	syscall  
 
	bne $t7,$t3,else_1			# Not road

	li $v0, 1      				# service 1 (print integer in register)
	la $a0,4  		 			#				debug 4	
	syscall  	
	
	sb $t1, 0($t6)				# Write " * " on map
	
	sw $ra, 4($sp)				# 
								# pos before labyrinth
	sw $t0, 0($sp)				# 
	
	jal printLabyrinth

	lw $ra, 4($sp)				# 
								# pos before labyrinth
	lw $t0, 0($sp)				# 

	addi $a0,$t0,1				# To go right

	sw $ra, 4($sp)				# pos before labyrinth	 

	jal makeMove

	lw $ra, 4($sp) 				# RA=C[1]
	
	lw $t0, 0($sp)				# T0=C[0]
	
	#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;			12
	bne $v0,$t9,label_12		# Not road

	sb $t2, 0($t6)				# Write " # " on map
	
	addi $v0,$v0,1 				# return 1

	jr $ra

	label_12:

	add $a0,$t0,$s3				# To go down
	
	sw $ra, 4($sp)				# pos before makeMove	 

	jal makeMove
	
	lw $ra, 4($sp) 				# RA=C[1];
	
	lw $t0, 0($sp)				# T0=C[0];

	#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;			13
	bne $v0,$t9,label_13		# Not road	
	
	sb $t2, 0($t6)				# Write " # " on map

	addi $v0,$v0,1 				# return 1
	
	jr $ra	
	
	label_13:
	
	sub $a0,$t0,$s3				# To go left	????

	sw $ra, 4($sp)				# pos before makeMove	

	jal makeMove	
	
	lw $ra, 4($sp) 				# RA=C[1];
	
	#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;			14
	bne $v0,$t9,label_14		# Not road
	
	sb $t2, 0($t6)				# map[t0]=T2
	
	addi $v0,$v0,1 				# Write " # " on map
	
	jr $ra
	
	label_14:
	
	sub $a0,$t0,$s3				# To go up	  ?????

	sw $ra, 4($sp)				# pos before makeMove

	jal makeMove

	lw $ra, 4($sp) 				# RA=C[1];
	
	#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	bne $v0,$t9,label_15		# Not road
	
	sb $t2, 0($t6)				# map[t0]=T2
	
	addi $v0,$v0,1 				# return 1
	
	jr $ra
	
	label_15:
	
	else_1:
	
	li $v0, 1        			# service 1 (print integer in register)
	la $a0,313  		 		#				debug 313	
	syscall  	
	
	bne $t7,$t4,end_move		# End if exit found
	
	li $v0, 1        			# service 1 (print integer in register)
	la $a0,5  		 			#				debug 5	
	syscall  

	sb $t5, 0($t6)				# map[t0]=T5
	
	jal printLabyrinth

	addi $v0,$v0,1 				# return 1
	
	jr $ra
	
	end_move:
	
	addi $v0,$v0,0 				# return 0
	
	jr $ra

#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
	
printLabyrinth:
	
	addi $t0,$t0,0				# Current Column
		
	addi $t1,$t1,0				# Current row

	addi $t2,$t2,0				# 'map' row

	addi $t3,$t3,11				# Map hight
	 
	addi $t4,$t4,21				# Map width
	
    
	li $v0, 4					#
	la $a0,msg1					# print "labyrinth"
	syscall						#
	
    for_label:					# Traverse row 
	
	bgt $t0,$t3,end_label		# (to>t3, map hight) 
	
	li $t1,0  					# T1=ZERO Reset column counter
			
	for_label_2:				# Traverse column 

	bgt $t1,$t4,end_label		# (t1>t4, map width) 

	add $t5,$s4,$t1				# t5=temp[T1] 

	add $t6,$s1,$t2				# t6=map[T2]	
	
	move $t5,$t6				# temp[T1]=map[T2]
	
	addi $t2,$t2,1 				# T2=T2+1;

	addi $t1,$t1,1 				# T1=T1+1
	
	li $v0,4
	lb $a0, 0($t5)        		# print temp[T1]
	syscall						#
	
	j for_label_2

	end_label_2:

	li $v0, 4					# 
	la $a0,nwl					# print newline
	syscall						#

	addi $t1,$t1,1 				# T1=T1+1;

	li $t1, 0 					# temp[T1]='\0' Reset temp

	addi $t0,$t0,1 				# T0=T0+1			


	j for_label;

    end_label:

	jr $ra
	
	
	
	
	
	