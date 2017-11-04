Type variables: <none>

Sym: forall (u v : int), u = v => v = u
x : int
y : int
------------------------------------------------------------
x = y => forall (z : int), y = z => x = z
