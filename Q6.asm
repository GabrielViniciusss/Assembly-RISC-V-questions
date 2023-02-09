lw x1,fat1 #registradores que vao salvar os fatoriais de 1 a 9 (o de 0 é igual ao de 1)
lw x2,fat2
lw x3,fat3
lw x4,fat4
lw x5,fat5
lw x6,fat6
lw x7,fat7
lw x8,fat8
lw x9,fat9

addi x10,x0,-48 #constantes de conversao
addi x17,x0,48

addi x23,x0,3  #constantes de comparacao
addi x24,x0,4
addi x25,x0,5
addi x26,x0,6
addi x27,x0,7
addi x28,x0,8
addi x29,x0,9

addi x21,x0,13 # ENTER ascii

loop:                           
    lb x18,1025(x0)                
    beq x18,x21,end             #caso o byte atual seja ENTER, podemos printar o resultado final
    add x18,x18,x10             #convertendo para decimal
	
	#cada byte contribuira com seu fatorial que ja esta salvo nos reg de x1 a x9
    beq x18,x0,fatorial1        
    beq x18,x1,fatorial1
    beq x18,x2,fatorial2
    beq x18,x23,fatorial3   
    beq x18,x24,fatorial4
    beq x18,x25,fatorial5
    beq x18,x26,fatorial6
    beq x18,x27,fatorial7
    beq x18,x28,fatorial8
    beq x18,x29,fatorial9

	#somando o valor atual de x20 com o fatorial do byte atual(x20 salvara o valor final)
    fatorial1:                  
        add x20,x1,x20
        jal x0,loop

    fatorial2:                  
        add x20,x2,x20
        jal x0,loop

    fatorial3:
        add x20,x3,x20
        jal x0,loop

    fatorial4:
        add x20,x4,x20
        jal x0,loop

    fatorial5:
        add x20,x5,x20
        jal x0,loop

    fatorial6:
        add x20,x6,x20
        jal x0,loop

    fatorial7:
        add x20,x7,x20
        jal x0,loop

    fatorial8:
        add x20,x8,x20
        jal x0,loop

    fatorial9:
        add x20,x9,x20
        jal x0,loop
  
	#carregando as constantes para decompor o numero (o maximo seria 2.177.280 que advem da entrada '999999')
    end:
        lw x11,c1   
		lw x12,c2
		lw x13,c3
		lw x14,c4
		lw x15,c5
		lw x16,c6

        lw x2,c7
		lw x3,c8
		lw x4,c9
		lw x5,c10
		lw x6,c11
		lw x7,c12

        addi x1,x0,0 #loop counter que sera printado a cada label de digito
        addi x9,x0,1 #incrementador

        sb x21,1024(x0) #printando uma quebra de linha

        firstDigit:
            blt x20,x11,print1 #enquanto for maior ou igual extraimos a casa decimal
            add x20,x20,x2 #subtraindo a casa numerica atual
            add x1,x1,x9   #aumentando contador que sera printado
            jal x0,firstDigit
       
        print1:
            add x1,x1,x17 #convertendo para ascii
            sb x1,1024(x0)
            add x1,x0,x0 #zerando pro proximo loop
		
		#mesma logica pros demais abaixo
        secondDigit:
            blt x20,x12,print2
            add x20,x20,x3 
            add x1,x1,x9   
            jal x0,secondDigit
        
        print2:
            add x1,x1,x17 
            sb x1,1024(x0)
            add x1,x0,x0 

        thirdDigit:
            blt x20,x13,print3
            add x20,x20,x4 
            add x1,x1,x9  
            jal x0,thirdDigit
        
        print3:
            add x1,x1,x17 
            sb x1,1024(x0)
            add x1,x0,x0 

        fourthDigit:
            blt x20,x14,print4
            add x20,x20,x5 
            add x1,x1,x9   
            jal x0,fourthDigit
        
        print4:
            add x1,x1,x17 
            sb x1,1024(x0)
            add x1,x0,x0 

        fifthDigit:
            blt x20,x15,print5
            add x20,x20,x6 
            add x1,x1,x9   
            jal x0,fifthDigit

        print5:
            add x1,x1,x17 
            sb x1,1024(x0)
            add x1,x0,x0 

        sixthDigit:
            blt x20,x16,print6
            add x20,x20,x7 
            add x1,x1,x9   
            jal x0,sixthDigit
        
        print6:
            add x1,x1,x17 
            sb x1,1024(x0)
            add x1,x0,x0 
		
		#o ultimo digito sera o que sobrou em x20
        seventhDigit: 
            add x20,x20,x17 
            sb x20,1024(x0)
            halt

#algumas constantes que serao utilizadas para decompor o numero e salvar fatoriais, como alguns sao numeros grandes 'addi' nao funcionava e tive que criar .words
fat1: .word 1 
fat2: .word 2
fat3: .word 6
fat4: .word 24
fat5: .word 120
fat6: .word 720
fat7: .word 5040
fat8: .word 40320
fat9: .word 362880

result: .word 0

c1: .word 1000000
c2: .word 100000
c3:	.word 10000
c4:	.word 1000
c5:	.word 100
c6:	.word 10
c7: .word -1000000
c8: .word -100000
c9:	.word -10000
c10: .word -1000
c11: .word -100
c12: .word -10
