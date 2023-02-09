#sobre a pinagem:
#pino8 sera a
#pino9 sera b
#pino10 sera c
#pino11 sera d
#pino12 sera e
#pino13 sera f
#pino2 sera g (PortD)

#numero0 -> PortB: 111111 , PortD: 000000 decimal:63
#numero1 -> PortB: 000110 , PortD: 000000 decimal:6
#numero2 -> PortB: 011011 , PortD: 000001 decimal:27 decimalPortD:1
#numero3 -> PortB: 001111 , PortD: 000001 decimal:15 decimalPortD:1
#numero4 -> PortB: 100110 , PortD: 000001 decimal:38 decimalPortD:1
#numero5 -> PortB: 101101 , PortD: 000001 decimal:45 decimalPortD:1
#numero6 -> PortB: 111101 , PortD: 000001 decimal:61 decimalPortD:1
#numero7 -> PortB: 000111 , PortD: 000000 decimal:7
#numero8 -> PortB: 111111 , PortD: 000001 decimal:63 decimalPortD:1
#numero9 -> PortB: 101111 , PortD: 000001 decimal:47 decimalPortD:1

#constantes uteis
addi x8,x0,48   #'0'
addi x1,x0,-48  #conversao  
addi x3,x0,4
addi x4,x0,1
addi x5,x0,2
addi x6,x0,8
addi x7,x0,3
addi x9,x0,5
addi x12,x0,6
addi x13,x0,7
addi x14,x0,9

add x15,x0,x0 #vai salvar o numero final
add x2,x0,x0 #zerando contador

loop:
    lb x10,1025(x0)
    beq x2,x3,print #ja rodou 4 vezes
    beq x2,x0,firstDigit
    beq x2,x4,secondDigit
    beq x2,x5,thirdDigit
    beq x2,x7,fourthDigit

    firstDigit:

        beq x10,x8,endFirst        #se for 0 nao fazemos nada
        add x15,x15,x6             #se nao for 0 é 1 entao somamos 2 elevado a 3 no reg que salva o valor
                         
        endFirst:
            add x2,x2,x4
            jal x0,loop

    #mesma logica acima
    secondDigit:

        beq x10,x8,endSecond
        add x15,x15,x3

        endSecond:
            add x2,x2,x4
            jal x0,loop

    thirdDigit:
        beq x10,x8,endThird
        add x15,x15,x5

        endThird:
            add x2,x2,x4
            jal x0,loop

    fourthDigit:

        beq x10,x8,endFourth
        add x15,x15,x4

        endFourth:
            add x2,x2,x4
            jal x0,loop

#printar o numero escolhido no display
print:
    beq x15,x0,number0 #verificando qual numero devera ser printado
    beq x15,x4,number1
    beq x15,x5,number2
    beq x15,x7,number3
    beq x15,x3,number4
    beq x15,x9,number5
    beq x15,x12,number6
    beq x15,x13,number7
    beq x15,x6,number8
    beq x15,x14,number9

    #se nao for nenhum numero de 0 a 9, é displayOff
    DisplayOff:
        lb x20,410(x0)     #carregando valor do decimal correspondente para PortB
        sb x20,1027(x0)  #acende os segmentos corretos do PortB

        lb x21,410(x0)     #carregando valor do decimal correspondente para PortD
        sb x21,1029(x0)  #acende os segmentos corretos do decimal PortD
        halt
        
    number0:
        lb x20,400(x0)     #carregando valor do decimal correspondente para PortB
        sb x20,1027(x0)  #acende os segmentos corretos do PortB

        lb x21,410(x0)     #carregando valor do decimal correspondente para PortD
        sb x21,1029(x0)  #acende os segmentos corretos do decimal PortD
        halt

    number1:
        lb x20,401(x0)     #carregando valor do decimal correspondente para PortB
        sb x20,1027(x0)  #acende os segmentos corretos do PortB

        lb x21,410(x0)     #carregando valor do decimal correspondente para PortD
        sb x21,1029(x0)  #acende os segmentos corretos do decimal PortD
        halt   

    number2:
        lb x20,402(x0)     #carregando valor do decimal correspondente para PortB
        sb x20,1027(x0)  #acende os segmentos corretos do PortB

        lb x21,409(x0)     #carregando valor do decimal correspondente para PortD
        sb x21,1029(x0)  #acende os segmentos corretos do decimal PortD
        halt

    number3:
        lb x20,403(x0)     #carregando valor do decimal correspondente para PortB
        sb x20,1027(x0)  #acende os segmentos corretos do PortB

        lb x21,409(x0)     #carregando valor do decimal correspondente para PortD
        sb x21,1029(x0)  #acende os segmentos corretos do decimal PortD
        halt

    number4:
        lb x20,404(x0)     #carregando valor do decimal correspondente para PortB
        sb x20,1027(x0)  #acende os segmentos corretos do PortB

        lb x21,409(x0)     #carregando valor do decimal correspondente para PortD
        sb x21,1029(x0)  #acende os segmentos corretos do decimal PortD
        halt

    number5:
        lb x20,405(x0)     #carregando valor do decimal correspondente para PortB
        sb x20,1027(x0)  #acende os segmentos corretos do PortB

        lb x21,409(x0)     #carregando valor do decimal correspondente para PortD
        sb x21,1029(x0)  #acende os segmentos corretos do decimal PortD
        halt

    number6:
        lb x20,406(x0)     #carregando valor do decimal correspondente para PortB
        sb x20,1027(x0)  #acende os segmentos corretos do PortB

        lb x21,409(x0)     #carregando valor do decimal correspondente para PortD
        sb x21,1029(x0)  #acende os segmentos corretos do decimal PortD
        halt

    number7:
        lb x20,407(x0)     #carregando valor do decimal correspondente para PortB
        sb x20,1027(x0)  #acende os segmentos corretos do PortB

        lb x21,410(x0)     #carregando valor do decimal correspondente para PortD
        sb x21,1029(x0)  #acende os segmentos corretos do decimal PortD
        halt

    number8:
        lb x20,400(x0)     #carregando valor do decimal correspondente para PortB
        sb x20,1027(x0)  #acende os segmentos corretos do PortB

        lb x21,409(x0)     #carregando valor do decimal correspondente para PortD
        sb x21,1029(x0)  #acende os segmentos corretos do decimal PortD
        halt

    number9:
        lb x20,408(x0)     #carregando valor do decimal correspondente para PortB
        sb x20,1027(x0)  #acende os segmentos corretos do PortB

        lb x21,409(x0)     #carregando valor do decimal correspondente para PortD
        sb x21,1029(x0)  #acende os segmentos corretos do decimal PortD
        halt

#constantes que irao ajudar a acender o segmento correto
c1: .byte 63 #400
c2: .byte 6  #401
c3: .byte 27 #402
c4: .byte 15 #403
c5: .byte 38 #404
c6: .byte 45 #405
c7: .byte 61 #406
c8: .byte 7 #407
c9: .byte 47 #408
c10: .byte 1 #409
c11: .byte 0 #410

