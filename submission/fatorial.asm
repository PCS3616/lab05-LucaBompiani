START:  LD N           ; Load N value into AC
        JZ SET_ONE     ; If N is 0, jump to set result to 1
        LV 1           ; Initialize result with 1
        MM RES         ; Store initial result
        
LOOP:   LD N           ; Load current N value
        SB ONE         ; Subtract 1 from N
        MM TEMP        ; Store N-1 in temporary variable
        LD RES         ; Load current result
        ML N           ; Multiply by current N value
        MM RES         ; Update result
        LD TEMP        ; Load N-1 value
        MM N           ; Update N to N-1
        JZ HALT        ; If N reached 0, halt
        JP LOOP        ; Continue factorial calculation

SET_ONE: LV 1          ; Handle special case N=0
        MM RES         ; Set result to 1

HALT:   HM             ; Stop execution

ONE:    DW 1           ; Constant value 1
TEMP:   DW 0           ; Temporary storage for N-1

N       EQU 0x100      ; Input number address
RES     EQU 0x102      ; Result storage address