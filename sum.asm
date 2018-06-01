# assembly-programming
.MODEL SMALL
.8086
.STACK
.DATA
    
    MSG DB "ENTER THE NUMBER -$"
    NUMBER DW ?
    RESULT DW ?
    MSG1 DB "SUM -$"
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV DX,OFFSET MSG
    MOV AH,09
    INT 21H
    
    ;TAKE INPUT
    MOV AH,01
    INT 21H
    SUB AL,30H
    
    MOV BH,AL
    
    MOV AH,01
    INT 21H
    SUB AL,30H
    
    MOV BL,AL
    MOV AX,BX
    AAD 
    MOV BX,AX
    
    MOV NUMBER,BX
    MOV AX,0000H
    MOV BX,0001H
    MOV CX,NUMBER 
    
    L1:
        ADD AX,BX
        INC BX
    LOOP L1
    
    MOV RESULT,AX
    
    MOV DX,OFFSET MSG1
    MOV AH,09
    INT 21H
    
    MOV AX,RESULT
    XOR CX,CX
    MOV CX,4
    XOR BX,BX
    MOV BX,10
    
    L2:
        XOR DX,DX
        DIV BX
        PUSH DX
        DEC CX
        JNZ L2
    
    XOR CX,CX
    MOV CX,4    
    NEXT:
        POP DX
        ADD DL,48
        MOV AH,02
        INT 21H
        DEC CX
        JNZ NEXT
    
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP 
    END MAIN
