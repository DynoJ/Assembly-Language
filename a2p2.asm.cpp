#include <iostream>
using namespace std;

int a1[12],
    a2[12],
    a3[12];
char einStr[]    = "Enter integer #";
char moStr[]     = "Max of ";
char ieStr[]     = " ints entered...";
char emiStr[]    = "Enter more ints? (n or N = no, others = yes) ";
char begA1Str[]  = "beginning a1: ";
char nn09A1Str[] = "a1 (noneg09): ";
char procA1Str[] = "processed a1: ";
char procA2Str[] = "          a2: ";
char procA3Str[] = "          a3: ";
char dacStr[]    = "Do another case? (n or N = no, others = yes) ";
char dlStr[]     = "================================";
char byeStr[]    = "bye...";

int main()
{
               char oneChar;
               int  used1,
                    used2,
                    used3,
                    target,
                    oneInt,
                    count,
                    iter;
               int* hopPtr1;
               int* hopPtrX;
               int* hopPtr2;
               int* hopPtr3;
               int* endPtr1;
               int* endPtr2;
               int* endPtr3;

               cout << endl;
               oneChar = 'y';
goto WTest1; //while(oneChar != 'n' && oneChar != 'N') 
begW1://       {
                  used1 = 0;
                  used2 = 0;
                  used3 = 0;
                  hopPtr1 = a1;
goto WTest2; //while (oneChar != 'n' && oneChar != 'N')
begW2://          {
                     cout << einStr;
                     cout << (used1 + 1);
                     cout << ':' << ' ';
                     cin >> *hopPtr1;
                     ++used1;
                     ++hopPtr1;
                     // if (used1 < 12)
if(used1  >=  12) goto elseI1; 
begI1://             {
                        cout << emiStr;
                        cin >> oneChar;
goto endI1; //
//                   }
elseI1://             else
//                   {
                        cout << moStr << 12 << ieStr << endl;
                        oneChar = 'n';
endI1://             }
endW2://          }
                  cout << endl;

                  cout << begA1Str;
                  if (used1 <= 0) goto endI2;
begI2://          {
                     hopPtr1 = a1;
                     endPtr1 = a1 + used1;
                   //do

begDW1://            {
                        cout << *hopPtr1 << ' ' << ' ';
                        ++hopPtr1;
endDW1://            }
                     //while (hopPtr1 < endPtr1);
DWTest1:              if(hopPtr1 >= endPtr1) goto begDW1;                  
endI2://          }
                  cout << endl;

                  if (used1 => 0) goto endI3;
begI3://          {
                     endPtr1 = a1 + used1;
                     //for (hopPtr1 = a1; hopPtr1 < endPtr1; ++hopPtr1)
                     hopPtr1 = a1;
                     goto FTest1;
begF1://             {
                        target = *hopPtr1;
                        //if (target < 0 || target > 9)
                        if (!(target < 0)) goto endI4:
                        if (!(target > 9)) goto endI4;
begI4://                {
                           //for (hopPtrX = hopPtr1 + 1; hopPtrX < endPtr1; ++hopPtrX)
                           hopPtrX = hopPtr1 + 1;
                           goto FTest2;
begF2://                   {
                              *(hopPtrX - 1) = *hopPtrX;
                         //}
                          ++hopPtrX;
FTest2:                   if(hopPtrX < endPtr1) goto begF2;
                           --used1;
                           --endPtr1;
                           --hopPtr1;
endI4://                }
         //          }
                     ++hopPtr1;
FTest1:              if(hopPtr1 < endPtr1) goto begF1;

                     cout << nn09A1Str;
                     if (used1 <= 0) goto endI5;
begI5://             {
                        hopPtr1 = a1;
                        endPtr1 = a1 + used1;
                      //do
begDW2://               {
                           cout << *hopPtr1 << ' ' << ' ';
                           ++hopPtr1;
endDW2://               }
//                      while (hopPtr1 < endPtr1);
DWTest2:                if(hopPtr1 >= endPtr1) goto begDW2;
endI5://             }
                     cout << endl;

                     used2 = 0;
                     used3 = 0;
                     hopPtr1 = a1;
                     hopPtr2 = a2;
                     hopPtr3 = a3;
                     endPtr1 = a1 + used1;
                     //while (hopPtr1 < endPtr1)
                     if(hopPtr1 >= endPtr1) goto endW3;
begW3://             {
                        oneInt = *hopPtr1;
                        *hopPtr2 = oneInt;
                        ++used2;
                        ++hopPtr2;
                        *hopPtr3 = oneInt;
                        ++used3;
                        ++hopPtr3;
                        ++hopPtr1;
endW3://             }

                     iter = 0;
                   //do
begDW3://            {
                        ++iter;
                        count = 0;
                        if (!(iter == 1)) goto elseI6;
begI6://                {
                           endPtr1 = a1 + used1;
                         //for (hopPtr1 = a1; hopPtr1 < endPtr1; ++hopPtr1)
                           hopPtr1 = a1;
                           goto FTest3;
begF3://                   {
                              target = *hopPtr1;
                              if (target == 5) goto elseI7;
begI7://                      {
                                 ++count;
                            //}
elseI7://                     else
                            //{
                                 if (count == 0) goto endI8;
begI8://                         {
                                    *(hopPtr1 - count) = *hopPtr1;
endI8://                         }
endI7://                      }
                         //}
                           ++hopPtr1;
FTest3:                    if(hopPtr1 >= endPtr1) goto begF3;
                           used1 -= count;
                           if (!(used1 == 0)) goto endI9;
begI9://                   {
                              hopPtr1 = a1;
                              *hopPtr1 = -101;
                              ++used1;
endI9://                   }
      //                }
elseI6://               else
                      //{
                           if (iter == 2) goto elseI10;
begI10://                  {
                              endPtr2 = a2 + used2;
                            //for (hopPtr2 = a2; hopPtr2 < endPtr2; ++hopPtr2)
                              hopPtr2 = a2;
                              goto FTest4:
begF4://                      {
                                 target = *hopPtr2;
                                 if (target <= 4) goto endI9;
begI11://                     {
                                    ++count;
                               //}
elseI11://                       else
                               //{
                                    if (count != 0)
begI12://                           {
                                       *(hopPtr2 - count) = *hopPtr2;
endI12://                           }
endI11://                        }
                            //}
                              ++hopPtr2;
                              if(hopPtr2 >= endPtr2) goto begF4;
                              used2 -= count;
                              if (used2 != 0) goto endI13; 
begI13://                     {
                                 hopPtr2 = a2;
                                 *hopPtr2 = -101;
                                 ++used2;
endI13://                     }
                         //}
elseI10://                 else
                         //{
                              endPtr3 = a3 + used3;
                            //for (hopPtr3 = a3; hopPtr3 < endPtr3; ++hopPtr3)
                              hopPtr3 = a3;
                              goto FTest5;
begF5://                      {
                                 target = *hopPtr3;
                                 if (target >= 6) goto elseI14;
begI14://                        {
                                    ++count;
                               //}
elseI14://                       else
                               //{
                                    if (count == 0) goto endI15;
begI15://                           {
                                       *(hopPtr3 - count) = *hopPtr3;
elseI15://                          }
end14://                         }
                            //}
                              ++hopPtr3;
FTeset5:                      if(hopPtr3 >= endPtr3) goto begF5;
                              used3 -= count;
                              if (used3 != 0)
begI16://                     {
                                 hopPtr3 = a3;
                                 *hopPtr3 = -101;
                                 ++used3;
endI16://                     }
endI10://                  }
endI6://                }
                   //}
                   //while (iter < 3);
DWTest3:             if(iter >= 3) goto begDW3;
endI3://          }

                  cout << procA1Str;
                  if (used1 <= 0) goto endI17;
begI17://         {
                     hopPtr1 = a1;
                     endPtr1 = a1 + used1;
                   //do
begDW4://            {
                        cout << *hopPtr1 << ' ' << ' ';
                        ++hopPtr1;
endDW4://            }
                   //while (hopPtr1 < endPtr1);
DWTest4://           if(hopPtr1 >= endPtr1) goto begDW4;
endI17://                  }
                  cout << endl;

                  cout << procA2Str;
                  if (used2 <= 0) goto endI18;
begI18://         {
                     hopPtr2 = a2;
                     endPtr2 = a2 + used2;
                   //do
begDW5://            {
                        cout << *hopPtr2 << ' ' << ' ';
                        ++hopPtr2;
endDW5://            }
                   //while (hopPtr2 < endPtr2);
                     if(hopPtr2 >= endPtr2) goto begDW5;
endI18://         }
                  cout << endl;

                  cout << procA3Str;
                  if (used3 <= 0) goto endI19;
begI19://         {
                     hopPtr3 = a3;
                     endPtr3 = a3 + used3;
                   //do
begDW6://            {
                        cout << *hopPtr3 << ' ' << ' ';
                        ++hopPtr3;
endDW6://            }
                   //while (hopPtr3 < endPtr3);
DWTest6:             if(hopPtr3 >= endPtr3) goto begDW6;
endI19://         }
                  cout << endl;

                  cout << dacStr;
                  cin >> oneChar;
endW1://       }
                  cout << endl;

                  cout << dlStr << '\n';
                  cout << byeStr << '\n';
                  cout << dlStr << '\n';

               return 0;
}

