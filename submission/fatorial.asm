@ /0000
START   LD N        ; Carrega valor de N
        JZ SET_ONE  ; Se N=0, pula para SET_ONE
        LV ONE      ; Inicializa resultado com 1
        MM RES      ; Armazena resultado inicial
        
LOOP    LD N        ; Carrega N atual
        SB ONE      ; Subtrai 1
        MM TEMP     ; Armazena N-1 temporariamente
        LD RES      ; Carrega resultado atual
        ML N        ; Multiplica pelo N atual
        MM RES      ; Atualiza resultado
        LD TEMP     ; Carrega N-1
        MM N        ; Atualiza N
        JZ HALT     ; Se chegou a 0, finaliza
        JP LOOP     ; Repete o loop

SET_ONE LV ONE      ; Caso especial N=0
        MM RES      ; Define resultado como 1
        JP HALT     ; Para execução

HALT    HM =0       ; Para execução

@ /100 
N       K =0        ; N armazenado no endereço 100
RES     K =1        ; RES armazenado no endereço 102
TEMP    K =0        ; Variável temporária
ONE     K =1        ; Valor constante 1