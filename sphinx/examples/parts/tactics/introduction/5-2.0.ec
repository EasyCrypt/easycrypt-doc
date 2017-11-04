Type variables: <none>

Sym: forall (u v : int), u = v => v = u
x : int
y : int
------------------------------------------------------------
y = x => forall (z : int), y = z => x = z
