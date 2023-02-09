addi x12,x0,65 #salvando o ASCII das vogais (maisculas e minusculas)
addi x13,x0,69
addi x14,x0,73
addi x15,x0,79
addi x16,x0,85
addi x17,x0,97
addi x18,x0,101
addi x19,x0,105
addi x20,x0,111
addi x21,x0,117

add x9,x0,x0 # zerando o contador de consoantes
addi x8,x0,1 # incrementador, vale 1
addi x22,x0,13 # <ENTER> ascii para parada, indica que a palavra terminou
addi x23,x0,32 # <SPACE> ascii

loop:
    lb x10,1025(x0)         #lendo 1 bytes (1 caractere) do buffer do teclado
    beq x10,x22,end1        #verificando se o usuario clicou ENTER, se sim devemos printar o numero de consoantes da palavra q ele digitou e o programa termina
    beq x10,x23,loop        #se for espaço pulamos pro prox byte

    beq x10,x12,notConsonant
    beq x10,x13,notConsonant
    beq x10,x14,notConsonant
    beq x10,x15,notConsonant
    beq x10,x16,notConsonant #se for alguma vogal apenas voltamos pro loop para pegar a prox
    beq x10,x17,notConsonant
    beq x10,x18,notConsonant
    beq x10,x19,notConsonant
    beq x10,x20,notConsonant
    beq x10,x21,notConsonant

    add x9,x9,x8 #incrementando contador de consoantes

notConsonant:
    jal x11,loop

end1:
    addi x25,x0,10 #constantes para extrair a dezena
    addi x26,x0,-10
    add x2,x0,x0 #contador

    firstDigit: 
        blt x9,x25,end2  # enquanto o contador de consoante nao for menor que 10, extraimos a dezena
        add x2,x2,x8     # incrementando contador
        add x9,x9,x26    # subtraindo 10 do contador de consoante
        jal x0, firstDigit 

    end2:
        addi x2,x2,48 #para printar o ascii correspondente
        addi x9,x9,48 

        sb x2,1024(x0) # dezena
        sb x9,1024(x0) # unidade, oq sobrar em x9 ja sera a unidade
        halt