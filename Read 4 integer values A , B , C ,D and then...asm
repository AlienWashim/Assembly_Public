           CHECKER MACRO A,B,C,D
    
    MOV BL,B 
    CMP BL,C 
    JLE NOT_ACCEPTED
    
    MOV BL,D  
    CMP BL,A 
    JLE NOT_ACCEPTED
    
    
    XOR AH,AH
    MOV  AL,C
    ADD AL,D
    
    MOV BL,A
    ADD BL,B
    
    CMP AL,BL
    JLE NOT_ACCEPTED
    
    
    MOV AL,A
    MOV BL,2
    DIV BL
    
    CMP AH,0
    JNE NOT_ACCEPTED
    
    
    JMP ACCEPTED
    
    ENDM

INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H                 
.DATA
A DB ?
B DB ?
C DB ?
D DB ?
.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    PRINT '1ST NUMBER: '
    CALL SCAN_NUM
    MOV A,CL
    
    PRINTN
    PRINT '2ND NUMBER: '
    CALL SCAN_NUM
    MOV B,CL
    
    PRINTN
    PRINT '3RD NUMBER: '
    CALL SCAN_NUM
    MOV C,CL
    
    PRINTN
    PRINT '4TH NUMBER: '
    CALL SCAN_NUM
    MOV D,CL
    
    CHECKER A,B,C,D
    
    EXIT:
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
    
    DEFINE_SCAN_NUM
    DEFINE_PRINT_NUM
    DEFINE_PRINT_NUM_UNS
    
    RESULT PROC
        ACCEPTED:
        PRINTN 'ACCEPTED VALUE'
        PRINTN
        JMP EXIT
        
        NOT_ACCEPTED:
        PRINTN 'NOT ACCEPTED VALUE'
        PRINTN
        
        JMP EXIT
        RESULT ENDP
    
END MAIN