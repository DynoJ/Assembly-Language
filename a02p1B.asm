##########################################################################
# Yaritza Kenyon, CS 2318-002, Assignment 2 Part 1 Program B
#
# This program is designed to check if 2 numbers are even or odd. 
# It also compares the two numbers using OR and outputs according 
# to the legen given.
############################ data segment ################################
		.data
legend:		.asciiz "0 = EE, 1 = EO, 2 = OE, 3 = OO\n"
		# EE = Even-Even, EO = Even-Odd, OE = Odd-Even, OD = Odd-Odd
inPrompt1:	.asciiz "Enter 1st integer: "
inPrompt2:	.asciiz "Enter 2nd integer: "
outLab1:	.asciiz " and "
outLab2:	.asciiz " are "
############################ code segment ################################
		.text
		.globl main
main:
		li $v0, 4
		la $a0, legend        
		syscall			# print legend
		la $a0, inPrompt1        
		syscall			# print input prompt 1
		li $v0, 5
		syscall			# read 1st integer
		move $t1, $v0
		li $v0, 4
		la $a0, inPrompt2        
		syscall			# print input prompt 2
		li $v0, 5
		syscall			# read 2nd integer
		move $t2, $v0

		li $v0, 11
		li $a0, '\n'
		syscall
		li $v0, 1
		move $a0, $t1        
		syscall			# 1st integer
		li $v0, 4
		la $a0, outLab1        
		syscall			# print " and "
		li $v0, 1
		move $a0, $t2        
		syscall			# 2nd integer
		li $v0, 4
		la $a0, outLab2        
		syscall			# print " are "

		li $v0, 1
		li $a0, 0		# initialize desired output to 0

		##########################################################
		# Insert NO MORE THAN 5 lines of code that involve ONLY 
		#   bit manipulating instructions (ANDing, ORing, XORing,
		#   NORing and shifting - only whatever that are needed)
		# so that the program will work just like the sample runs 
		# shown at the bottom (some blank lines edited out).
		# HINT: Risking telling the obvious, the instructions you
		#       insert are related to bringing the value in $a0
		#       from the initial value of 0 to the final desired
		#       value (which should be either 0, 1, 2 or 3 when
		#       printed as an integer).
		# You should test your completed program for AT LEAST the
		# test cases shown.
		##########################################################
		
		andi $t3, $t1, 1
		andi $t4, $t2, 1
		sll  $t3, $t3, 1
		or $a0, $t3, $t4
		
		
		syscall			# display desired output
		
		##########################################################
		
		li $v0, 10		# exit gracefully
		syscall

########################## sample test runs ##############################
# 0 = EE, 1 = EO, 2 = OE, 3 = OO
# Enter 1st integer: 100
# Enter 2nd integer: 200
# 100 and 200 are 0
# -- program is finished running --
# 
# Reset: reset completed.
# 
# 0 = EE, 1 = EO, 2 = OE, 3 = OO
# Enter 1st integer: -202
# Enter 2nd integer: -303
# -202 and -303 are 1
# -- program is finished running --
# 
# Reset: reset completed.
# 
# 0 = EE, 1 = EO, 2 = OE, 3 = OO
# Enter 1st integer: -333
# Enter 2nd integer: 444
# -333 and 444 are 2
# -- program is finished running --
#
# Reset: reset completed.
#
# 0 = EE, 1 = EO, 2 = OE, 3 = OO
# Enter 1st integer: 567
# Enter 2nd integer: -6789
# 567 and -6789 are 3
# -- program is finished running --
######################## end sample test runs ############################
