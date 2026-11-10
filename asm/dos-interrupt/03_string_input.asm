; ============================================================
; 03_string_input.asm
; Purpose: read a string with INT 21H AH=0AH then print it
; Buffer layout: byte0=max, byte1=actual length, byte2+=chars
; ============================================================

DATA SEGMENT
    BUF    DB 20, ?, 20 DUP(?)
    PROMPT DB 'Input text: $'
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
    MOV AX, DATA
    MOV DS, AX

    LEA DX, PROMPT
    MOV AH, 09H
    INT 21H

    LEA DX, BUF
    MOV AH, 0AH
    INT 21H

    ; terminate the input string with '$' for printing
    MOV BL, BUF+1       ; actual length
    XOR BH, BH
    MOV BYTE PTR BUF+2[BX], '$'

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, BUF+2
    MOV AH, 09H
    INT 21H

    MOV AH, 4CH
    INT 21H
CODE ENDS
END START
