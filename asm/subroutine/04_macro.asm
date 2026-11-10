; ============================================================
; 04_macro.asm
; Purpose: define and use a macro with parameter
; ============================================================

; macro: print one character
PUTC MACRO CHAR
    MOV DL, CHAR
    MOV AH, 02H
    INT 21H
ENDM

CODE SEGMENT
ASSUME CS:CODE, DS:CODE
START:
    PUTC 'A'
    PUTC 'B'
    PUTC 'C'
    PUTC 0DH
    PUTC 0AH

    MOV AH, 4CH
    INT 21H
CODE ENDS
END START
