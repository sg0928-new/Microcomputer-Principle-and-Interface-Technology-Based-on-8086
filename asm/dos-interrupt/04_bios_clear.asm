; ============================================================
; 04_bios_clear.asm
; Purpose: clear screen with INT 10H AH=06H, then print
; ============================================================

DATA SEGMENT
    MSG DB 'Screen cleared! $'
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
    MOV AX, DATA
    MOV DS, AX

    ; clear whole screen
    MOV AH, 06H
    MOV AL, 0
    MOV CX, 0
    MOV DX, 184FH
    MOV BH, 07H
    INT 10H

    ; move cursor to top-left
    MOV AH, 02H
    XOR DX, DX
    XOR BH, BH
    INT 10H

    LEA DX, MSG
    MOV AH, 09H
    INT 21H

    MOV AH, 4CH
    INT 21H
CODE ENDS
END START
