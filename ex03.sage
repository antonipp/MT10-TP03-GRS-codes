load("ex02.sage")
load("ex03fonctions.sage")

r = n - k

S = syndrome(yp, a, v)
sigma, omega = clef(S)
e = erreur(sigma, omega, a, v)

#corriger les erreurs:
yc = [i-j for i, j in zip(yp, e)]
print y==yc