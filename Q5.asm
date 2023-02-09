#salvando o ASCII das letras 
addi x1,x0,65 
addi x2,x0,66
addi x3,x0,67
addi x4,x0,68
addi x5,x0,69
addi x6,x0,70
addi x7,x0,71
addi x8,x0,72
addi x9,x0,73
addi x10,x0,74
addi x11,x0,75
addi x12,x0,76
addi x13,x0,77
addi x14,x0,78
addi x15,x0,79
addi x16,x0,80
addi x17,x0,81
addi x18,x0,82
addi x19,x0,83
addi x20,x0,84
addi x21,x0,85
addi x22,x0,86
addi x23,x0,87
addi x24,x0,88
addi x25,x0,89
addi x26,x0,90
addi x28,x0,32 #<SPACE> ascii 
addi x29,x0,13 #<ENTER> ascii

add x30,x0,x0 #reg jogador 1
add x31,x0,x0 #reg jogador 2

#as string serao do tipo string1 string2

loop:
    lb x27, 1025(x0) 

    beq x27,x28,endString1 #caso seja espaço, a string1 acabou
    beq x27,x29,end         # se for enter o input das duas strings acabou

    #grupos do que valem 1
    beq x27,x1,firstGroup 
    beq x27,x5,firstGroup
    beq x27,x9,firstGroup
    beq x27,x15,firstGroup
    beq x27,x21,firstGroup

    #grupos do que valem 3
    beq x27,x4,secondGroup 
    beq x27,x7,secondGroup
    beq x27,x20,secondGroup

    #grupos do que valem 5
    beq x27,x2,thirdGroup 
    beq x27,x3,thirdGroup 
    beq x27,x13,thirdGroup 
    beq x27,x14,thirdGroup 
    beq x27,x16,thirdGroup 

    #grupos do que valem 4
    beq x27,x6,fourthGroup 
    beq x27,x8,fourthGroup
    beq x27,x22,fourthGroup
    beq x27,x23,fourthGroup
    beq x27,x25,fourthGroup

    #grupos do que valem 2
    beq x27,x11,fifthGroup 
    beq x27,x18,fifthGroup 
    beq x27,x19,fifthGroup

    #grupos do que valem 6
    beq x27,x10,sixthGroup 
    beq x27,x12,sixthGroup 
    beq x27,x24,sixthGroup

    #grupos do que valem 9
    beq x27,x17,seventhGroup 
    beq x27,x26,seventhGroup

    firstGroup:
        add x27,x0,x0 #zerando x27 para usa-lo como auxiliar
        addi x27,x0,1 #pontuação do grupo

        add x31,x27,x31 #somando a pontuaçao atual do jogador com a pontuaçao do gpp
        add x27,x0,x0   #zerando x27 pro proximo loop
        jal x0,loop
    
    #mesma logica para os outros grupos
    secondGroup:
        add x27,x0,x0 
        addi x27,x0,3 

        add x31,x27,x31 
        add x27,x0,x0 
        jal x0,loop

    thirdGroup:
        add x27,x0,x0 
        addi x27,x0,5 

        add x31,x27,x31 
        add x27,x0,x0 
        jal x0,loop

    fourthGroup:
        add x27,x0,x0 
        addi x27,x0,4 

        add x31,x27,x31 
        add x27,x0,x0 
        jal x0,loop

    fifthGroup:
        add x27,x0,x0 
        addi x27,x0,2 

        add x31,x27,x31 
        add x27,x0,x0 
        jal x0,loop

    sixthGroup:
        add x27,x0,x0 
        addi x27,x0,6 

        add x31,x27,x31 
        add x27,x0,x0 
        jal x0,loop

    seventhGroup:
        add x27,x0,x0 
        addi x27,x0,9 

        add x31,x27,x31 
        add x27,x0,x0 
        jal x0,loop

    endString1:
        add x30,x31,x0 #passando pro jogador 1 sua pontuaçao
        add x31,x0,x0  #zerando o reg do jogador2 para entrar na sua vez
        jal x0,loop

    #sera printado 'P1 P2 e depois da quebra de linha sera printado 1 ou 2 para indicar quem ganhou,player 1 ou player 2, caso empate 0'
    end:
        addi x2,x0,2 #auxiliares
        addi x5,x0,0 
        addi x6,x0,1 
        addi x7,x0,-10 
        addi x8,x0,13 
        addi x9,x0,32 
        addi x10,x0,10 
        addi x11,x0,48 

        add x12,x0,x30 #save player1
        add x13,x0,x31 #save player2

        sb x8,1024(x0)  #printando uma quebra de linha

            loop1:                          
                blt x30,x10,printPlayer1 #quantas vezes consigo tirar 10 do numero? sera sua dezena, sobrara apenas sua unidade no reg de origem 
                add x30,x30,x7  
                add x5,x5,x6             #incrementando contador que sera printado
                jal x0,loop1

            printPlayer1:
                add x5,x5,x11       #convertendo para ascii correspondente
                add x30,x30,x11

                sb x5,1024(x0)      #dezena
                sb x30,1024(x0)     #unidade
                sb x9,1024(x0)      #espaço
                
                add x5,x0,x0        #zerando contador
            
            #mesma logica do anterior
            loop2:
                blt x31,x10,printPlayer2
                add x31,x31,x7
                add x5,x5,x6 
                jal x0,loop2

            printPlayer2:
                add x5,x5,x11 
                add x31,x31,x11

                sb x5,1024(x0) 
                sb x31,1024(x0) 
                sb x8,1024(x0) #\n

            printWinner:
                beq x12,x13,printEqual #se forem igual é empate e printa 0
                blt x12,x13,print2     # se o primeiro for menor o player2 ganhou e printa 2
                                       #caso contrario, player1 ganhou e printa 1
                print1:
                    add x6,x6,x11 
                    sb x6,1024(x0)
                    halt

                print2:
                    add x2,x2,x11 
                    sb x2,1024(x0)
                    halt

                printEqual:
                    add x15,x0,x11 
                    sb x15, 1024(x0)
                    halt