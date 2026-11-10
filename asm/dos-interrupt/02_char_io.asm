; ============================================================
; 02_char_io.asm
; Purpose: read one key (AH=01H) and echo it back (AH=02H)
; ============================================================

DATA SEGMENT
    PROMPT DB 'Press a key: $'
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
    MOV AX, DATA
    MOV DS, AX

    LEA DX, PROMPT
    MOV AH, 09H
    INT 21H

    MOV AH, 01H
    INT 21H             ; AL = typed character

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H             ; new line

    MOV DL, AL
    MOV AH, 02H
    INT 21H             ; echo the character

    MOV AH, 4CH
    INT 21H
CODE ENDS
END START
