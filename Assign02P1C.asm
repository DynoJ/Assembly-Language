##########################################################################
# Jack Kammerer, CS 2318-002, Assignment 2 Part 1 Program C
#
#Program Description
#
#MIPS assembly program to carry out the following tasks, in order:
#	Allocate a global array (i.e., space in the data segment) enough
# 	for storing 5 integers and initialize the array (from 1st to
#	5th element) with 808, 707, 303, 909 and 404 at the same time 
#	(i.e., DON'T first allocate uninitialized space for array and
#	later write code to put the values into array).
#	Display a labeled output about the array's initial contents 
#	(in the order from 1st to 5th element).
#
#IMPORTANT (for the purpose of this exercise):
#
#	You are to load the values of the array elements from memory and 
#	use those values to generate the labeled output.
#	(You are not to simply display a hard-coded string(s) and values
#	showing what the contents of the array should look like.)
#	Re-order the values in the array so that the contents of the 
#	array in memory (from 1st to 5th element) eventually becomes 
#	909, 404, 303, 808 and 707, using the following operations in the
#	order listed (to not defeat the goals of this exercise, you must 
#	NOT change the specified operations and order, even if  doing so 
#	will accomplish the same effect more efficiently):
#
#	Swap the contents in memory of the 1st and 4th elements of the 
#	initial array.
#
#NOTE: Contents of the array in memory (from 1st to 5th element) after this
#	first swapping operation should be 909, 707, 303, 808 and 404.
#	Swap the contents in memory of the 2nd and 5th elements of the array
#	that results after the preceding first swap.
#
#NOTE: Contents of the array in memory (from 1st to 5th element) after this 
#	second swapping operation should now and finally be 909, 404, 303, 
#	808 and 707.
#
#IMPORTANT (for the purpose of this exercise):
#
#	When performing each of the three swap operations above, you can re-use 
#	(where expedient) the array's base address in register (loaded when 
#	performing the display of the array's initial contents) but you MUST 
#	re-load the values of the associated array elements fresh from memory 
#	(i.e., assuming no knowledge that certain values might have already 
#	existed in some registers due to prior operations).
#	Display a labeled output about the array's contents (in the order from
#	5th to 1st element) after the 2 swapping operations above.
#
#
#(IN CASE YOU WONDER: Order in which the eventual contents of the array should 
#appear in this output -->  707, 808, 303, 404 and 909.)
#
#IMPORTANT (for the purpose of this exercise):
#
#When displaying the after-swap labeled output, you can re-use the array's base 
#address in register (loaded when performing prior operations) but you MUST 
#re-load the values of the array elements fresh from memory (i.e., assuming no 
#knowledge that certain values might have already existed in some registers due 
#to prior operations).
#CAUTION:
#Too many past students regretted having points taken off for not labeling output.

			.data
intArr:			.word 808, 707, 303, 909, 404		
 			 			
startArr:		.asciiz "The Intial array from 1 to 5: "	
 			 			
afterSwap:		.asciiz "After-swap array from 5 to 1: "		
 			 			
spaceChar:		.asciiz " "	
			 		
			.text
			.globl main
main:
			la $t0, intArr	
				
			li $v0, 4		
			la $a0, startArr		
			syscall	
			
			li $v0, 1		
			lw $a0, 0($t0)		
			syscall
			
			li $v0, 4		
			la $a0, spaceChar		
			syscall
			
			li $v0, 1		
			lw $a0, 4($t0)		
			syscall						
			 			
			li $v0, 4		
			la $a0, spaceChar		
			syscall
			
			li $v0, 1		
			lw $a0, 8($t0)		
			syscall
			
			li $v0, 4		
			la $a0, spaceChar		
			syscall
			
			li $v0, 1		
			lw $a0, 12($t0)		
			syscall
			
			li $v0, 4		
			la $a0, spaceChar		
			syscall
			
			li $v0, 1		
			lw $a0, 16($t0)		
			syscall
			
			li $v0, 4		
			la $a0, spaceChar		
			syscall
			
			li $v0, 11		
			li $a0, '\n'		
			syscall
			
			la $t0, intArr
			lw $t1, 0($t0)
			lw $t3, 12($t0)
			
			sw $t3, 0($t0)
			sw $t1, 12($t0)
			
			la $t0, intArr
			lw $t1, 4($t0)
			lw $t3, 16($t0)
			
			sw $t3, 4($t0)
			sw $t1, 16($t0)
			
			li $v0, 4
			la $a0, afterSwap
			syscall
			
			li $v0, 1
			lw $a0, 16($t0)
			syscall
			
			li $v0, 4 
			la $a0, spaceChar
			syscall
			
			li $v0, 1
			lw $a0, 12($t0)
			syscall
			
			li $v0, 4,
			la $a0, spaceChar,
			syscall
			
			li $v0, 1
			lw $a0, 8($t0)
			syscall
			
			li $v0, 4
			la $a0, spaceChar
			syscall
			
			li $v0, 1
			lw $a0, 4($t0)
			syscall
			
			li $v0, 4
			la $a0, spaceChar
			syscall
			
			li $v0, 1
			lw $a0, 0($t0)
			syscall
			
			li $v0, 10
			syscall
			
			
			
			
			
			
			
			
			
			
			
		