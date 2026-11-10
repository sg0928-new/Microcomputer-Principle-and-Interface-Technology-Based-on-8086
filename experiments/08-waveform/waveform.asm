; ============================================================
; waveform.asm
; Experiment 08: sine wave generator using DAC0832
; Output port 30CH. 32-point lookup table, unipolar offset.
; ============================================================

DATA SEGMENT
    ; 32-point sine table, offset to 128 with amplitude 127
    SINTAB DB 128,153,177,199,218,234,245,253
           DB 255,253,245,234,218,199,177,153
           DB 128,103,79,57,38,22,11,3
           DB 1,3,11,22,38,57,79,103
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
    MOV AX, DATA
    MOV DS, AX

LOOP_OUT:
    MOV BX, 0
NEXT_PT:
    MOV AL, SINTAB[BX]
    MOV DX, 30CH
    OUT DX, AL             ; convert one point
    INC BX
    CMP BX, 32
    JNZ NEXT_PT
    JMP LOOP_OUT
CODE ENDS
END START
