def syndrome(yp, a, v):
    '''Calcule le polynome syndrome'''
    S = R.zero()
    for i in range(n):
        L = Li(i, a)
        S += yp[i]/(v[i] * L(a[i])) * sum([(a[i] * X)**j for j in range(r)])
    return S

def clef(S):
    '''Trouve les polynomes localisateur et evaluateur'''
    rr = [X**r, S]
    u = [R.one(), R.zero()]
    v = [R.zero(), R.one()]
    q = [R.zero()]
    j = 1
    while rr[j].degree() >= r/2:
        q.append(rr[j-1] // rr[j])
        rr.append(rr[j-1] % rr[j])
        u.append(u[j-1] - u[j]*q[j])
        v.append(v[j-1] - v[j]*q[j])
        j += 1
    sigmat = v[j]
    omegat = rr[j]

    return sigmat/sigmat(0), omegat/sigmat(0)

def erreur(sigma, omega, a, v):
    #ui = 1/(vi Li(ai))
    e = [0]*n
    B = [sigma(1/a[b]) == 0 for b in range(n)]

    for b, i in enumerate(B):
        if i == True:
            L = Li(b, a)
            e[b] = -a[b] * omega(1/a[b]) * v[b] * L(a[b]) * 1/sigma.derivative()(1/a[b])
    return e