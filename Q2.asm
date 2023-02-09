#a,b,c,x sao variaveis na memoria

addi x9,x0,32  # <SPACE> ascii
addi x10,x0,13 # <ENTER> ascii
addi x20,x0,0 #loop counter
addi x21,x0,1 # incrementador
addi x23,x0,0 # variavel counter
addi x24,x0,2 # constante para comparação
addi x13,x0,62# constante para comparaçao
addi x8,x0,-48 # constante pra conversao em dc
addi x7,x0,9 # constante para controle do loop de multiplicaçao por 10
addi x24,x0,15# constante 15 para terminar o programa (numero de loops)
addi x28,x0,48 #constante para conversao
add x25,x0,x0 # variavel que vai de 0 ate 15 para controlar quantos loops gerais deve ter

loop:
    lb x12,1025(x0)  
    sb x12,1024(x0)

    beq x12,x9,variavelCounter # variaveis de entrada vao ser do tipo "a b c", se ler um SPACE é pq uma variavel acabou
    beq x12,x10,end1 # se for ENTER o programa deve printar o valor de x e seguir pro prox conjunto de variaveis
    beq x25,x24,end2 # se x25 for 15, o programa ja leu 15 sequencias de "a b c" e deve terminar

    add x12,x12,x8 # convertendo para decimal o byte lido
    
    #obs! x23 é o contador de variaveis, loop counter vai ser sempre 9 depois da primeiro byte da variavel atual

    mult:
        addi x22,x0,0 # auxiliar
        add x26,x0,x15# salvando valor atual de x15

        adding:
            beq x22,x20,endMult # se forem iguais (caso inicial) apenas somamos valor atual do regVar(0) com o valor de x12
            add x15,x15,x26       #precisamos, a cada novo byte lido, multiplicar o valor do regVar por 10 e somar com o novo byte por ex: "68" = 6 * 10 + 8 
            add x22,x22,x21
            jal x11,adding    # enquanto for menor voltamos pro loop
        
        endMult:
            add x15,x15,x12
            jal x11,mult10

end1:
    add x18,x0,x0 # assumi que x vai ser 0 a principio

    blt x15,x24,end # c é menor ou igual que 15? se sim vai pro end e printa x=0 (o mais correto seria usar 'ble', mas compsim nao aceita)
    blt x16,x0,end# a é menor que 0?se sim vai pro end e printa x=0         
    bge x17,x13,end# b é maior que 62? se sim vai pro end e printa x=0           (o mais correto seria usar 'bgt', mas compsim nao aceita)

    addi x18,x0,1 # se chegar aqui é pq todas as condiçoes sao verdadeiras e sera printado x = 1

    end:
        sw x15,c     # salvando as variaveis na memoria
        sw x16,a
        sw x17,b
        sb x18, 248(x0) #endereço de x no compsim

        add x18,x18,x28 # convertendo pro caractere correspondente em ASCII

        sb x18,1024(x0) #printando no monitor o valor de x
        add x25,x25,x21 # incrementando variavel que controlara o numero de loops totais (15)

        add x20,x0,x0   # zerando loop counter interno
        add x23,x0,x0 #zerando o contador de variaveis
        add x15,x0,x0 #zerando x15
        jal x11,loop

end2:
    halt

variavelCounter:
    beq x23,x0,var1 # se for 0 é a primeira variavel acabou
    beq x23,x21,var2 # se for 1 a segunda variavel acabou
    beq x0,x0,endVar  #var3 ficará em x15 (c), se nao for nem 1 nem 0 é a ultima variavel

    var1:
        add x16,x15,x0 #var1 ficara em x16 (a)
        add x15,x0,x0 #zerando x15
        jal x0,endVar
    var2:
        add x17,x15,x0 #var2 ficara em x17 (b)
        add x15,x0,x0 #zerando x15
        jal x0,endVar

    endVar:
        add x23,x23,x21 #aumentando o contador de variaveis
        addi x20,x0,0 # zerando o loop counter para proxima variavel
        jal x11,loop

mult10:
    beq x20,x0,firstTime # se for a primeira vez(for 0) ,apenas devemos somar com 9
    beq x0,x0,endMult10

    firstTime:
        add x20,x7,x20  # setando x20 para 9, para controlar o loop de multiplicaçao
         
    endMult10:
        jal x11,loop
        
#reservando espaço na memoria para as variaveis
a: .word 0
b: .word 0
c: .word 0
x: .byte 0