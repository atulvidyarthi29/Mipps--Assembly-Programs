.data
text1: .asciiz ", "
text2: .asciiz " Enter number "
.text 
la $a0,text2 
li $v0,4
syscall
li $v0, 5  
syscall  
move $t0,$v0      
add $t1,$zero,$zero
add $t2,$zero,1
li $v0,1     
move $a0,$t1
syscall
li $v0,4    
la $a0,text1
syscall 
li $v0,1   
move $a0,$t2
syscall  
li $v0,4    
la $a0,text1 
syscall 
label1:
beq $t0,2, label2
addi $t0,$t0,-1    
add $t3,$t1,$t2
li $v0,1
move $a0,$t3       
syscall
li $v0,4
la $a0,text1       
syscall 
move $t1,$t2
move $t2,$t3
j label1
label2:	
