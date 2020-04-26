#####################################################################
#
# CSC258H5S Winter 2020 Assembly Programming Project
# University of Toronto Mississauga
#
# Group members:
# - Student 1: Mohid Sharif, 1004236739
# - Student 2 (if any): Name, Student Number
#
# Bitmap Display Configuration:
# - Unit width in pixels: 8					     
# - Unit height in pixels: 8
# - Display width in pixels: 256
# - Display height in pixels: 256
# - Base Address for Display: 0x10008000 ($gp)
#
# Which milestone is reached in this submission?
# (See the assignment handout for descriptions of the milestones)
# - Milestone 1/2/3/4/5 (choose the one the applies)
#
# Which approved additional features have been implemented?
# (See the assignment handout for the list of additional features)
# 1. (fill in the feature, if any)
# 2. (fill in the feature, if any)
# 3. (fill in the feature, if any)
# ... (add more if necessary)
#
# Any additional information that the TA needs to know:
# - (write here, if any)
#
#####################################################################
.data
	displayAddress:	.word	0x10008000
	playerPosition: .word   1292
	pillar1Opening: .word    1152
	pillar1Position: .word   112
	
.text
	main:
	    lw $t0, displayAddress	# $t0 stores the base address for display
	    li $t1, 0xff0000	# $t1 stores the red colour code
	    li $t2, 0x00ff00	# $t2 stores the green colour code
	    li $t3, 0x0000ff	# $t3 stores the blue colour code
	    lw $t6, playerPosition
	    lw $t7, pillar1Position
	    li $s3, 0
	    
	    Play:
	    jal paint
	    jal checkGameOver
	    li $s2, 0
	    getInput:
	        li $v0, 0
	        jal Read
	        add $a0, $v0, $zero
	        beq $a0, 102, Move
	        addi $s2, $s2, 1
	        addi $s3, $s3, 1
	        bne $s2, 11000, getInput
	        #li $a0, 250
	        #li $v0, 32
	        #syscall 
	        addi $t6, $t6, 128
	        sub $t7, $t7, 4
	        
	        j Play
	        
	    Move: 
	        li $s3, 0
	        sub $t6, $t6, 128
	        jal paint 
	        jal checkGameOver
	        j getInput
	        
	    checkGameOver:
	        add $t4, $zero, $t7
	        li $t5, 4096
	        lw $s5, pillar1Opening
	        pLoop2:
		    beq $t6, $t4, Exit
	            addi $t6, $t6, 8
	            beq $t6, $t4, Exit
	            subi $t6, $t6, 8
	            addi $t6, $t6, 128
	            beq $t6, $t4, Exit
	            subi $t6, $t6, 128
	            addi $t6, $t6, 132
	            beq $t6, $t4, Exit
	            subi $t6, $t6, 132
	            addi $t6, $t6, 136
	            beq $t6, $t4, Exit
	            subi $t6, $t6, 136
	            addi $t6, $t6, 140
	            beq $t6, $t4, Exit
	            subi $t6, $t6, 140
	            addi $t6, $t6, 256
	            beq $t6, $t4, Exit
	            subi $t6, $t6, 256
	            addi $t6, $t6, 264
	            beq $t6, $t4, Exit
	            subi $t6, $t6, 264
		    
		    addi $t4, $t4, 4
		    
		    beq $t6, $t4, Exit
	            addi $t6, $t6, 8
	            beq $t6, $t4, Exit
	            subi $t6, $t6, 8
	            addi $t6, $t6, 128
	            beq $t6, $t4, Exit
	            subi $t6, $t6, 128
	            addi $t6, $t6, 132
	            beq $t6, $t4, Exit
	            subi $t6, $t6, 132
	            addi $t6, $t6, 136
	            beq $t6, $t4, Exit
	            subi $t6, $t6, 136
	            addi $t6, $t6, 140
	            beq $t6, $t4, Exit
	            subi $t6, $t6, 140
	            addi $t6, $t6, 256
	            beq $t6, $t4, Exit
	            subi $t6, $t6, 256
	            addi $t6, $t6, 264
	            beq $t6, $t4, Exit
	            subi $t6, $t6, 264
		    
		    addi $t4, $t4, 4
		    
		    beq $t6, $t4, Exit
	            addi $t6, $t6, 8
	            beq $t6, $t4, Exit
	            subi $t6, $t6, 8
	            addi $t6, $t6, 128
	            beq $t6, $t4, Exit
	            subi $t6, $t6, 128
	            addi $t6, $t6, 132
	            beq $t6, $t4, Exit
	            subi $t6, $t6, 132
	            addi $t6, $t6, 136
	            beq $t6, $t4, Exit
	            subi $t6, $t6, 136
	            addi $t6, $t6, 140
	            beq $t6, $t4, Exit
	            subi $t6, $t6, 140
	            addi $t6, $t6, 256
	            beq $t6, $t4, Exit
	            subi $t6, $t6, 256
	            addi $t6, $t6, 264
	            beq $t6, $t4, Exit
	            subi $t6, $t6, 264
	            
	            addi $t4, $t4, 4
		    
		    beq $t6, $t4, Exit
	            addi $t6, $t6, 8
	            beq $t6, $t4, Exit
	            subi $t6, $t6, 8
	            addi $t6, $t6, 128
	            beq $t6, $t4, Exit
	            subi $t6, $t6, 128
	            addi $t6, $t6, 132
	            beq $t6, $t4, Exit
	            subi $t6, $t6, 132
	            addi $t6, $t6, 136
	            beq $t6, $t4, Exit
	            subi $t6, $t6, 136
	            addi $t6, $t6, 140
	            beq $t6, $t4, Exit
	            subi $t6, $t6, 140
	            addi $t6, $t6, 256
	            beq $t6, $t4, Exit
	            subi $t6, $t6, 256
	            addi $t6, $t6, 264
	            beq $t6, $t4, Exit
	            subi $t6, $t6, 264
		    
		    subi $t4, $t4, 12
		    addi $t4, $t4, 128
		    
		    bgt $t4, $s5, Skip1
		    blt $t4, $t5, pLoop2
		    lw $t0, displayAddress
		    j safe
		 Skip1:
		    addi $s5, $s5, 5000
	            addi $t4, $t4, 640
	            j pLoop2
	        safe:
	            jr $ra
	        
	Exit:
	    jal GameOver
	    li $v0, 10 # terminate the program gracefully
	    syscall
	        		
	Read:
	    lui $a3, 0xffff
	    loop1:
	        lw $t4, 0($a3)
	        andi $t4, $t4, 0x0001
	        beq $t4, $zero, end
	        lw $v0, 4($a3)
	        end:
	        jr $ra
	    
	    
	paint:
	    #Paint Background
	    li $t4, 0
	    li $t5, 4096
	
	    Background:
	        sw $t3, 0($t0)
	        addi $t0, $t0, 4
	        addi $t4, $t4, 4
	        blt $t4, $t5, Background
	    
	    lw $t0, displayAddress	
	    
	    #Paint Player
	    add $t0, $t0, $t6
	    sw $t2, 0($t0)	
	    sw $t2, 8($t0)	  
	    sw $t2, 128($t0) 
	    sw $t2, 132($t0)	 
	    sw $t2, 136($t0)	 
	    sw $t2, 140($t0)	 
	    sw $t2, 256($t0)	 
	    sw $t2, 264($t0)	 
	    
	    lw $t0, displayAddress	
	
	    #Paint Pillar
	    Pillar1:
	    li $t4, 0
	    li $t5, 4096
	    lw $s5, pillar1Opening
	    add $t0, $t0, $t7
	    pLoop1:
		sw $t1, 0($t0)
		sw $t1, 4($t0)
		sw $t1, 8($t0)
		sw $t1, 12($t0)
		addi $t0, $t0, 128
		addi $t4, $t4, 128
		beq $t4, $s5, Skip
		blt $t4, $t5, pLoop1
		lw $t0, displayAddress
		beq $t7, 0, resetPillar
		j end1
	    resetPillar:
	        lw $t7, pillar1Position
	        j end1
	    end1:
	        jr $ra
		
	    Skip:
	    addi $t0, $t0, 768
	    j pLoop1	
	    
	    GameOver:
	       li $t4, 0
	       li $t5, 4096
	       Background1:
	        sw $t3, 0($t0)
	        addi $t0, $t0, 4
	        addi $t4, $t4, 4
	        blt $t4, $t5, Background1
	    
	        lw $t0, displayAddress
	       
	       addi $t0, $t0, 1536
	       sw $t1, 40($t0)
	       sw $t1, 72($t0)
	       sw $t1, 76($t0)
	       sw $t1, 80($t0)
	       sw $t1, 88($t0)
	       addi $t0, $t0, 128
	       sw $t1, 40($t0)
	       sw $t1, 72($t0)
	       sw $t1, 88($t0)
	       addi $t0, $t0, 128
	       sw $t1, 40($t0)
	       sw $t1, 44($t0)
	       sw $t1, 48($t0)
	       sw $t1, 56($t0)
	       sw $t1, 64($t0)
	       sw $t1, 72($t0)
	       sw $t1, 76($t0)
	       sw $t1, 80($t0)
	       sw $t1, 88($t0)
	       addi $t0, $t0, 128
	       sw $t1, 40($t0)
	       sw $t1, 48($t0)
	       sw $t1, 56($t0)
	       sw $t1, 64($t0)
	       sw $t1, 72($t0)
	       addi $t0, $t0, 128
	       sw $t1, 40($t0)
	       sw $t1, 44($t0)
	       sw $t1, 48($t0)
	       sw $t1, 56($t0)
	       sw $t1, 60($t0)
	       sw $t1, 64($t0)
	       sw $t1, 72($t0)
	       sw $t1, 76($t0)
	       sw $t1, 80($t0)
	       sw $t1, 88($t0)
	       addi $t0, $t0, 128
	       sw $t1, 64($t0)
	       addi $t0, $t0, 128
	       sw $t1, 56($t0)
	       sw $t1, 60($t0)
	       sw $t1, 64($t0)
	       
	       jr $ra
			
	
