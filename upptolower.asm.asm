PRINT MACRO MSG
    MOV DX,OFFSET MSG
    MOV AH,09
    INT 21H

    ENDM
.MODEL SMALL 
.8086
.STACK
.DATA
    MSG DB "ENTER THE CHARACTER -$"
    MSG1 DB "THE CHARACTER AFTER ALTERING -$"
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    PRINT MSG
    
    MOV AH,01
    INT 21H
    
    PRINT MSG1
    
    CMP AL,97
    JGE L1
    JL L2
    
    L1:
    SUB AL,32
    MOV DX,AX
    MOV AH,02
    INT 21H
    
    L2:
    ADD AL,32
    MOV DX,AX
    MOV AH,02
    INT 21H
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
    END MAIN 
    
    
    
    
        
    