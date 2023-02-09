#a,b,m variaveis na memoria

lw x9,a # carregando para reg x9 valor de a
lw x10,b #  carregando para reg x10 valor de b

beq x9,x10, end1 #no codigo da questao m recebe o valor de antes para fazer a comparaçao com b, mas podemos comparar direto a e b que nao havera mudança na reposta final do codigo
sub x11,x9,x10   # se o conteudo de x9 e x10 forem diferente entra aqui (x11 = x9 - x10)
beq x0,x0,end2

end1: sub x11,x10,x9 #caso contrario, vem para ca(x11 = x10 - x9)
end2: sw x11,m             # colocando o valor final de m na memoria onde essa variavel ta guardada no fim do codigo

halt #fim do codigo

#Inicialmente m = a (nao importa tanto pra reposta final)

#Caso teste 1
a: .word 5
b: .word 9
m: .word 5

#Caso teste 2
a: .word 10
b: .word 10
m: .word 10

#Caso teste 3
a: .word 15
b: .word 7
m: .word 15