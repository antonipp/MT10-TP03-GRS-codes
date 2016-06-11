def f(n):
    '''Calcule phi(n) avec la formule d'inversion de Möbius'''
    s = 0
    for d in divisors(n):
       s += moebius(n/d) * d
    return s

def irr(p, n):
    '''Calcule le nombre de polynomes unitaires irreductibles de degre n dans Fp'''
    s = 0
    for d in divisors(n) :
        s = s + moebius(n/d)*(p**d)
    s = s * (1/n)
    return s

def affichage_irr():
    '''Affichage pour la question 3'''
    s = 0
    for p in [2, 3, 5]:
        for i in range(1,11):
            print 'Nombre de polynomes unitaires irreductibles de degre {1} dans F{0}: {2}'.format(p, i, irr(p,i))        

def polysF2(n):
  '''Trouve tous les polynomes irreductibles de degre <= n dans F2'''
  F2 = GF(2)
  R = F2.polynomial_ring()
  P = R.polynomials(max_degree = n)
  for p in P:
    if p.is_irreducible():
      print p
    



