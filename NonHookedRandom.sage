#-------------------------------------------------
#-------------------------------------------------
#2018 Code written by Agnese Barbensi and Daniele Celoria
#-------------------------------------------------
#-------------------------------------------------
#This program produces a random set of grid diagrams representing 
#knots, applies all possible hooked juxtapositions and outputs the 
#types of knots obtained.
#-------------------------------------------------
#-------------------------------------------------

#-------------------------------------------------
#implements (interleaving) column commutation at hooked juxtapositions. It simply tilts the grid and applies a row commutation
def commutacolonneHOOKED(A,B,level,length):
    AA1 = []
    BB1 = []
    for a in range(len(A)):
        AA1.append(len(A) -1 -tellmewhere(A,a))
        BB1.append(len(A) -1 -tellmewhere(B,a))
    return commutarigheHOOKED(AA1,BB1,level,length)
#--------------------------------------------------------------------------------------------------
#implements (interleaving) row commutation at hooked juxtaposition
def commutarigheHOOKED(A,B,level,length):
    flag = 0
    if A[level+1] < A[level] <B[level+1]<B[level] and B[level+1] - A[level] == length:
        if B.index(A[level+1]) > level + 1 and B.index(A[level]) > level and A.index(B[level+1]) < level +1 and  A.index(B[level]) > level:
            flag = 1   
        if B.index(A[level+1]) > level + 1 and B.index(A[level]) > level and A.index(B[level+1]) < level +1 and  A.index(B[level]) < level:
            flag = 1
        if B.index(A[level+1]) < level + 1 and B.index(A[level]) > level and A.index(B[level+1]) < level +1 and  A.index(B[level]) > level:
            flag = 1              
        if B.index(A[level+1]) < level + 1 and B.index(A[level]) > level and A.index(B[level+1]) < level +1 and  A.index(B[level]) < level:
            flag = 1    
    if A[level] < A[level+1] <B[level]<B[level+1] and B[level] - A[level +1] == length:    
        if B.index(A[level]) > level  and B.index(A[level+1]) < level + 1  and A.index(B[level]) > level  and  A.index(B[level +1]) > level +1:
            flag = 1    
        if B.index(A[level]) > level  and B.index(A[level+1]) < level + 1  and A.index(B[level]) > level  and  A.index(B[level +1]) < level +1:
            flag = 1
        if B.index(A[level]) < level  and B.index(A[level+1]) < level + 1  and A.index(B[level]) > level  and  A.index(B[level +1]) > level +1:
            flag = 1
        if B.index(A[level]) < level  and B.index(A[level+1]) < level + 1  and A.index(B[level]) > level  and  A.index(B[level +1]) < level +1:
            flag = 1        
    if A[level] < B[level+1] <B[level]<A[level+1] and B[level] - B[level +1] == length: 
        if B.index(A[level]) > level  and A.index(B[level+1]) < level + 1  and A.index(B[level]) > level  and  B.index(A[level +1]) > level +1:
            flag = 1
        if B.index(A[level]) > level  and A.index(B[level+1]) < level + 1  and A.index(B[level]) > level  and  B.index(A[level +1]) < level +1:
            flag = 1
        if B.index(A[level]) < level  and A.index(B[level+1]) < level + 1  and A.index(B[level]) > level  and  B.index(A[level +1]) > level +1:
            flag = 1
        if B.index(A[level]) < level  and A.index(B[level+1]) < level + 1  and A.index(B[level]) > level  and  B.index(A[level +1]) < level +1:
            flag = 1
    if B[level+1] < A[level] <A[level+1]<B[level] and A[level+1] - A[level] == length:
        if A.index(B[level+1]) > level + 1 and B.index(A[level]) > level and B.index(A[level+1]) < level +1 and  A.index(B[level]) > level:
            flag = 1           
        if A.index(B[level+1]) > level + 1 and B.index(A[level]) > level and B.index(A[level+1]) < level +1 and  A.index(B[level]) < level:
            flag = 1         
        if A.index(B[level+1]) < level + 1 and B.index(A[level]) > level and B.index(A[level+1]) < level +1 and  A.index(B[level]) > level:
            flag = 1          
        if B.index(B[level+1]) < level + 1 and B.index(A[level]) > level and B.index(A[level+1]) < level +1 and  A.index(B[level]) < level:
            flag = 1
    if A[level+1] < B[level] <B[level+1]<A[level] and B[level+1] - B[level] == length:
        if B.index(A[level+1]) > level + 1 and A.index(B[level]) > level and A.index(B[level+1]) < level +1 and  B.index(A[level]) > level:
            flag = 1           
        if B.index(A[level+1]) > level + 1 and A.index(B[level]) > level and A.index(B[level+1]) < level +1 and  B.index(A[level]) < level:
            flag = 1         
        if B.index(A[level+1]) < level + 1 and A.index(B[level]) > level and A.index(B[level+1]) < level +1 and  B.index(A[level]) > level:
            flag = 1           
        if B.index(A[level+1]) < level + 1 and A.index(B[level]) > level and A.index(B[level+1]) < level +1 and  B.index(A[level]) < level:
            flag = 1
    if B[level] < A[level+1] <A[level]<B[level+1] and A[level] - A[level +1] == length:
        if A.index(B[level]) > level  and B.index(A[level+1]) < level + 1  and B.index(A[level]) > level  and  A.index(B[level +1]) > level +1:
            flag = 1
        if A.index(B[level]) > level  and B.index(A[level+1]) < level + 1  and B.index(A[level]) > level  and  A.index(B[level +1]) < level +1:
            flag = 1
        if A.index(B[level]) < level  and B.index(A[level+1]) < level + 1  and B.index(A[level]) > level  and  A.index(B[level +1]) > level +1:
            flag = 1
        if A.index(B[level]) < level  and B.index(A[level+1]) < level + 1  and B.index(A[level]) > level  and  A.index(B[level +1]) < level +1:
            flag = 1   
    if B[level] < B[level+1] <A[level]<A[level+1] and A[level] - B[level +1] == length: 
        if A.index(B[level]) > level  and A.index(B[level+1]) < level + 1  and B.index(A[level]) > level  and  B.index(A[level +1]) > level +1:
            flag = 1
        if A.index(B[level]) > level  and A.index(B[level+1]) < level + 1  and B.index(A[level]) > level  and  B.index(A[level +1]) < level +1:
            flag = 1
        if A.index(B[level]) < level  and A.index(B[level+1]) < level + 1  and B.index(A[level]) > level  and  B.index(A[level +1]) > level +1:
            flag = 1
        if A.index(B[level]) < level  and A.index(B[level+1]) < level + 1  and B.index(A[level]) > level  and  B.index(A[level +1]) < level +1:
            flag = 1
    if B[level+1] < B[level] <A[level+1]<A[level] and A[level+1] - B[level] == length:
        if A.index(B[level+1]) > level + 1 and A.index(B[level]) > level and B.index(A[level+1]) < level +1 and  B.index(A[level]) > level:
            flag = 1           
        if A.index(B[level+1]) > level + 1 and A.index(B[level]) > level and B.index(A[level+1]) < level +1 and  B.index(A[level]) < level:
            flag = 1         
        if A.index(B[level+1]) < level + 1 and A.index(B[level]) > level and B.index(A[level+1]) < level +1 and  B.index(A[level]) > level:
            flag = 1           
        if B.index(B[level+1]) < level + 1 and A.index(B[level]) > level and B.index(A[level+1]) < level +1 and  B.index(A[level]) < level:
            flag = 1
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
        return [tellmetheknot(A1,B1)[0], A1,B1]
    return [0,0,0]

#----------------------------------------------------
#implements (interleaving) row commutation.
def commutarighe(A,B,level):
    if A[level+1] < A[level] <B[level+1]<B[level] or A[level] < A[level+1] <B[level]<B[level+1] or A[level] < B[level+1] <B[level]<A[level+1] or B[level+1] < A[level] <A[level+1]<B[level] or A[level+1] < B[level] <B[level+1]<A[level] or B[level] < A[level+1] <A[level]<B[level+1] or B[level] < B[level+1] <A[level]<A[level+1] or B[level+1] < B[level] <A[level+1]<A[level]:
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
        return [tellmetheknot(A1,B1)[0], A1,B1]
    return [0,0,0]
#-------------------------------------------------------------
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
#--------------------------------------------------------------
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
#--------------------------------------------------------------------------------------------------
#given a pair of permutations representing a knot produces the rotation of the grid
def ruota(A):
    Ar = []
    for i in range(len(A)):
        Ar.append(len(A) - A.index(i) - 1)
    return Ar
#--------------------------------------------------------------------------------------------------
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
#implements (interleaving) column commutation. It simply tilts the grid and applies a row commutation
def commutacolonne(A,B,level):
    AA1 = []
    BB1 = []
    for a in range(len(A)):
        AA1.append(len(A) -1 -tellmewhere(A,a))
        BB1.append(len(A) -1 -tellmewhere(B,a))
    return commutarighe(AA1,BB1,level)
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
#returns the number given the name of the knot
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
                        if tellmewhere(B,A[t]) > l or tellmewhere(B,A[t])< t:
                            crossings = crossings+1
                    if t>l:
                        if l < tellmewhere(B,A[t]) < t:
                            crossings = crossings+1
    if B[l]<A[l]:
        for t in range(len(A)):
            if t != l:
                if B[l] < A[t] < A[l]:
                    if t<l:
                        if tellmewhere(B,A[t]) > l or tellmewhere(B,A[t])< t:
                            crossings = crossings+1
                    if t>l:
                        if l < tellmewhere(B,A[t]) < t:
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
                        if tellmewhere(B,A[t]) > l or tellmewhere(B,A[t])< t:
                            strands = strands+1
                    if t>l:
                        if l < tellmewhere(B,A[t]) < t:
                            strands = strands+1
    if A[l]>B[l]:
        for t in range(len(A)):
            if t != l:
                if A[t] < B[l]:
                    if t<l:
                        if tellmewhere(B,A[t]) > l or tellmewhere(B,A[t])< t:
                            strands = strands+1
                    if t>l:
                        if l < tellmewhere(B,A[t]) < t:
                            strands = strands+1
    return strands
#----------------------------------------------------
#computes the braid index of the braid diagram associated to a grid
def howmanystrands(A,B):
    counter = 0
    for q in range(len(A)):
        if tellmewhere(A,q)>tellmewhere(B,q):
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
#given a grid for a knot, it tells if the grid represents one of the knots up to 8 crossings, and outputs the name (as in the array "NAMES" below), and the Alexander polynomial
def tellmetheknot(X,O):
    if howmanystrands(X,O) == 1:
        return ['0_1', 1]
    treccia1 = converttobraid(X,O)
    brind = max([abs(r) for r in treccia1])
    Br = BraidGroup(brind+1)
    trecciaaux = Br(treccia1)
    nodoaux = Knot(trecciaaux)
    deter = determinante(len(X),X,O)
    if deter == 1:
        poly = trecciaaux.alexander_polynomial()
        if poly == 1:
            if trecciaaux.jones_polynomial() == 1:
                return ['0_1',1]
            else:                
                return ['other', 0]
        else:            
            return ['other', 0]
    if deter == 3:
        poly = trecciaaux.alexander_polynomial()
        if poly == t^-2 - t^-1 + 1:
            return ['3_1', poly]
        if abs(nodoaux.signature()) == 6 and poly == t^-6 - t^-5 + t^-3 - t^-1 + 1:
            return ['8_19', poly] 
        else:
            return ['other', 0]
    if deter == 5:
        poly = trecciaaux.alexander_polynomial()
        if nodoaux.signature() == 0 and poly == t^-2 - 3*t^-1 + 1:
            return ['4_1', poly]
        if abs(nodoaux.signature()) == 4 and poly == t^-4 - t^-3 + t^-2 - t^-1 + 1:
            return ['5_1', poly]
        else:
            return ['other', 0]
    if deter == 7:
        poly = trecciaaux.alexander_polynomial()
        if poly == 2*t^-2 - 3*t^-1 + 2:
            polyJ = trecciaaux.jones_polynomial()
            if polyJ == t-t^2+ 2*t^3-t^4+ t^5-t^6 or polyJ == 1/t-1/t^2+ 2/t^3-1/t^4+ 1/t^5-1/t^6:
                return ['5_2', poly]
            else:
                return ['other', 0]
        if poly == 1/t^6 - 1/t^5 + 1/t^4 -1/t^3 +1/t^2 -1/t +1:
            if abs(nodoaux.signature()) == 6 :
                return ['7_1', poly]
            else:
                return ['other', 0]
        else:
            return ['other', 0]    
    if deter == 9:
        poly = trecciaaux.alexander_polynomial()
        if poly == 2*t^-2 - 5*t^-1 + 2 :
            polyJ = trecciaaux.jones_polynomial()
            if polyJ == t^4 - t^3 + t^2 - 2*t - 1/t + 1/t^2 + 2 or polyJ == 1/t^4 - 1/t^3 + 1/t^2 - 2/t - t + t^2 + 2:
                return ['6_1', poly]
            else:                 
                return ['other', 0]
        if poly ==  t^-4 - 2*t^-3 + 3*t^-2 - 2*t^-1 + 1:
            polyJ = trecciaaux.jones_polynomial()
            if polyJ ==  -t - 1/t + 2/t^2 - 1/t^3 + 1/t^4 - 1/t^5 + 2 or polyJ == -1/t - t + 2*t^2 - t^3 + t^4 - t^5 + 2:
                return ['8_20', poly]
            else:
                return ['other', 0]
        else:
            return ['other', 0]
    if deter == 11:
        poly = trecciaaux.alexander_polynomial()
        if poly == t^-4 - 3*t^-3 + 3*t^-2 - 3*t^-1 + 1:
            polyJ = trecciaaux.jones_polynomial()
            if polyJ == 1/t-1+ 2*t-2*t^2+ 2*t^3-2*t^4+ t^5 or polyJ == t-1+ 2/t-2/t^2+ 2/t^3-2/t^4+ 1/t^5:
                return ['6_2', poly]
            else:                
                return ['other', 0]
        if poly == 3/t^2 - 5/t +3:
            polyJ = trecciaaux.jones_polynomial()
            if polyJ == -t^8 +t^7 -t^6 +2*t^5 -2*t^4 +2*t^3 -t^2+t or polyJ == -1/t^8 +1/t^7 -1/t^6 +2/t^5 -2/t^4 +2/t^3 -1/t^2+1/t:
                return ['7_2',poly]
            else:
                return ['other',0]
        else:
            return ['other', 0]    
    if deter == 13:
        poly = trecciaaux.alexander_polynomial()
        if poly == t^-4 - 3*t^-3 + 5*t^-2 - 3*t^-1 + 1:
            polyJ = trecciaaux.jones_polynomial()
            if polyJ == -t^3 + 2*t^2 - 2*t - 2/t + 2/t^2 - 1/t^3 + 3:
                return ['6_3', poly]
            else:
                return ['other', 0]
        if poly == 2/t^4 - 3/t^3 + 3/t^2 - 3/t^1 + 2:
            if abs(nodoaux.signature()) == 4:
                return ['7_3', poly]
            else:
                return ['other', 0]
        if poly == 3/t^2 - 7/t + 3:
            return ['8_1', poly]
        else:
            return ['other', 0]             
    if deter == 15:
        poly = trecciaaux.alexander_polynomial()
        if poly == 4/t^2 - 7/t + 4:
            polyJ = trecciaaux.jones_polynomial()
            if polyJ == -t^8 + t^7 - 2*t^6 + 3*t^5 - 2*t^4 + 3*t^3 - 2*t^2 + t or polyJ == -1/t^8 + 1/t^7 - 2/t^6 + 3/t^5 - 2/t^4 + 3/t^3 - 2/t^2 + 1/t:
                return ['7_4', poly]
            else:
                return ['other', 0]
        if poly == t^-4 - 4*t^-3 + 5*t^-2 - 4*t^-1 + 1:
            polyJ = trecciaaux.jones_polynomial()
            if polyJ ==  t^7 - 2*t^6 + 2*t^5 - 3*t^4 + 3*t^3 - 2*t^2 + 2*t  or polyJ == 1/t^7 - 2/t^6 + 2/t^5 - 3/t^4 + 3/t^3 - 2/t^2 + 2/t :
                return ['8_21', poly]
            else:
                return ['other', 0]
        else:
            return ['other', 0]   
    if deter == 17:
        poly = trecciaaux.alexander_polynomial()
        if poly == 2/t^4 - 4/t^3 + 5/t^2 - 4/t + 2:
            polyJ = trecciaaux.jones_polynomial()
            if polyJ == -t^9 + 2*t^8 - 3*t^7 + 3*t^6 - 3*t^5 + 3*t^4 - t^3 + t^2 or polyJ == -1/t^9 + 2/t^8 - 3/t^7 + 3/t^6 - 3/t^5 + 3/t^4 - 1/t^3 + 1/t^2:
                return ['7_5', poly]
            else:
                return ['other', 0]
        if poly == 1/t^6 - 3/t^5 + 3/t^4 - 3/t^3 + 3/t^2 - 3/t + 1:
            if abs(nodoaux.signature()) == 4:
                polyJ = trecciaaux.jones_polynomial()
                if polyJ == t^8 - 2*t^7 + 2*t^6 - 3*t^5 + 3*t^4 - 2*t^3 + 2*t^2 - t + 1 or polyJ == 1/t^8 - 2/t^7 + 2/t^6 - 3/t^5 + 3/t^4 - 2/t^3 + 2/t^2 - 1/t + 1:
                    return ['8_2', poly]
                else:
                    return ['other', 0]
            else:
                return ['other', 0]
        if poly == 4/t^2 - 9/t + 4:
            polyJ = trecciaaux.jones_polynomial()
            if polyJ == t^4 - t^3 + 2*t^2 - 3*t - 3/t + 2/t^2 - 1/t^3 + 1/t^4 + 3:
                return ['8_3', poly]
            else:
                return ['other', 0]
        else:
            return ['other', 0]   
    if deter == 19:
        poly = trecciaaux.alexander_polynomial()
        if poly ==  1/t^4 - 5/t^3 + 7/t^2 - 5/t + 1:
            polyJ = trecciaaux.jones_polynomial()
            if polyJ ==  -t^6 + 2*t^5 - 3*t^4 + 4*t^3 - 3*t^2 + 3*t + 1/t - 2 or polyJ == -1/t^6 + 2/t^5 - 3/t^4 + 4/t^3 - 3/t^2 + 3/t + t - 2:
                return ['7_6', poly]
            else:
                return ['other', 0]
        if poly ==  2/t^4 - 5/t^3 + 5/t^2 - 5/t + 2:
            return ['8_4', poly]
        else:
            return ['other', 0]   
    if deter == 21:
        poly = trecciaaux.alexander_polynomial()
        if poly ==  1/t^4 - 5/t^3 + 9/t^2 - 5/t + 1:
            polyJ = trecciaaux.jones_polynomial()
            if polyJ ==  -t^3 + 3*t^2 - 3*t - 4/t + 3/t^2 - 2/t^3 + 1/t^4 + 4  or polyJ ==  -1/t^3 + 3/t^2 - 3/t - 4*t + 3*t^2 - 2*t^3 + t^4 + 4:
                return ['7_7', poly]
            else:
                return ['other', 0]
        if poly ==  1/t^6 - 3/t^5 + 4/t^4 - 5/t^3 + 4/t^2 - 3/t + 1:
            polyJ = trecciaaux.jones_polynomial()
            if polyJ == t^8 - 2*t^7 + 3*t^6 - 4*t^5 + 3*t^4 - 3*t^3 + 3*t^2 - t + 1  or polyJ == 1/t^8 - 2/t^7 + 3/t^6 - 4/t^5 + 3/t^4 - 3/t^3 + 3/t^2 - 1/t + 1 :
                return ['8_5', poly]
            else:
                return ['other', 0]
        else:
            return ['other', 0]   
    if deter == 23:
        poly = trecciaaux.alexander_polynomial()
        if poly ==  2/t^4 - 6/t^3 + 7/t^2 - 6/t + 2:
            polyJ = trecciaaux.jones_polynomial()
            if polyJ ==  t^7 - 2*t^6 + 3*t^5 - 4*t^4 + 4*t^3 - 4*t^2 + 3*t + 1/t - 1   or polyJ == 1/t^7 - 2/t^6 + 3/t^5 - 4/t^4 + 4/t^3 - 4/t^2 + 3/t + t - 1 :
                return ['8_6', poly]
            else:
                return ['other', 0]
        if poly ==  1/t^6 - 3/t^5 + 5/t^4 - 5/t^3 + 5/t^2 - 3/t + 1:
            polyJ = trecciaaux.jones_polynomial()
            if polyJ ==  -t^2 + 2*t + 4/t - 4/t^2 + 4/t^3 - 3/t^4 + 2/t^5 - 1/t^6 - 2   or polyJ ==  -1/t^2 + 2/t + 4*t - 4*t^2 + 4*t^3 - 3*t^4 + 2*t^5 - 1*t^6 - 2:
                return ['8_7', poly]
            else:
                return ['other', 0]
        else:
            return ['other', 0]   
    if deter == 25:
        poly = trecciaaux.alexander_polynomial()
        if poly == 2/t^4 - 6/t^3 + 9/t^2 - 6/t + 2 :
            polyJ = trecciaaux.jones_polynomial()
            if polyJ ==  -t^3 + 2*t^2 - 3*t - 4/t + 4/t^2 - 3/t^3 + 2/t^4 - 1/t^5 + 5   or polyJ == -1/t^3 + 2/t^2 - 3/t - 4*t + 4*t^2 - 3*t^3 + 2*t^4 - 1*t^5 + 5 :
                return ['8_8', poly]
            else:
                return ['other', 0]
        if poly == 1/t^6 - 3/t^5 + 5/t^4 - 7/t^3 + 5/t^2 - 3/t + 1 :
            polyJ = trecciaaux.jones_polynomial()
            if polyJ ==   t^4 - 2*t^3 + 3*t^2 - 4*t - 4/t + 3/t^2 - 2/t^3 + 1/t^4 + 5  :
                return ['8_9', poly]
            else:
                return ['other', 0]
        else:
            return ['other', 0]   
    if deter == 27:
        poly = trecciaaux.alexander_polynomial()
        if poly == 1/t^6 - 3/t^5 + 6/t^4 - 7/t^3 + 6/t^2 - 3/t + 1 :
            polyJ = trecciaaux.jones_polynomial()
            if polyJ ==  -t^2 + 2*t + 5/t - 4/t^2 + 5/t^3 - 4/t^4 + 2/t^5 - 1/t^6 - 3  or polyJ == -1/t^2 + 2/t + 5*t - 4*t^2 + 5*t^3 - 4*t^4 + 2*t^5 - t^6 - 3 :
                return ['8_10', poly]
            else:
                return ['other', 0]
        if poly == 2/t^4 - 7/t^3 + 9/t^2 - 7/t + 2 :
            polyJ = trecciaaux.jones_polynomial()
            if polyJ == t^7 - 2*t^6 + 3*t^5 - 5*t^4 + 5*t^3 - 4*t^2 + 4*t + 1/t - 2  or polyJ ==  1/t^7 - 2/t^6 + 3/t^5 - 5/t^4 + 5/t^3 - 4/t^2 + 4/t + t - 2 :
                return ['8_11', poly]
            else:
                return ['other', 0]
        else:
            return ['other', 0]   
    if deter == 29:
        poly = trecciaaux.alexander_polynomial()
        if poly ==  1/t^4 - 7/t^3 + 13/t^2 - 7/t + 1:
            polyJ = trecciaaux.jones_polynomial()
            if polyJ ==  t^4 - 2*t^3 + 4*t^2 - 5*t - 5/t + 4/t^2 - 2/t^3 + 1/t^4 + 5:
                return ['8_12', poly]
            else:
                return ['other', 0]
        if poly ==  2/t^4 - 7/t^3 + 11/t^2 - 7/t + 2:
            polyJ = trecciaaux.jones_polynomial()
            if polyJ ==  -t^3 + 3*t^2 - 4*t - 5/t + 5/t^2 - 3/t^3 + 2/t^4 - 1/t^5 + 5 or polyJ == -1/t^3 + 3/t^2 - 4/t - 5*t + 5*t^2 - 3*t^3 + 2*t^4 - t^5 + 5 :
                return ['8_13', poly]
            else:
                return ['other', 0]
        else:
            return ['other', 0]   
    if deter == 31:
        poly = trecciaaux.alexander_polynomial()
        if poly == 2/t^4 - 8/t^3 + 11/t^2 - 8/t + 2 :
            polyJ = trecciaaux.jones_polynomial()
            if polyJ ==  t^7 - 3*t^6 + 4*t^5 - 5*t^4 + 6*t^3 - 5*t^2 + 4*t + 1/t - 2 or polyJ == 1/t^7 - 3/t^6 + 4/t^5 - 5/t^4 + 6/t^3 - 5/t^2 + 4/t + t - 2:
                return ['8_14', poly]
            else:
                return ['other', 0]  
        else:
            return ['other', 0]   
    if deter == 33:
        poly = trecciaaux.alexander_polynomial()
        if poly == 3/t^4 - 8/t^3 + 11/t^2 - 8/t + 3 :
            polyJ = trecciaaux.jones_polynomial()
            if polyJ ==  t^10 - 3*t^9 + 4*t^8 - 6*t^7 + 6*t^6 - 5*t^5 + 5*t^4 - 2*t^3 + t^2 or polyJ == 1/t^10 - 3/t^9 + 4/t^8 - 6/t^7 + 6/t^6 - 5/t^5 + 5/t^4 - 2/t^3 + 1/t^2:
                return ['8_15', poly]
            else:
                return ['other', 0]  
        else:
            return ['other', 0]  
    if deter == 35:
        poly = trecciaaux.alexander_polynomial()
        if poly == 1/t^6 - 4/t^5 + 8/t^4 - 9/t^3 + 8/t^2 - 4/t + 1 :
            polyJ = trecciaaux.jones_polynomial()
            if polyJ ==  -t^2 + 3*t + 6/t - 6/t^2 + 6/t^3 - 5/t^4 + 3/t^5 - 1/t^6 - 4 or polyJ == -1/t^2 + 3/t + 6*t - 6*t^2 + 6*t^3 - 5*t^4 + 3*t^5 - t^6 - 4:
                return ['8_16', poly]
            else:
                return ['other', 0]  
        else:
            return ['other', 0]  
    if deter == 37:
        poly = trecciaaux.alexander_polynomial()
        if poly == 1/t^6 - 4/t^5 + 8/t^4 - 11/t^3 + 8/t^2 - 4/t^1 + 1 :
            polyJ = trecciaaux.jones_polynomial()
            if polyJ ==  t^4 - 3*t^3 + 5*t^2 - 6*t - 6/t + 5/t^2 - 3/t^3 + 1/t^4 + 7:
                return ['8_17', poly]
            else:
                return ['other', 0] 
        else:
            return ['other', 0]  
    if deter == 45:
        poly = trecciaaux.alexander_polynomial()
        if poly ==  t^-6 - 5*t^-5 + 10*t^-4 - 13*t^-3 + 10*t^-2 - 5*t^-1 + 1:
            polyJ = trecciaaux.jones_polynomial()
            if polyJ ==  t^4 - 4*t^3 + 6*t^2 - 7*t - 7/t + 6/t^2 - 4/t^3 + 1/t^4 + 9:
                return ['8_18', poly]
            else:
                return ['other', 0]  
        else:
            return ['other', 0]  
    return ['other', 0]
#----------------------------------------------------



#----------------------------------------------------
#----------------------------------------------------
#----------------------------------------------------
#----------------------------------------------------

class schedagriglia(object):
    def __init__(self,x,o,name):
        self.x=None
        self.o = None
        
        self.name = None


import time
start_time = time.time()
from random import randint
t = var('t')        
NAMES=['0_1','3_1','4_1','5_1','5_2','6_1','6_2','6_3','7_1','7_2','7_3','7_4','7_5','7_6','7_7','8_1','8_2','8_3','8_4','8_5','8_6','8_7','8_8','8_9','8_10',
'8_11','8_12','8_13','8_14','8_15','8_16','8_17','8_18','8_19','8_20','8_21','other']


#----------------------------------------------------
#this is the main function: it creates the list of random admissible grids, fills in their respective slots (following the indications of the class "schedagriglia"), and computes the relevant data. The first "for" cycle controls the dimensions of the sampled grids. The "count" variable determines the size of the sample. The output, in the form of flux matrices, is then printed on a file



for N in range(17,18):     
    Gordianmatrix = Matrix(37)
    M = N -3
    GordianHOOKED = M*[0]
    knottypes = [0]*37
    knottypess = [0]*37
    Longgridlist = []
    ListaNodi = 37*[0]
    flag = 0
    count = 0
    scarti= 0
    for i in range(0,M):
        GordianHOOKED[i] = Matrix(37)
    while flag == 0:
        P = Permutations(N).random_element()
        X = []
        Q = Permutations(N).random_element()
        O = []
        if amIvalid (P,Q,N) == 0:
            if numerocomponenti(P,Q,N) == 1:
                for i in P:
                    X.append(i-1)
                for i in Q:
                    O.append(i-1)
                dummie  = schedagriglia(None,None,None)
                dummie.x = X
                dummie.o = O
                vettoreaux = tellmetheknot(X,O)
                dummie.name= vettoreaux[0]
                count = count +1
                Longgridlist.append(dummie)           
                if mod(count,100)==0:
                    print '*',
        if count > 499:                                            
            flag =1
    totalcounter = 0
    print '\nreading data: \n',
    for el in Longgridlist:
        totalcounter = totalcounter +1 
        if el.name == '0_1':
            knottypes[0] = knottypes[0]+1 
            knottypess[0] = knottypess[0]+1 
        if el.name == '3_1':
            knottypes[1] = knottypes[1]+1 
            knottypess[1] = knottypess[1]+1 
        if el.name == '4_1':
            knottypes[2] = knottypes[2]+1
            knottypess[2] = knottypess[2]+1
        if el.name == '5_1':
            knottypes[3] = knottypes[3]+1
            knottypess[3] = knottypess[3]+1
        if el.name == '5_2':
            knottypes[4] = knottypes[4]+1
            knottypess[4] = knottypess[4]+1
        if el.name == '6_1':
            knottypes[5] = knottypes[5]+1 
            knottypess[5] = knottypess[5]+1 
        if el.name == '6_2':
            knottypes[6] = knottypes[6]+1 
            knottypess[6] = knottypess[6]+1 
        if el.name == '6_3':
            knottypes[7] = knottypes[7]+1 
            knottypess[7] = knottypess[7]+1 
        if el.name == '7_1':
            knottypes[8] = knottypes[8]+1 
            knottypess[8] = knottypess[8]+1 
        if el.name == '7_2':
            knottypes[9] = knottypes[9]+1 
            knottypess[9] = knottypess[9]+1 
        if el.name == '7_3':
            knottypes[10] = knottypes[10]+1
            knottypess[10] = knottypess[10]+1
        if el.name == '7_4':
            knottypes[11] = knottypes[11]+1
            knottypess[11] = knottypess[11]+1
        if el.name == '7_5':
            knottypes[12] = knottypes[12]+1
            knottypess[12] = knottypess[12]+1
        if el.name == '7_6':
            knottypes[13] = knottypes[13]+1
            knottypess[13] = knottypess[13]+1 
        if el.name == '7_7':
            knottypes[14] = knottypes[14]+1
            knottypess[14] = knottypess[14]+1 
        if el.name == '8_1':
            knottypes[15] = knottypes[15]+1
            knottypess[15] = knottypess[15]+1 
        if el.name == '8_2':
            knottypes[16] = knottypes[16]+1
            knottypess[16] = knottypess[16]+1 
        if el.name == '8_3':
            knottypes[17] = knottypes[17]+1
            knottypess[17] = knottypess[17]+1 
        if el.name == '8_4':
            knottypes[18] = knottypes[18]+1
            knottypess[18] = knottypess[18]+1
        if el.name == '8_5':
            knottypes[19] = knottypes[19]+1
            knottypess[19] = knottypess[19]+1
        if el.name == '8_6':
            knottypes[20] = knottypes[20]+1
            knottypess[20] = knottypess[20]+1
        if el.name == '8_7':
            knottypes[21] = knottypes[21]+1
            knottypess[21] = knottypess[21]+1 
        if el.name == '8_8':
            knottypes[22] = knottypes[22]+1
            knottypess[22] = knottypess[22]+1 
        if el.name == '8_9':
            knottypes[23] = knottypes[23]+1
            knottypess[23] = knottypess[23]+1 
        if el.name == '8_10':
            knottypes[24] = knottypes[24]+1
            knottypess[24] = knottypess[24]+1 
        if el.name == '8_11':
            knottypes[25] = knottypes[25]+1
            knottypess[25] = knottypess[25]+1 
        if el.name == '8_12':
            knottypes[26] = knottypes[26]+1
            knottypess[26] = knottypess[26]+1
        if el.name == '8_13':
            knottypes[27] = knottypes[27]+1
            knottypess[27] = knottypess[27]+1
        if el.name == '8_14':
            knottypes[28] = knottypes[28]+1
            knottypess[28] = knottypess[28]+1
        if el.name == '8_15':
            knottypes[29] = knottypes[29]+1 
            knottypess[29] = knottypess[29]+1 
        if el.name == '8_16':
            knottypes[30] = knottypes[30]+1
            knottypess[30] = knottypess[30]+1 
        if el.name == '8_17':
            knottypes[31] = knottypes[31]+1 
            knottypess[31] = knottypess[31]+1 
        if el.name == '8_18':
            knottypes[32] = knottypes[32]+1
            knottypess[32] = knottypess[32]+1
        if el.name == '8_19':
            knottypes[33] = knottypes[33]+1
            knottypess[33] = knottypess[33]+1 
        if el.name == '8_20':
            knottypes[34] = knottypes[34]+1 
            knottypess[34] = knottypess[34]+1 
        if el.name == '8_21':
            knottypes[35] = knottypes[35]+1 
            knottypess[35] = knottypess[35]+1 
        if el.name == 'other':
            knottypes[36] = knottypes[36]+1
            knottypess[36] = knottypess[36]+1 
        if el.name not in NAMES:
            print 'wut', el.x, el.o
        if mod(totalcounter,5000)==0:
            print '.',  
        for n in range(len(el.x)-1):
            riscomm = commutacolonne(el.x,el.o,n)
            riscol = commutarighe(el.x,el.o,n)
            if riscomm != [0,0,0]:
                X=riscomm[1]
                O=riscomm[2]
                name2 = riscomm[0]
                Gordianmatrix[numero(el.name),numero(name2)] = Gordianmatrix[numero(el.name),numero(name2)]+ 1 
                knottypes[numero(name2)] = knottypes[numero(name2)]+1
                
                totalcounter = totalcounter +1
                if mod(totalcounter,1000)==0:
                    print '.', 
                if el.name == '8_5' and name2 == '3_1':
                    print 'example:', el.x, el.o, X, O
                if el.name == '3_1' and name2 == '8_5':
                    print 'example:', el.x, el.o, X, O
            if riscol != [0,0,0]:
                Xa=riscol[1]
                Oa=riscol[2]
                name3=riscol[0]
                Gordianmatrix[numero(el.name),numero(name3)] = Gordianmatrix[numero(el.name),numero(name3)]+ 1
                knottypes[numero(name3)] = knottypes[numero(name3)]+1
                totalcounter = totalcounter +1 
                if mod(totalcounter,5000)==0:
                    print '.', 
                if el.name == '8_5' and name3 == '3_1':
                    print 'example:', el.x, el.o, X, O
                if el.name == '3_1' and name3 == '8_5':
                    print 'example:', el.x, el.o, X, O                        
            for i in range(0,M):
                riscom = commutacolonneHOOKED(el.x,el.o,n,i+1)
                riscoll = commutacolonneHOOKED(el.x,el.o,n,i+1)
                if riscom != [0,0,0]:
                    X = riscom[1]
                    O = riscom[2]
                    name4 = riscom[0]
                    GordianHOOKED[i][numero(el.name),numero(name4)] = GordianHOOKED[i][numero(el.name),numero(name4)] +1
                if riscoll != [0,0,0]:
                    X = riscoll[1]
                    O = riscoll[2]
                    name5 = riscoll[0]
                    GordianHOOKED[i][numero(el.name),numero(name5)] = GordianHOOKED[i][numero(el.name),numero(name5)] +1
    for i in range(1,M):
        GordianHOOKED[i] = GordianHOOKED[i-1] + GordianHOOKED[i]
    file = open("/home/user/StrandPassages-GN{0}.txt".format(N), "a") 
    file.write("Grid number = %d\ntotal number of knots: %d\niterations = %d\nscarti: %d\n" %(N,totalcounter,count,scarti))
    file.write('Sampled knots =')
    for i in range(len(NAMES)):
        file.write(' $%s$ = %d' %(NAMES[i],knottypess[i]))
    file.write("\n")
    file.write('Total knots =')
    for i in range(len(NAMES)):
        file.write(' $%s$ = %d' %(NAMES[i],knottypes[i]))
    file.write("\n")
    for aa in range(len(NAMES)):
        for bb in range(len(NAMES)):
            file.write(" %d,  " %Gordianmatrix[aa,bb])
        file.write("\n")            
    file.write("\n")     
    for j in range(0,M):
        for aa in range(len(NAMES)):
            for bb in range(len(NAMES)):
                file.write(" %d,  " %GordianHOOKED[M -j -1][aa,bb])
            file.write("\n")            
        file.write("\n")
    file.close()        
print "\n My program took", time.time() - start_time, "to run"
