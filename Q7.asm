#o limite do intervalo de 0-15 eh 16, que corresponde ao valor 327 no reg de leitura
#o limite do intervalo de 15-20 eh 21, que corresponde ao valor 429 no reg de leitura
#o limite do intervalo de 20-25 eh 26, que corresponde ao valor 531 no reg de leitura
#o limite do intervalo de 25-30 eh 31, que corresponde ao valor 634 no reg de leitura
#o limite do intervalo de 30-35 eh 36, que corresponde ao valor 736 no reg de leitura
#acima de 736 eh o ultimo caso

#sobre a pinagem:
#vermelho-esquerda: Pin 8 binario: 000001 dec: 1
#vermelho-direita: Pin 9  binario: 000010 dec: 2
#amarelo-esquerda: Pin 10 binario: 000100 dec: 4
#amarelo-direita: Pin 11  binario: 001000 dec: 8
#verde-esquerda: Pin 12   binario: 010000 dec: 16
#verde-direita: Pin 13    binario: 100000 dec: 32

lw x11,c1 #passando as constantes de comparaçao pros regs
lw x12,c2
lw x13,c3
lw x14,c4
lw x15,c5

loop:
    lb x10, 0(x0) # "parametros" para ler o que esta em A0 no arduino
    sb x10,1030(x0) 

    lh x10,1031(x0) #lendo o valor da temperatura
    blt x10,x11,case1
    blt x10,x12,case2
    blt x10,x13,case3
    blt x10,x14,case4
    blt x10,x15,case5

    #se chegar nessa linha eh porque eh o ultimo caso
    lb x20,145(x0)                            #carregando para x20 o valor decimal que indica qual led sera aceso/apagado
    sb x20,1027(x0)                           #carregando para a porta do arduino esse valor para que o led seja aceso ou apagado
    jal x0,loop

    #mesma logica
    case1:                                     
        lb x20,144(x0)
        sb x20,1027(x0)
        jal x0,loop
        
    case2:
        lb x20,146(x0)
        sb x20,1027(x0)
        jal x0,loop

    case3:
        lb x20,147(x0)
        sb x20,1027(x0)
        jal x0,loop
    
    case4:
        lb x20,148(x0)
        sb x20,1027(x0)
        jal x0,loop

    case5:
        lb x20,149(x0)
        sb x20,1027(x0)
        jal x0,loop

#constantes para comparaçao
c1: .word 327
c2: .word 429
c3: .word 531
c4: .word 634
c5: .word 736

#Constantes decimais para acender os leds
pin8: .byte 1 
pin9: .byte 2
pin10: .byte 4
pin11: .byte 8
pin12: .byte 16
pin13: .byte 32

