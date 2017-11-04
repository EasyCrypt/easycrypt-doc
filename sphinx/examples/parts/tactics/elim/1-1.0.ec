Type variables: <none>

p : tree -> bool
basis: p Leaf
indstep: forall (b : bool) (tr1 tr2 : tree),
           p tr1 => p tr2 => p (Node b tr1 tr2)
------------------------------------------------------------
forall (tr : tree), p tr
