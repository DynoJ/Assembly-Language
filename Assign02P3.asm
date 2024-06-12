###############################################################################
# Title: Assign02P3                   Author: Jack Kammerer
# Class: CS 2318-003, Fall 2023       Submitted: 11/21/23
###############################################################################
# Program: MIPS translation of a given C++ program
###############################################################################
# Pseudocode description: supplied a2p2_SampSoln.cpp
###############################################################################

#include <iostream>
#using namespace std;

#int a1[12],
#    a2[12],
#    a3[12];
#char einStr[]    = "Enter integer #";
#char moStr[]     = "Max of ";
#char ieStr[]     = " ints entered...";
#char emiStr[]    = "Enter more ints? (n or N = no, others = yes) ";
#char begA1Str[]  = "beginning a1: ";
#char nn09A1Str[] = "a1 (noneg09): ";
#char procA1Str[] = "processed a1: ";
#char procA2Str[] = "          a2: ";
#char procA3Str[] = "          a3: ";
#char dacStr[]    = "Do another case? (n or N = no, others = yes) ";
#char dlStr[]     = "================================";
#char byeStr[]    = "bye...";


################################################ 
# Register usage: 
################################################ 
# $a1: endPtr1 
# $a2: endPtr2 
# $a3: endPtr3 
# $t0: temp holder 
# $t1: used1 
# $t2: used2 
# $t3: used3 
# $t4: hopPtr1 
# $t5: hopPtr2 or remCount (non-overlappingly) 
# $t6: hopPtr11 or hopPtr22 (non-overlappingly) 
# $t7: hopPtr3 or hopPtr222 (non-overlappingly) 
# $t8: reply or anchor (non-overlappingly) 
# $t9: temp holder 
# $v1: temp holder  
################################################




			.data
array1:			.space 50
array2:			.space 50
array3:			.space 50
begA1Str:		.asciiz "\nbeginning a1: "
proA1Str:		.asciiz "processed a1: "
comA2Str:		.asciiz "          a2: "
comA3Str:		.asciiz "          a3: "
einStr:			.asciiz "Enter integer #"
moStr:			.asciiz "Max of "
ieStr:			.asciiz " ints entered..."
emiStr:			.asciiz "Enter more ints? (n or N = no, others = yes) "
dacStr:			.asciiz "Do another case? (n or N = no, others = yes) "
dlStr:			.asciiz "================================"
byeStr:			.asciiz "bye..."
colSpace:		.asciiz ": "
newLine:		.asciiz "\n"

			.text
			.globl main
main:			
#int main()
#{
            #oneChar = 'y';
            #while (oneChar != 'n' && oneChar != 'N')
            #goto WTest1;
begW1:
            li $t1, 0
            la $t4, array1
            #while (oneChar != 'n' && oneChar != 'N')
begW2:		#{
            #cout << einStr;
            li $v0, 4
            la $a0, einStr
            syscall
            #cout << (used1 + 1);
            li $v0, 1
            addi $a0, $t0, 1
            syscall
            #cout << ':' << ' ';
            li $v0, 4
		     la $a0, colSpace
		     syscall
            #cin >> *hopPtr1;
            li $v0, 5
            syscall
            move $t4, $v0
            #++used1;
            addi $t1, $t1, 1
            #++hopPtr1;
            addi $t4, $t4, 1
            #if (used1 < 12)
            #if (used1 >= 12) goto elseI1;
            li $t0, 12
            bne $t1, $t0, else1
begI1:               #{
            #cout << emiStr;
            li $v0, 4
			la $a0, emiStr
			syscall
            #cin >> oneChar;
            li $v0, 12
			syscall
elseI1:     #else
                     #{
            #cout << moStr << 12 << ieStr << endl;
            #oneChar = 'n';
			li $v0, 4
			la $a0, moStr
			syscall
			li $v0, 1
			li $a0, 12
			syscall		 
			li $v0, 4
			la $a0, einStr
			syscall
			li $v0, 4
			la $a0, newLine
			syscall
			li $t8, 'n'
			j endI1
             	     #}
endI1:
endW2:            #}
WTest2:           #//if (oneChar != 'n' && oneChar != 'N') goto begW2;
                  #if (oneChar == 'n') goto xitW2;
                  #if (oneChar != 'N') goto begW2;
            li $t5, 'n'
            beq $v1, $t5, xitDW2
			li $t5, 'N'
			beq $v1, $t5, begDW2
xitW2:

            #cout << endl;
			li $v0, 4
			la $a0, newLine
			syscall
            #cout << begA1Str;
            li $v0, 4
			la $a0, begA1Str
			syscall
            #//if (used1 > 0)
                  	
            #if (used1 <= 0) goto endI2;
begI2:            #{

            #hopPtr1 = a1;
            la $t4, array1
            #endPtr1 = a1 + used1;
            la $t9, array1
			sll $a1, $t1, 2
			add $a1, $a1, $t9
                     #//do
begDW1:             #{

                        #cout << *hopPtr1 << ' ' << ' ';
                        #++hopPtr1;
endDW1:             #}
DWTest1:             if (hopPtr1 < endPtr1) goto begDW1;

endI2:            #}
                  cout << endl;

                  //if (used1 > 0)
                  if (used1 <= 0) goto endI3;
begI3:            #{
                     endPtr1 = a1 + used1;
                     //for (hopPtr1 = a1; hopPtr1 < endPtr1; ++hopPtr1)
                     hopPtr1 = a1;
                     goto FTest1;
begF1:               #{
                        target = *hopPtr1;
                        //if (target < 0 || target > 9)
                        if (target >= 0 && target <= 9) goto endI4;
begI4:                  #{
                           //for (hopPtrX = hopPtr1 + 1; hopPtrX < endPtr1; ++hopPtrX)
                           hopPtrX = hopPtr1 + 1;
                           goto FTest2;
begF2:                     #{
                              *(hopPtrX - 1) = *hopPtrX;
                              ++hopPtrX;
endF2:                     #}
FTest2:                    if (hopPtrX < endPtr1) goto begF2;

                           --used1;
                           --endPtr1;
                           --hopPtr1;
endI4:                  #}
                        ++hopPtr1;
endF1:               #}
FTest1:              if (hopPtr1 < endPtr1) goto begF1;

                     cout << nn09A1Str;
                     //if (used1 > 0)
                     if (used1 <= 0) goto endI5;
begI5:  #             {
                        hopPtr1 = a1;
                        endPtr1 = a1 + used1;
                        //do
begDW2:              #{
                           cout << *hopPtr1 << ' ' << ' ';
                           ++hopPtr1;
endDw2:                 #}
DWTest2:                if (hopPtr1 < endPtr1) goto begDW2;
endI5:               #}
                     cout << endl;

                     used2 = 0;
                     used3 = 0;
                     hopPtr1 = a1;
                     hopPtr2 = a2;
                     hopPtr3 = a3;
                     endPtr1 = a1 + used1;
                     //while (hopPtr1 < endPtr1)
                     goto WTest3;
begW3:               #{
                        oneInt = *hopPtr1;
                        *hopPtr2 = oneInt;
                        ++used2;
                        ++hopPtr2;
                        *hopPtr3 = oneInt;
                        ++used3;
                        ++hopPtr3;
                        ++hopPtr1;
endW3:               #}
WTest3:              if (hopPtr1 < endPtr1) goto begW3;

                     iter = 0;
                     //do
begDW3:              #{
                        ++iter;
                        count = 0;
                        //if (iter == 1)
                        if (iter != 1) goto elseI6;
begI6:                  #{
                           endPtr1 = a1 + used1;
                           //for (hopPtr1 = a1; hopPtr1 < endPtr1; ++hopPtr1)
                           hopPtr1 = a1;
                           goto FTest3;
begF3:                     #{
                              target = *hopPtr1;
                              //if (target != 5)
                              if (target == 5) goto elseI7;
begI7:                        #{
                                 ++count;
                                 goto endI7;
                              #}
elseI7:                       #else
                              #{
                                 //if (count != 0)
                                 if (count == 0) goto endI8;
begI8:                           #{
                                    *(hopPtr1 - count) = *hopPtr1;
endI8:                           #}
endI7:                        #}
                              ++hopPtr1;
endF3:                     #}
FTest3:                    if(hopPtr1 < endPtr1) goto begF3;

                           used1 -= count;
                           //if (used1 == 0)
                           if (used1 != 0) goto endI9;
begI9:                     
			   #{
                              hopPtr1 = a1;
                              *hopPtr1 = -101;
                              ++used1;
endI9:                     #}
                           goto endI6;
                        #}
elseI6:                 #else
                        #{
                           //if (iter == 2)
                           if (iter != 2) goto elseI10;
begI10:                    
			   #{
                              endPtr2 = a2 + used2;
                              //for (hopPtr2 = a2; hopPtr2 < endPtr2; ++hopPtr2)
                              hopPtr2 = a2;
                              goto FTest4;
begF4://                      {
                                 target = *hopPtr2;
                                 //if (target > 4)
                                 if (target <= 4) goto elseI11;
begI11://                        {
                                    ++count;
                                    goto endI11;
//                               }
elseI11://                       else
//                               {
                                    //if (count != 0)
                                    if (count == 0) goto endI12;
begI12://                           {
                                       *(hopPtr2 - count) = *hopPtr2;
endI12://                           }
endI11://                        }
                                 ++hopPtr2;
//                            }
FTest4:                       if (hopPtr2 < endPtr2) goto begF4;

                              used2 -= count;
                              //if (used2 == 0)
                              if (used2 != 0) goto endI13;
begI13://                     {
                                 hopPtr2 = a2;
                                 *hopPtr2 = -101;
                                 ++used2;
endI13://                     }
                              goto endI10;
//                         }
elseI10://                 else
//                         {
                              endPtr3 = a3 + used3;
                              //for (hopPtr3 = a3; hopPtr3 < endPtr3; ++hopPtr3)
                              hopPtr3 = a3;
                              goto FTest5;
begF5://                      {
                                 target = *hopPtr3;
                                 //if (target < 6)
                                 if (target >= 6) goto elseI14;
begI14://                        {
                                    ++count;
                                    goto endI14;
//                               }
elseI14://                       else
//                               {
                                    //if (count != 0)
                                    if (count == 0) goto endI15;
begI15://                           {
                                       *(hopPtr3 - count) = *hopPtr3;
endI15://                           }
endI14://                        }
                                 ++hopPtr3;
endF5://                      }
FTest5:                       if (hopPtr3 < endPtr3) goto begF5;

                              used3 -= count;
                              //if (used3 == 0)
                              if (used3 != 0) goto endI16;
begI16://                     {
                                 hopPtr3 = a3;
                                 *hopPtr3 = -101;
                                 ++used3;
endI16://                     }
endI10://                  }
endI6://                }
endDW3://            }
DWTest3:             if (iter < 3) goto begDW3;
endI3://          }

                  cout << procA1Str;
                  //if (used1 > 0)
                  if (used1 <= 0) goto endI17;
begI17://         {
                     hopPtr1 = a1;
                     endPtr1 = a1 + used1;
                     //do
begDW4://            {
                        cout << *hopPtr1 << ' ' << ' ';
                        ++hopPtr1;
endDW4://            }
DWTest4:             if (hopPtr1 < endPtr1) goto begDW4;
endI17://         }
                  cout << endl;

                  cout << procA2Str;
                  //if (used2 > 0)
                  if (used2 <= 0) goto endI18;
begI18://         {
                     hopPtr2 = a2;
                     endPtr2 = a2 + used2;
                     //do
begDW5://            {
                        cout << *hopPtr2 << ' ' << ' ';
                        ++hopPtr2;
endDW5://            }
DWTest5:             if (hopPtr2 < endPtr2) goto begDW5;
endI18://         }
                  cout << endl;

                  cout << procA3Str;
                  //if (used3 > 0)
                  if (used3 <= 0) goto endI19;
begI19://         {
                     hopPtr3 = a3;
                     endPtr3 = a3 + used3;
                     //do
begDW6://            {
                        cout << *hopPtr3 << ' ' << ' ';
                        ++hopPtr3;
endDW6://            #}
DWTest6:             #if (hopPtr3 < endPtr3) goto begDW6;
		     	ble $t5, $a2, begF6
#               	cout << comA3Str;
endI19://         #}
                  cout << endl;

                  cout << dacStr;
                  cin >> oneChar;
               #}
endW1:  
WTest1:        
#		//if (oneChar != 'n' && oneChar != 'N') goto begW1;
#               if (oneChar == 'n') goto xitW1;
#               if (oneChar != 'N') goto begW1;
			li $t5, 'n'
			beq $v1, $t5, xitW1
			li $t5, 'N'
			bne $v1, $t5, begW1
xitW1:
#			cout << dlStr;
			li $v0, 4
			la $a0, dlStr
			syscall
#			cout << '\n';
			li $v0, 4
			la $a0, newLine
			syscall
#			cout << byeStr;
			li $v0, 4
			la $a0, byeStr
			syscall
#			cout << '\n';
			li $v0, 4
			la $a0, newLine
			syscall
#			cout << dlStr;
			li $v0, 4
			la $a0, dlStr
			syscall
#			cout << '\n';
			li $v0, 4
			la $a0, newLine
			syscall
#             		return 0;
			li $v0, 10
			syscall
#}
