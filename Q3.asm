lw x10,c1 # carregando o valor de teste para x10
addi x11,x0,15 # pode-se testar com qualquer valor aq

slli x9,x10,16 # [8][8][target][8], dando sl de 16 ficamos: [target][8][0][0] , dando um sr de 24 ficamos: [0][0][0][target]
srai x8,x9,24  # logo, os 8bits de x10 que nos importa estara guardado em x8 na forma: [0][0][0][target]
slli x7,x8,24  # para ficar da forma [target][0][0][0] precisamos de um sl de 24 em x8, vou colocar em x7

# precisamos chegar em [0][x][y][z], onde x,y,z sao bits originais de x11
# originalmente x11 esta: [k][x][y][z]
slli x6,x11,8 # x6 vai ficar da forma: [x][y][z][0]
srai x5,x6,8  # agora x5 vai esta da forma que queremos: [0][x][y][z]

# para chegar no valor final que x11 devera ter apenas somamos x5 com x7: [target][0][0][0] + [0][x][y][z] = [target][x][y][z]
add x11,x5,x7

c1: .word 4087 # pode-se testar com qualquer valor aqui