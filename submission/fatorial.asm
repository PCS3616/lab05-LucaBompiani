START:  LD 0100        ; Load N value into AC
        JZ SET_ONE     ; If N is 0, jump to set result to 1
        LV 0001        ; Initialize result with 1
        MM 0102        ; Store initial result
        
LOOP:   LD 0100           ; Load current N value
        SB 0001         ; Subtract 1 from N
        MM 0000        ; Store N-1 in temporary variable
        LD 0102         ; Load current result
        ML 0100         ; Multiply by current N value
        MM 0102         ; Update result
        LD 0000        ; Load N-1 value
        MM 0100        ; Update N to N-1
        JZ HALT        ; If N reached 0, halt
        JP LOOP        ; Continue factorial calculation

SET_ONE: 
        LV 0001        ; Handle special case N=0
        MM 0102        ; Set result to 1

HALT:   HM             ; Stop execution