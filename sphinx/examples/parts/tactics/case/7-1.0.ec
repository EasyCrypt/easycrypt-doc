Type variables: <none>

------------------------------------------------------------
forall (tr : tree),
  tr = Leaf \/
  exists (b : bool) (tr1 tr2 : tree), tr = Node b tr1 tr2
