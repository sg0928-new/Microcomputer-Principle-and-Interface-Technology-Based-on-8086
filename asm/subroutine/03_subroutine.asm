; ============================================================
; 03_subroutine.asm
; Purpose: define a PROC subroutine and call it twice
; ============================================================

DATA SEGMENT
    MSG DB 'Beep! $'
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
    MOV AX, DATA
    MOV DS, AX

    CALL SHOW
    CALL DELAY
    CALL SHOW

    MOV AH, 4CH
    INT 21H

; ---- print message ----
SHOW PROC
    PUSH AX
    PUSH DX
    LEA DX, MSG
    MOV AH, 09H
    INT 21H
    POP DX
    POP AX
    RET
SHOW ENDP

; ---- simple software delay ----
DELAY PROC
    PUSH CX
    MOV CX, 0FFFFH
D1:
    LOOP D1
    POP CX
    RET
DELAY ENDP
CODE ENDS
END START
