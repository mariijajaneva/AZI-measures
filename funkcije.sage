
# coding: utf-8

import json

def AZIvrednost(graf, alpha=3): #Izračun AZI vrednost za nek graf
    vsota = 0
    for u in graf:
        for v in graf[u]:
            vsota = vsota + ((len(graf[u]) *len(graf[v]))/(len(graf[u]) + len(graf[v]) - 2))^(alpha)
    return vsota/2

def generiranje_grafa(n):
    A = graphs.RandomTree(n)
    A.add_edge(A.complement().random_edge(labels=False))
    return A

def generiranje_dreves(n):
    A = graphs.RandomTree(n)
    return A

# In[11]:


from random import choice
def minima(graf, n=100, alpha=3):
    ime = "min%d_%d_%d.json" % (alpha, len(graf), graf.size())
    najboljsa = trenutna = AZIvrednost(graf, alpha)
    najboljsi_graf = graf
    for j in range(n):
        T = n/(j+1)
        e = graf.random_edge(labels=False)
        K = Graph(graf)
        K.delete_edge(e)
        if K.is_connected():
            e = K.complement().random_edge()
        else:
            A, B = K.connected_components()
            e = (choice(A), choice(B))
        K.add_edge(e)
        a = AZIvrednost(K, alpha)
        if a < najboljsa:
            najboljsi_graf = K
            najboljsa = a
            print "%d: %f" % (j, a)
            with open(ime, "w") as f:
                json.dump(K.sparse6_string(), f)
        if a < trenutna or exp((trenutna - a) / T) > random():
            graf = K
            trenutna = a
    #najboljsi_graf.show()
    return (najboljsi_graf, najboljsa)


# In[12]:


from random import choice
def maxima(graf, n=100, alpha=3):
    ime = "max%d_%d_%d.json" % (alpha, len(graf), graf.size())
    najboljsa = trenutna = AZIvrednost(graf, alpha)
    najboljsi_graf = graf
    for j in range(n):
        T = n/(j+1)
        e = graf.random_edge(labels=False)
        K = Graph(graf)
        K.delete_edge(e)
        if K.is_connected():
            e = K.complement().random_edge()
        else:
            A, B = K.connected_components()
            e = (choice(A), choice(B))
        K.add_edge(e)
        a = AZIvrednost(K, alpha)
        if a > najboljsa:
            najboljsi_graf = K
            najboljsa = a
            print "%d: %f" % (j, a)
            with open(ime, "w") as f:
                json.dump(K.sparse6_string(), f)
        if a > trenutna or exp((trenutna - a) / T) > random():
            graf = K
            trenutna = a
    #najboljsi_graf.show()
    return (najboljsi_graf, najboljsa)
