       MOV R0,#03
AGAIN: MOV A,R0
       MOV R1,A
       MOV DPTR,#1000H
FIRST: PUSH DPH
       PUSH DPL
       MOVX A,@DPTR
       MOV B,A
       INC DPTR
       MOVX A,@DPTR
       CJNE A,B,NEXT
NEXT:  JC LOOP
       POP DPL
       POP DPH
       MOVX @DPTR,A
       INC DPTR
       MOV A,B
       MOVX @DPTR,A
LOOP:  DJNZ R1,FIRST
       DJNZ R0,AGAIN
HALT:  SJMP HALT

