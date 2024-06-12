##########################################################################
# Farrah Omar, CS 2318-002, Assignment 2 Part 1 Program A
#Program Description
#Program to do the following (in the order described):

#Prompt the user to enter an integer with "Section ID (2 or 3): ", read 
#the user's input, and display a labeled output with the user's input 
#as "Hey you of CS2318.00?" (where ? should match the integer the user
# entered).

#Prompt the user to enter a string  (of up to 25 characters long) with
# "Halloween costume (up to 25 characters): ", read the user's input,
#and display a labeled output with the user's input as "LOL! ???" 
#(where ??? should match the string the user entered).

#	String entered MUST be stored in separate storage space 
#(i.e., not overwriting the storage space used by prompt and label 
#strings) allocated just enough (no more, no less) to accommodate up 
#to the maximum number of characters indicated.

#Prompt the user to enter a character with "One-character nickname:
# ", read the user's input, and display a labeled output with the 
#user's input as "Yippee! ?" (where ? should match the character 
#the user entered).

#	Note that it involves a character, NOT a one-charater 
#string. You will get no credits if you do it using a one-character
# string even though the same output is obtained.
#Also, be sure to introduce appropriate spaces and newlines to make
# what appears on the Run I/O window (of MARS) reasonably readable.

#CAUTION:
#Too many past students regretted having points taken off for 
#failing to do one or more of these:
#- not separately "prompt then read then display" each type of data
#  -- e.g.: "prompt then read all 3 types" followed by "display 
#all 3 types"
#- not appropriately "introduce spaces and newlines" to make 
#interative I/O (what appears on the Run I/O window) reasonably 
#readable
#  (e.g.: items "not-logically-belonging-together" appear in one
# line, perhaps also running together)
		.data
eyiPrmpt:	.asciiz "\nSection ID (2 or 3): "
hyPrmpt:	.asciiz "Hey you of CS2318.00"
easPrmpt:	.asciiz "\nHalloween costume (up to 25 characters): "
uiPrmpt:	.asciiz "LOL! "
eycPrmpt:	.asciiz "One-character nickname: "
ucniPrmpt:	.asciiz "\nYipee! "
name:		.space 26
		
		.text
		.globl main
main:
		li $v0, 4
		la $a0, eyiPrmpt
		syscall
		
		li $v0, 5
		syscall
		move $t0, $v0
		
		li $v0, 4
		la $a0, hyPrmpt
		syscall
		
		li $v0, 1
		move $a0, $t0
		syscall

		li $v0, 4
		la $a0, easPrmpt
		syscall
		
		li $v0, 8
		la $a0, name
		li $a1, 26
		
		syscall
		
		li $v0, 4
		la $a0, uiPrmpt
		syscall
		
		li $v0, 4
		la $a0, name
		syscall
		
		li $v0, 4
		la $a0, eycPrmpt
		syscall
		
		li $v0, 11
		move $a0, $t0
		syscall
		
		li $v0, 12
		syscall
		
		move $t1, $v0
		
		li $v0, 4
		la $a0, ucniPrmpt
		syscall
		
		li $v0, 11
		move $a0,$t1 
		syscall
		
		li $v0, 10
		syscall