def syndrome(yp, a, v):
    '''Calcule le polynome syndrome'''
    S = R.zero()
    for i in range(n):
        L = Li(i, a)
        S += yp[i]/(v[i] * L(a[i])) * sum([(a[i] * X)**j for j in range(r)])
    return S