#-------------------------------------------------
#-------------------------------------------------
#2018 Code written by Agnese Barbensi and Daniele Celoria
#-------------------------------------------------
#-------------------------------------------------
#This program produces all grids diagrams representing 
#knots within a given range of grid numbers,
#applies all hooked juxtapositions and outputs the types
#of knots obtained
#-------------------------------------------------
#-------------------------------------------------

#-------------------------------------------------
#given a grid, outputs the determinant of the knot represented
def determinante(n,X,O):   
    matrice = Matrix(n)
    M = Matrix(n)
    matrice[n-1,0] = 0
    matrice[0,n-1] =0
    for a in range(1,n):
        for b in range(1,n):
            for k in range(b):
                matrice[a-1,b-1] = matrice[a-1,b-1] +  contenuto(n,a,b,k,X,O)
    for t in range(n):
        for s in range(n):
            M[t,s] = (-1)^(abs(matrice[t,s]))
    det = abs(M.determinant()/(2^(len(X)-1)))
    return det
#-------------------------------------------------    
#auxiliary function for determinante(): checks if the markers are contained in certain intervals
def contenuto(n,a,b,k,X,O):
    valoreO = 0
    valoreX = 0   
    for i in range(n):        
        if X[i] == k:
            valoreX = i
    for j in range(n):
        if O[j] == k:
            valoreO = j
    if valoreO + 1/2 > a and a > valoreX + 1/2:
        return -1        
    if valoreO + 1/2 < a and a< valoreX + 1/2:
        return 1
    else:
        return 0 
#-------------------------------------------------
#given a pair of permutations representing a knot produces the rotation of the grid
def ruota(A):
    Ar = []
    for i in range(len(A)):
        Ar.append(len(A) - A.index(i) - 1)

    return Ar
#-------------------------------------------------
#checks if a pair of permutations produces a valid grid
def amIvalid(S1,S2,n):
    flag=0
    for i in range(1,n+1):
        if flag ==0 and S1(i) == S2(i):
            flag=1
    return flag
#----------------------------------------------------
#draws the gordian graph associated with the data collected before
def DrawGraph(grafo, nominodi):
    Mnew = Matrix(len(nominodi))
    for i in range(len(nominodi)):
        for j in range(len(nominodi)):
            if grafo[i][j] !=0 and i != j:
                Mnew[i,j]=1
    G = Graph(Mnew)
    for g in G.edges():
        if g[0] != g[1]:
            G.set_edge_label(g[0],g[1],grafo[g[0],g[1]])
    G.relabel({0:'0_1',1:'3_1',2:'4_1',3:'5_1',4:'5_2',5:'6_1',6:'6_2',7:'6_3',8:'other'})
    for v in range(len(nominodi)):
        if G.degree(nominodi[v])==0:
            G.delete_vertices([nominodi[v]])
    show(G.plot(edge_labels=True,figsize=8,vertex_size=500,vertex_color = '#9955bb'))
#----------------------------------------------------
#implements (interleaving) column commutation. it simply tilts the grid and applies a row commutation
def commutacolonne(A,B,level,i):
    AA1 = []
    BB1 = []
    for a in range(len(A)):
        AA1.append(len(A) -1 -A.index(a))
        BB1.append(len(A) -1 -B.index(a))
    return commutarighe(AA1,BB1,level,i)
#----------------------------------------------------
#implements (interleaving) row commutation
def commutarighe(A,B,level,i):
    flag = 0
    if A[level+1] < A[level] <B[level+1]<B[level] and B[level+1] - A[level] == i:
        if B.index(A[level+1]) > level + 1 and B.index(A[level]) > level and A.index(B[level+1]) < level +1 and  A.index(B[level]) > level:
            flag = 1   
        if B.index(A[level+1]) > level + 1 and B.index(A[level]) > level and A.index(B[level+1]) < level +1 and  A.index(B[level]) < level:
            flag = 1
        if B.index(A[level+1]) < level + 1 and B.index(A[level]) > level and A.index(B[level+1]) < level +1 and  A.index(B[level]) > level:
            flag = 1   
        if B.index(A[level+1]) < level + 1 and B.index(A[level]) > level and A.index(B[level+1]) < level +1 and  A.index(B[level]) < level:
            flag = 1    
        if flag ==0:
            return 1
    if A[level] < A[level+1] <B[level]<B[level+1] and B[level] - A[level +1] == i:
        if B.index(A[level]) > level  and B.index(A[level+1]) < level + 1  and A.index(B[level]) > level  and  A.index(B[level +1]) > level +1:
            flag = 1
        if B.index(A[level]) > level  and B.index(A[level+1]) < level + 1  and A.index(B[level]) > level  and  A.index(B[level +1]) < level +1:
            flag = 1
        if B.index(A[level]) < level  and B.index(A[level+1]) < level + 1  and A.index(B[level]) > level  and  A.index(B[level +1]) > level +1:
            flag = 1
        if B.index(A[level]) < level  and B.index(A[level+1]) < level + 1  and A.index(B[level]) > level  and  A.index(B[level +1]) < level +1:
            flag = 1
        if flag ==0:
            return 1
    if A[level] < B[level+1] <B[level]<A[level+1] and B[level] - B[level +1] == i:
        if B.index(A[level]) > level  and A.index(B[level+1]) < level + 1  and A.index(B[level]) > level  and  B.index(A[level +1]) > level +1:
            flag = 1
        if B.index(A[level]) > level  and A.index(B[level+1]) < level + 1  and A.index(B[level]) > level  and  B.index(A[level +1]) < level +1:
            flag = 1
        if B.index(A[level]) < level  and A.index(B[level+1]) < level + 1  and A.index(B[level]) > level  and  B.index(A[level +1]) > level +1:
            flag = 1
        if B.index(A[level]) < level  and A.index(B[level+1]) < level + 1  and A.index(B[level]) > level  and  B.index(A[level +1]) < level +1:
            flag = 1
        if flag ==0:
            return 1
    if B[level+1] < A[level] <A[level+1]<B[level] and A[level+1] - A[level] == i:
        if A.index(B[level+1]) > level + 1 and B.index(A[level]) > level and B.index(A[level+1]) < level +1 and  A.index(B[level]) > level:
            flag = 1           
        if A.index(B[level+1]) > level + 1 and B.index(A[level]) > level and B.index(A[level+1]) < level +1 and  A.index(B[level]) < level:
            flag = 1         
        if A.index(B[level+1]) < level + 1 and B.index(A[level]) > level and B.index(A[level+1]) < level +1 and  A.index(B[level]) > level:
            flag = 1          
        if B.index(B[level+1]) < level + 1 and B.index(A[level]) > level and B.index(A[level+1]) < level +1 and  A.index(B[level]) < level:
            flag = 1
        if flag ==0:
            return 1
    if A[level+1] < B[level] <B[level+1]<A[level] and B[level+1] - B[level] == i:
        if B.index(A[level+1]) > level + 1 and A.index(B[level]) > level and A.index(B[level+1]) < level +1 and  B.index(A[level]) > level:
            flag = 1           
        if B.index(A[level+1]) > level + 1 and A.index(B[level]) > level and A.index(B[level+1]) < level +1 and  B.index(A[level]) < level:
            flag = 1
        if B.index(A[level+1]) < level + 1 and A.index(B[level]) > level and A.index(B[level+1]) < level +1 and  B.index(A[level]) > level:
            flag = 1           
        if B.index(A[level+1]) < level + 1 and A.index(B[level]) > level and A.index(B[level+1]) < level +1 and  B.index(A[level]) < level:
            flag = 1
        if flag ==0:
            return 1
    if B[level] < A[level+1] <A[level]<B[level+1] and A[level] - A[level +1] == i:
        if A.index(B[level]) > level  and B.index(A[level+1]) < level + 1  and B.index(A[level]) > level  and  A.index(B[level +1]) > level +1:
            flag = 1        
        if A.index(B[level]) > level  and B.index(A[level+1]) < level + 1  and B.index(A[level]) > level  and  A.index(B[level +1]) < level +1:
            flag = 1     
        if A.index(B[level]) < level  and B.index(A[level+1]) < level + 1  and B.index(A[level]) > level  and  A.index(B[level +1]) > level +1:
            flag = 1
        if A.index(B[level]) < level  and B.index(A[level+1]) < level + 1  and B.index(A[level]) > level  and  A.index(B[level +1]) < level +1:
            flag = 1      
        if flag ==0:
            return 1
    if B[level] < B[level+1] <A[level]<A[level+1] and A[level] - B[level +1] == i:
        if A.index(B[level]) > level  and A.index(B[level+1]) < level + 1  and B.index(A[level]) > level  and  B.index(A[level +1]) > level +1:
            flag = 1      
        if A.index(B[level]) > level  and A.index(B[level+1]) < level + 1  and B.index(A[level]) > level  and  B.index(A[level +1]) < level +1:
            flag = 1      
        if A.index(B[level]) < level  and A.index(B[level+1]) < level + 1  and B.index(A[level]) > level  and  B.index(A[level +1]) > level +1:
            flag = 1
        if A.index(B[level]) < level  and A.index(B[level+1]) < level + 1  and B.index(A[level]) > level  and  B.index(A[level +1]) < level +1:
            flag = 1
        if flag ==0:
            return 1
    if B[level+1] < B[level] <A[level+1]<A[level] and A[level+1] - B[level] == i:
        if A.index(B[level+1]) > level + 1 and A.index(B[level]) > level and B.index(A[level+1]) < level +1 and  B.index(A[level]) > level:
            flag = 1      
        if A.index(B[level+1]) > level + 1 and A.index(B[level]) > level and B.index(A[level+1]) < level +1 and  B.index(A[level]) < level:
            flag = 1              
        if A.index(B[level+1]) < level + 1 and A.index(B[level]) > level and B.index(A[level+1]) < level +1 and  B.index(A[level]) > level:
            flag = 1    
        if B.index(B[level+1]) < level + 1 and A.index(B[level]) > level and B.index(A[level+1]) < level +1 and  B.index(A[level]) < level:
            flag = 1
        if flag ==0:
            return 1
    if flag == 1:
        A1=[]
        B1=[]
        for ll in range(len(A)):
            if ll == level:
                A1.append(A[ll+1])
                B1.append(B[ll+1])
            if ll == level+1:
                A1.append(A[ll-1])
                B1.append(B[ll-1])
            if ll != level and ll != level+1:
                A1.append(A[ll])
                B1.append(B[ll])
        return tellmetheknot(A1,B1)[0]
    return 0
#----------------------------------------------------
#tells if a pair of permutations produces a connected grid (i.e. a knot)
def numerocomponenti(S1,S2,n):
    VAR = S1*S2^(-1)
    componenti = len(VAR.cycle_tuples())
    if componenti == 1:
        return 1
    else:
        return 0
#----------------------------------------------------
#returns the number given the name of the knot, according to the enumeration in the array NAMES
def numero(s):
    for i in range(len(NAMES)):
        if s == NAMES[i]:
            return i
#----------------------------------------------------
#counts the number of crossings (=braid generators) in the l-th row of the braid diagram associated to a grid
def containcroci(A,B,l):
    crossings = 0
    if abs(A[l] - B[l]) == 1:
        return 0
    if A[l]<B[l]:
        for t in range(len(A)):
            if t != l:
                if A[l] < A[t] < B[l]:
                    if t<l:
                        if B.index(A[t]) > l or B.index(A[t])< t:
                            crossings = crossings+1
                    if t>l:
                        if l < B.index(A[t]) < t:
                            crossings = crossings+1
    if B[l]<A[l]:
        for t in range(len(A)):
            if t != l:
                if B[l] < A[t] < A[l]:
                    if t<l:
                        if B.index(A[t]) > l or B.index(A[t])< t:
                            crossings = crossings+1
                    if t>l:
                        if l < B.index(A[t]) < t:
                            crossings = crossings+1
    return crossings
#-------------------------------------------
#given a n-tuple outputs the position where it takes a given value
def tellmewhere(A,x):
    aux = -1
    for d in range(len(A)):
        if A[d] == x:
            return d
#----------------------------------------------------
#counts the number of strands passing on the left of crossings in the braid diagram associated to a grid
def strandsontheleft(A,B,l):
    strands = 0
    if A[l]<B[l]:
        for t in range(len(A)):
            if t != l:
                if A[t] < A[l]:
                    if t<l:
                        if B.index(A[t]) > l or B.index(A[t])< t:
                            strands = strands+1
                    if t>l:
                        if l < B.index(A[t]) < t:
                            strands = strands+1
    if A[l]>B[l]:
        for t in range(len(A)):
            if t != l:
                if A[t] < B[l]:
                    if t<l:
                        if B.index(A[t]) > l or B.index(A[t])< t:
                            strands = strands+1
                    if t>l:
                        if l < B.index(A[t]) < t:
                            strands = strands+1
    return strands
#----------------------------------------------------
#computes the braid index of the braid diagram associated to a grid
def howmanystrands(A,B):
    counter = 0
    for q in range(len(A)):
        if A.index(q)>B.index(q):
            counter = counter+1
    return counter
#----------------------------------------------------
#given a grid, produces a braid (given by an array keeping track of the generators) with the same underlying knot type
def converttobraid(A,B):
    treccia = []
    for l in range(len(A)):
        if A[l] < B[l]:
            ausiliaria = containcroci(A,B,l)
            if ausiliaria != 0:
                gens = []
                temp=[]
                for s in range(ausiliaria):
                    temp.append(s+1+strandsontheleft(A,B,l))
                gens = gens+ temp[::-1]
                treccia= treccia + gens
        if A[l] > B[l]:
            ausiliaria = containcroci(A,B,l)
            if ausiliaria > 0:
                gens = []
                for s in range(ausiliaria):
                    gens.append(-(s+1+strandsontheleft(A,B,l)))
                treccia= treccia + gens
    return treccia
#----------------------------------------------------
#given a grid for a knot, it tells if the grid represents on of the knots up to 6 crossings, and outputs the name (as in the array "NAMES" below), and the Alexander polynomial
def tellmetheknot(X,O):
    if howmanystrands(X,O) == 1:
        return ['0_1', 1]
    treccia1 = converttobraid(X,O)
    brind = max([abs(r) for r in treccia1])
    Br = BraidGroup(brind+1)
    trecciaaux = Br(treccia1)
    nodoaux = Knot(trecciaaux)
    poly = trecciaaux.alexander_polynomial()
    if nodoaux.determinant() == 1:
        if poly == 1:
            if trecciaaux.jones_polynomial() == 1:
                return ['0_1',1]
            else:
                print 'qui',trecciaaux,X,O,
                return 'other'
        else:
            print poly, X,O, nodoaux.jones_polynomial()
            return ['other', 0]
    if nodoaux.determinant() == 3:
        if poly == t^-2 - t^-1 + 1:
            return ['3_1', poly]
        else:
            print poly, X,O
            return ['other', 0]
    if nodoaux.determinant() == 5:
        if nodoaux.signature() == 0 and poly == t^-2 - 3*t^-1 + 1:
            return ['4_1', poly]
        if abs(nodoaux.signature()) == 4 and poly == t^-4 - t^-3 + t^-2 - t^-1 + 1:
            return ['5_1', poly]
        else:
            print poly, X,O
            return ['other', 0]
    if nodoaux.determinant() == 7:
        if poly == 2*t^-2 - 3*t^-1 + 2:
            return ['5_2', poly]
        else:
            print poly, X,O
            return ['other', 0]
    if nodoaux.determinant() == 9:
        if poly == 2*t^-2 - 5*t^-1 + 2 and trecciaaux.jones_polynomial() == t^4 - t^3 + t^2 - 2*t - 1/t + 1/t^2 + 2:
            return ['6_1', poly]
        else:
            print poly, X,O
            return ['other', 0]
    if nodoaux.determinant() == 11:
        if poly == t^-4 - 3*t^-3 + 3*t^-2 - 3*t^-1 + 1:
            return ['6_2', poly]
        else:
            print poly, X,O
            return ['other', 0]
    if nodoaux.determinant() == 13:
        if poly == t^-4 - 3*t^-3 + 5*t^-2 - 3*t^-1 + 1 and trecciaaux.jones_polynomial() == -t^3 + 2*t^2 - 2*t - 2/t + 2/t^2 - 1/t^3 + 3:
            return ['6_3', poly]
        else:
            print poly, X,O
            return ['other', 0]
    print 'other!', trecciaaux,'meh'
    return ['other', 0]
#----------------------------------------------------
#----------------------------------------------------
#----------------------------------------------------
#----------------------------------------------------

class schedagriglia(object):
    def __init__(self,x,o,name, conta):
        self.x=None
        self.o = None
        self.name = None
        self.conta = 0
        
#----------------------------------------------------
#this is the main function: it creates the list of all admissible grids, fills in their respective slots (following the indications of the class "schedagriglia"), and computes the relevant data. The variable "Upperlimit" controls the dimensions of the grids sampled. In the current version 7 <= GN <= Upperlimit.

def GordianGrid():
    ListaNodi = 9*[0]
    enne =0
    print 'computing:',
    for N in range(7,Upperlimit):
        M = N-3
        GordianHOOKED = M*[0]
        for i in range(0,M):
            GordianHOOKED[i] = Matrix(9)
        G = SymmetricGroup(N)
        for i in range(factorial(N)):
            for j in range(factorial(N)):
                if amIvalid(G[i],G[-j-1],N) == 0:
                    if numerocomponenti(G[i],G[-j-1],N) == 1:
                        X = list(G[i].tuple())
                        O = list(G[-j-1].tuple())
                        X = [ics -1 for ics in X]
                        O = [oo-1 for oo in O]
                        dummie  = schedagriglia(None,None,None,None)
                        dummie.x = X
                        dummie.o = O
                        X1 = ruota(X)
                        O1 = ruota(O)
                        X2 = ruota(X1)
                        O2 = ruota(O1)
                        X3 = ruota(X2)
                        O3 = ruota(O2)
                        flag = 0
                        for elaux in Longgridlist:
                            if elaux.o == X and elaux.x == O or elaux.x == X1 and elaux.o == O1 or   elaux.x == O1 and elaux.o == X1 or elaux.x == X2 and elaux.o == O2 or   elaux.x == O2 and elaux.o == X2 or elaux.x == X3 and elaux.o == O3 or   elaux.x == O3 and elaux.o == X3:
                                flag=1
                                break
                        if flag == 0:
                            vettoreaux = tellmetheknot(X,O)
                            enne = enne + 1
                            dummie.name = vettoreaux[0]
                            Longgridlist.append(dummie)
                            if X1 != X or O1 !=O:
                                if X1 != O or O1 !=X:
                                    dummie.conta = dummie.conta+1
                            if X2 != X or O2 !=O:
                                if X2 != O or O2 !=X:
                                    if X2 != O1 or O2 !=X1:
                                        if X2 != X1 or O2 !=O1:
                                            dummie.conta = dummie.conta+1
                            if X3 != X or O3 !=O:
                                if X3 != O or O3 !=X:
                                    if X3 != O1 or O3 !=X1:
                                        if X3 != X1 or O3 !=O1:
                                             if X3 != O2 or O3 !=X2:
                                                if X3 != X2 or O3 !=O2:
                                                    dummie.conta = dummie.conta+1 
                            if mod(enne,1000)==0:
                                print ';',
    totalcounter = 0
    print '\n', enne
    print 'reading data:',
    scarti = 0
    for el in Longgridlist:
        totalcounter = totalcounter +1 + el.conta
        if el.name == '0_1':
            knottypes[0] = knottypes[0]+1 + el.conta
        if el.name == '3_1':
            knottypes[1] = knottypes[1]+1 + el.conta
        if el.name == '4_1':
            knottypes[2] = knottypes[2]+1 + el.conta
        if el.name == '5_1':
            knottypes[3] = knottypes[3]+1 + el.conta
        if el.name == '5_2':
            knottypes[4] = knottypes[4]+1 + el.conta
        if el.name == '6_1':
            knottypes[5] = knottypes[5]+1 + el.conta
        if el.name == '6_2':
            knottypes[6] = knottypes[6]+1 + el.conta
        if el.name == '6_3':
            knottypes[7] = knottypes[7]+1 + el.conta
        if el.name == 'other':
            knottypes[8] = knottypes[8]+1 + el.conta
        if el.name not in NAMES:
            print 'wut', el.x, el.o
        if mod(totalcounter,500)==0:
            print '.',
        for n in range(len(el.x)-1):
            for i in range(1,M+1):
                riscomm = commutacolonne(el.x,el.o,n,i)
                riscol = commutarighe(el.x,el.o,n,i)
                if riscomm != 0 and riscomm != 1:
                    GordianHOOKED[i-1][numero(el.name),numero(riscomm)] = GordianHOOKED[i-1][numero(el.name),numero(riscomm)]+1 + el.conta
                if riscomm == 1:
                   scarti = scarti +1
                if riscol != 0 and riscol != 1:
                    GordianHOOKED[i-1][numero(el.name),numero(riscol)] = GordianHOOKED[i-1][numero(el.name),numero(riscol)]+1 + el.conta
                if riscol == 1:
                    scarti = scarti +1
    for i in range(1,M):
        GordianHOOKED[i] = GordianHOOKED[i-1] + GordianHOOKED[i]
    print '\n Gordian Matrix for GN in %d' %Upperlimit
    for i in range(0,M):
       print  GordianHOOKED[i], '\n'
    print 'Total number of knots = ',totalcounter, scarti

Upperlimit = 8
import time
start_time = time.time()

Longgridlist = []
t = var('t')
knottypes = [0]*9
NAMES = ['0_1','3_1','4_1','5_1','5_2','6_1','6_2','6_3','other']
GordianGrid()
for i in range(len(NAMES)):
    if knottypes[i]!=0:
        pretty_print(html('<p> $%s$ = %d</p>' %(NAMES[i],knottypes[i])))


print "My program took", time.time() - start_time, "to run"
