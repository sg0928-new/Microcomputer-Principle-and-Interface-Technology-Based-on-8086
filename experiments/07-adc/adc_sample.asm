; ============================================================
; adc_sample.asm
; Experiment 07: ADC0808 voltage acquisition
; Start/channel port 310H, data port 311H.
; Result is also output to 8255 PA (300H) for LED bar.
; ============================================================

CODE SEGMENT
ASSUME CS:CODE
START:
    ; 8255 PA output for LED bar
    MOV DX, 303H
    MOV AL, 80H
    OUT DX, AL

LOOP_SAMPLE:
    ; select channel IN0 and start conversion
    MOV DX, 310H
    XOR AL, AL
    OUT DX, AL

    ; fixed delay to wait for conversion (about 100us)
    MOV CX, 2000
WAIT_C:
    LOOP WAIT_C

    ; read digital result
    MOV DX, 311H
    IN  AL, DX

    ; show on LED bar
    MOV DX, 300H
    OUT DX, AL

    JMP LOOP_SAMPLE
CODE ENDS
END START
