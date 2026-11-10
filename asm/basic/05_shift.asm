; ============================================================
; 05_shift.asm
; Purpose: SHL / SHR / SAR and multi-bit shift via CL
; Debug focus: AL / AX and CF after each shift
; ============================================================

DATA SEGMENT
    V DB 02H
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
    MOV AX, DATA
    MOV DS, AX

    MOV AL, V
    SHL AL, 1           ; 02H -> 04H (multiply by 2)

    MOV AX, 0001H
    MOV CL, 3
    SHL AX, CL          ; 1 -> 8 (multiply by 8)

    MOV AL, 80H
    SAR AL, 1           ; arithmetic shift keeps sign -> C0H

    MOV AL, 81H
    ROL AL, 1           ; rotate left -> 03H, CF=1

    MOV AH, 4CH
    INT 21H
CODE ENDS
END START
