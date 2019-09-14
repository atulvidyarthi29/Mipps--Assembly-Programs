.data	
true: .asciiz "armsstrong"
false: .asciiz "NOT armsstrong"
enter: .asciiz "Enter the number: "
.text	
la $a0,enter
li $v0,4
syscall
li $v0, 5
syscall 
move $t0,$v0
move $t1,$t0
add $t2,$zero,$zero
label1:
blez $t1, label2     
div $t1,$t1,10
addi $t2,$t2,1
j label1    
label2:
move $t1,$t2 
move $s7,$zero
move $t7,$t0
label3:
blez $t7, label4     
rem $a0,$t7,10
div $t7,$t7,10
move $a1,$t1
jal label5     
label6:
add $s7,$s7,$v0
j label3
label4:
beq $t0,$s7,label7     
li $v0,4
la $a0,false      
syscall
li $v0,10
syscall
label7:
li $v0,4
la $a0,true      
syscall
li $v0,10
syscall	
label5:                     
move $v0,$zero
add $v0,$v0,1
label8:	blez $a1, label9
mul $v0,$v0,$a0
sub $a1,$a1,1
j label8	
label9: j label6
