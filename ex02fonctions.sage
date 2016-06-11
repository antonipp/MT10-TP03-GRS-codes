def codeGRS(x, v, a):
    '''Encode le message x avec le code GRS'''
    f = R.zero()
    for i in range(k):
        f += x[i] * X**i #les coefficients du polynome sont les lettres du message
    return [i*f(j) for i, j in zip(v, a)] #ev(f)

def decodeGRS(y, v, a):
    '''Decode le message y encodé avec GRS'''
    temp = [i/j for i, j in zip(y, v)]
    points = [(i,j) for i,j in zip(a,temp)] #les points sur lesquels interpoler
    f = R.lagrange_polynomial(points) #interpolation en utilisant les polynomes de Lagrange
    return f.coefficients() #on retrouve les coefficients du polynome