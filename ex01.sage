load("ex01fonctions.sage")

#Q1
p = 2
n = 6
F2 = GF(p)
R = F2.polynomial_ring()
prod = R.one() #utilisé pour le produit
for d in divisors(n):
  for pol in R.polynomials(of_degree = d):
    if pol.is_irreducible() and pol.is_monic(): # si irreductible et unitaire
      prod *= pol

pol = R(x^(p**n) - x)
print 'Resultat Question 1: {}'.format(prod == pol) #comparer le polynome obtenu avec X^q - X

#Q2.1
test = True
for i in range(1, 100):
    if moebius(i) not in [-1, 0, 1]:
        test = False
print 'Resultat Question 2.1: {}'.format(test)

#Q2.2
test = True
for i in range(2, 100):
    if sum(map(moebius, divisors(i))) != 0:
      test = False
print 'Resultat Question 2.2: {}'.format(test)

#Q2.3
print 'Resultat Question 2.3: phi(100) avec Sage = {0}, phi(100) avec formule d\'inversion de Möbius = {1}'.format(euler_phi(100), f(100))

#Q3
print 'Resultat Question 3: Utilisez la fonction affichage_irr()'

#Q4
print 'Resultat Question 4: Utilisez la fonction polysF2(10)'