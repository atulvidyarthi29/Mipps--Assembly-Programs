.data
    msg1: .asciiz "Enter size : "
    msg2: .asciiz "Enter  number : \n"
    msg3: .asciiz "\nThe Sum  is :\n"

.text
	li $v0,4
	la $a0,msg1
	syscall 
	
	li $v0,5
	syscall
	
	move $s0,$v0
	mul $s0,$s0,4	
	li $v0, 4
	la $a0,msg2
	syscall  
	
	move $a0,$s0
	li $v0,9
	syscall
	
	move $s1,$v0
	add $t7,$zero,$s1
	move $t6,$zero
	
flag1:   

	bge $t6,$s0,flag2
	li $v0, 5
	syscall
	
	sw $v0, ($t7) 
	addi $t7,$t7,4 
	addi $t6,$t6,4
	j flag1
	
flag2:

	move $t7,$s1
	move $t6,$zero
	flag3:         
	bge $t6,$s0,flag4       
	lw $a0,($t7)
	add $t1,$t1,$a0
	addi $t7,$t7,4
	addi $t6,$t6,4
	j flag3
	
flag4:	

	la $a0,msg3
	li $v0,4
	syscall 
                   
	move $a0,$t1              
	li $v0,1
	syscall	
