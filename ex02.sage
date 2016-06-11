load("ex02fonctions.sage")

q = 2**5
Fq = GF(q, name='a')
R.<X> = Fq['X']
C = Fq.list() #caracteres

n, k = 3, 3

x = [C[9], C[20], C[11]] #message

#Generation de v
v = []
for i in range(n):
    v.append(C[randint(1, len(C)-1)])

#Generation de a
a = []
for i in range(n):
    c = C[randint(0, len(C))]
    while c in a:
        c = C[randint(0, len(C)-1)] #generer un element unique
    a.append(c)

y = codeGRS(x, v, a)
x2 = decodeGRS(y, v, a)

