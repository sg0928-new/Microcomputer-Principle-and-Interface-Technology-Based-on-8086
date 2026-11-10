; ============================================================
; 01_hello.asm
; Purpose: print a string using INT 21H AH=09H
; Note: string must end with '$'
; ============================================================

DATA SEGMENT
    MSG DB 'Hello 8086! $'
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
    MOV AX, DATA
    MOV DS, AX

    LEA DX, MSG
    MOV AH, 09H
    INT 21H

    MOV AH, 4CH
    INT 21H
CODE ENDS
END START
