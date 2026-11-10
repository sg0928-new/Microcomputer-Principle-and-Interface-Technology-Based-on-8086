; ============================================================
; quiz_buzzer.asm
; Experiment 04: 4x4 matrix keypad quiz lock
; Hardware: PA (output) drives rows, PC (input) reads columns
; Ports: 300H PA, 302H PC, 303H control.
; Control word: 88H (PA mode0 out, PC mode0 in)
; ============================================================

CODE SEGMENT
ASSUME CS:CODE
START:
    MOV DX, 303H
    MOV AL, 88H
    OUT DX, AL

SCAN:
    MOV BL, 0FEH               ; row pattern, one row low
    MOV BH, 0                  ; row index
ROW:
    MOV AL, BL
    MOV DX, 300H
    OUT DX, AL                ; drive one row

    MOV DX, 302H
    IN  AL, DX                ; read columns
    AND AL, 0FH
    CMP AL, 0FH
    JNZ KEY_FOUND             ; a column is low -> pressed

    ROL BL, 1
    INC BH
    CMP BH, 4
    JNZ ROW
    JMP SCAN

KEY_FOUND:
    ; AL column bits, BH row index
    ; lock and output key code on PB (301H)
    MOV DX, 301H
    MOV AL, BH
    OUT DX, AL                ; show row code (demo)
WAIT_RELEASE:
    MOV DX, 302H
    IN  AL, DX
    AND AL, 0FH
    CMP AL, 0FH
    JNZ WAIT_RELEASE          ; wait until key released
    JMP SCAN
CODE ENDS
END START
