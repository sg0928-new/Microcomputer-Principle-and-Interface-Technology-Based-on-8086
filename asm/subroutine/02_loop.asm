; ============================================================
; 02_loop.asm
; Purpose: print digits 0..9 using LOOP and CX
; ============================================================

CODE SEGMENT
ASSUME CS:CODE, DS:CODE
START:
    MOV CX, 10
    MOV BL, '0'
NEXT:
    MOV DL, BL
    MOV AH, 02H
    INT 21H
    MOV DL, ' '
    INT 21H
    INC BL
    LOOP NEXT

    MOV AH, 4CH
    INT 21H
CODE ENDS
END START
