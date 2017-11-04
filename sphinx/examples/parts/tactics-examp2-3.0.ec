Type variables: <none>

X : T{G}
n : int
LL: islossless X.f
------------------------------------------------------------
Context : G(X).g
Bound   : [=] 1%r

pre = G.x = n

(1)  X.f()                    

post = G.x = n
