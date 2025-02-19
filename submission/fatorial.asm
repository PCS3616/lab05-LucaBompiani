; Função fatorial
; Entrada: N (armazenado em 0x0100)
; Saída: RES (armazenado em 0x0102)
; (Lembre-se: a memória para as variáveis – N, RES e para o stack pointer (0x00FF) – 
; já é considerada disponível; não use ORG e DW, apenas os endereços)

        LD 0100        ; Carrega N no acumulador
        JZ f_base      ; Se N == 0, pula para o caso base (retorna 1)
        SC f_rec       ; Chama a subrotina fatorial recursiva
        MM 0102       ; Armazena o resultado em RES
        HM            ; Termina o programa

f_base:
        LV 0001       ; Caso base: carrega 1 no acumulador
        MM 0102       ; Armazena 1 em RES
        HM            ; Termina

; Subrotina fatorial recursiva
f_rec:
        ; Empilha o endereço de retorno
        MM 00FF
        AD 0001
        MM 00FF

        ; Empilha o valor de N
        LD 0100
        MM 00FF
        AD 0001
        MM 00FF

        ; Calcula N - 1 e atualiza N
        LD 0100
        SB 0001
        MM 0100

        ; Chamada recursiva para fatorial(N-1)
        JZ f_rec_base
        SC f_rec

        ; Desempilha o valor original de N
        LD 00FF
        SB 0001
        MM 00FF
        LD 00FF

        ; Multiplica o resultado da chamada recursiva por N
        ML 0102
        MM 0102

        ; Desempilha o endereço de retorno e retorna
        LD 00FF
        SB 0001
        MM 00FF
        RS 00FF

f_rec_base:
        ; Caso especial da recursão (N-1 == 0)
        LV 0001
        MM 0102
        ; Desempilha o valor original de N
        LD 00FF
        SB 0001
        MM 00FF
        LD 00FF

        ; Desempilha o endereço de retorno e retorna
        LD 00FF
        SB 0001
        MM 00FF
        RS 00FF 