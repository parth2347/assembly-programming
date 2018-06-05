.MODEL SMALL 
.STACK
.DATA
    MSG DB "ENTER THE STRING -$"
    MSG1 DB "ENTERED STRING IS -$"
    BUF DB 26
        DB ?
        DB 26 DUP(0)
    MSG2 DB "   THE REVERSED STRING IS-$"    
.CODE 
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    MOV DX,OFFSET MSG
    MOV AH,09
    INT 21H
    
    MOV DX,OFFSET BUF
    MOV AH,0AH
    INT 21H
    
    MOV SI,OFFSET BUF+1
    MOV CL,[SI]
    MOV CH,0
    INC CX
    ADD SI,CX
    MOV [SI],'$'
    
    MOV DX,OFFSET MSG1
    MOV AH,09
    INT 21H

    MOV DX,OFFSET BUF+2
    MOV AH,09
    INT 21H
    
    MOV DI,OFFSET BUF+2
    XOR CX,CX
    L1:
    MOV AL,[DI]
    PUSH AX
    INC CX
    INC DI
    CMP [DI],'$'
    JNZ L1
    
    MOV DX,OFFSET MSG2
    MOV AH,09
    INT 21H
    
    NEXT:
    POP AX
    MOV DX,AX
    MOV AH,02
    INT 21H
    DEC CX
    JNZ NEXT
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
    END MAIN 
    
  
    
