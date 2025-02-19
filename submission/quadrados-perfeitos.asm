; Calcula os quadrados perfeitos dos 64 primeiros números naturais
; e armazena-os na memória a partir do endereço 0x0100.
; Aqui usamos os endereços:
;   0x0010 -> contador n
;   0x0011 -> acumulador (soma que equivale a n²)
;   0x0013 -> endereço de escrita calculado (destino para cada quadrado)
;   0x0040 -> constante 64 (0x0040)
;   0x0100 -> endereço base para armazenamento dos quadrados

        LV 0000        ; Inicializa o contador (n = 0)
        MM 0010        ; Armazena em 0x0010
        LV 0000        ; Inicializa a soma = 0
        MM 0011        ; Armazena em 0x0011

LOOP:
        LD 0010        ; Carrega o contador n
        JZ INI         ; Se n == 0, vai para o caso inicial
        JP CONT        ; Caso contrário, vai para processamento

INI:
        LV 0000
        MM 0100        ; Para n = 0, 0² = 0 é armazenado em 0x0100
        JP NEXT

CONT:
        ; Calcula 2n + 1 e atualiza a soma para obter n²
        LD 0010        ; Carrega n
        AD 0010        ; Multiplica por 2: 2*n
        AD 0001        ; Soma 1: 2n + 1
        AD 0011        ; Soma anterior + (2n + 1)
        MM 0011        ; Atualiza soma (que equivale a n²)

        ; Calcula o endereço de armazenamento: endereço = 0x0100 + 2*n
        LD 0010        ; Carrega n
        AD 0010        ; duplica -> 2*n
        AD 0100        ; soma com a base 0x0100
        MM 0013        ; Armazena o endereço calculado em 0x0013

        ; Armazena o quadrado (conteúdo de soma)
        LD 0011
        MM 0013

NEXT:
        ; Incrementa o contador n
        LD 0010
        AD 0001
        MM 0010

        ; Verifica se n < 64 (valor 0x0040)
        LD 0010
        SB 0040
        JN LOOP        ; Se n - 64 < 0, continua o loop
        JP END         ; Caso contrário, termina

END:
        HM             ; Termina o programa 