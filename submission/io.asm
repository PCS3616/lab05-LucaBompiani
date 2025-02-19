        ; Lê os dois números (formato: <x-d1><x-d2> <y-d1><y-d2>)
        GD 0001       ; Lê do dispositivo de entrada (teclado)
        MM 0010       ; Armazena em 0x0010 (x)
        GD 0001
        MM 0011       ; Armazena em 0x0011 (y)

        ; Converte de código ASCII para valor numérico subtraindo 0x3030
        LD 0010       ; Carrega x
        SB 3030       ; Subtrai 0x3030
        MM 0010       ; Atualiza x

        LD 0011       ; Carrega y
        SB 3030       ; Subtrai 0x3030
        MM 0011       ; Atualiza y

        ; Soma os valores de x e y
        LD 0010
        AD 0011
        MM 0012

        ; Verifica se o dígito menos significativo é >= A (0x000A)
        LD 0012
        SB 000A
        JN VAIUM
        JP CONTINUA

VAIUM:
        ; Realiza o "vai um" ajustando a soma
        LD 0012
        SB 000A
        AD 0100
        MM 0012

CONTINUA:
        ; Reconverte para código ASCII (soma com 0x3030)
        LD 0012
        AD 3030
        MM 0012

        ; Imprime o resultado usando o dispositivo de saída (monitor em 0x0002)
        LD 0012
        PD 0002
        HM

ORG 0001
    DW 0001 ;Teclado
    DW 0002 ;Monitor
ORG 000A
    DW 000A
ORG 0010
    DW 0000 ;x
    DW 0000 ;y
    DW 0000 ;soma
ORG 0100
    DW 0100
ORG 3030
    DW 3030 