#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int ZERO=0,A0,A1,A2,A3,A4,V0,V1,S1,S2,S3,S4,S5,S6;
int s7,T0,T1,T2,T3,T4,T5,T6,T7,T8,T9,RA,R31;


char temp[100];
int H=11;
int W=21;
int startX=1;
int totalElements=232;

char map[232]=
	 "I.IIIIIIIIIIIIIIIIIJH"
     "I....I....I.......I.I"
     "III.IIIII.I.I.III.I.I"
     "I.I.....I..I..I.....I"
     "I.I.III.II...II.I.III"
     "I...I.......I...I...I"
     "IIIII.IIIII.III.III.I"
     "I..............II@..I"
     "IIIIIIIIIIIIII.I...II"
     "@.................III"
     "IIIIIIIIIIIIIIIIIIIII";




void printLabyrinth();
void makeMove();
void usleep();

int  main(){
	S2=H;
	S3=W;
	S1=totalElements;
	
	A0=startX;
	makeMove();
	return 0;
}


void makeMove(){
	
	int C[1];
	C[0]=T0; //Save to orisma (arxikh thesh otan kaloume th sunarthsh)
	T0=A0;   //T0= orisma
	
	T1='*';
	T2='#';
	T3='.';
	T4='@';
	T5='%';
	
	if(T0<ZERO)goto end_move;    //iF bigger than totalelements or less than zero end
	if(T0>=S1)goto end_move;
	
	if(map[T0]!=T3)goto else1;   //our place unequal with .
	  
	  map[T0]=T1;      //T1==*
	  
      printLabyrinth();  
	  
	  C[1]=RA;

	  A0=T0+1;  //a0=index+1
	  makeMove();
	  RA=C[1];
	  
	if(V0!=1)goto label2;  
    printf("HERERERERERE");
	  map[T0]=T2; 	//T2==#
	  
      printLabyrinth();  
      V0=1;
     return ;
	  //JRA;
	label2:
	  A0=T0+S3-1;     //T0 einai to orisma mas,a0=index +W
	  
	  makeMove();
	  
	  RA=C[1];
	  
	if(V0!=1)got3o label3;
	
      		map[T0]=T2;  //T2==#
      		
      printLabyrinth();  
     	  	V0=1;
			return ;
       
	label3: 	
		
		A0=T0-1 ;     //T0 einai to orisma mas,(a0=index-1)
		makeMove(); 
		RA=C[1];
	
    if(V0!=1)goto label4;
     map[T0]=T2;
     
      printLabyrinth();  
     V0=1;
      return;
    label4:
    
    A0=T0-22;  //T0 einai to orisma mas ,ao=index-W
    printf("%d",A0);
    makeMove();
    RA=C[1];
    
    if(V0!=1)goto label5;
     map[T0]=T2;
     
      printLabyrinth();  
     V0=1;
     return ;
    label5:
    
    else1:
    if(map[T0]!=T4)goto end_move;
     map[T0]=T5;
     		
     printLabyrinth();
     V0=1;
     return ;
	end_move:
		
	V0=0;
    return ;
}




void printLabyrinth(void){
	int T0=0;
    int T1=0;
	int T2=0;
    int T3=H;
    int T4=W;
    
   // A0=200000;
    usleep(200000);
    
    printf("\nLabyrinth \n");
    for_label:
    	if(T0>=T3)goto end_label; //T3=H
    	  T1=ZERO;
    	  for_label_2:
          if(T1>=T4)goto end_label_2;  //T4= W
              temp[T1]=map[T2];    
              printf("%c",temp[T1]);
              T2=T2+1;
              T1=T1+1;
              goto for_label_2;
              
              end_label_2:
              	
              printf("\n");
              T1=T1+1;
			  temp[T1]='\0';
			  T0=T0+1;	
            
              goto for_label;
         end_label:
         	return ;
         }
