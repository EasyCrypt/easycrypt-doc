Type variables: <none>

#\hrulefill\hspace*{.5cm}#
forall (b : bool) (t t0 : tree),
  Node b t t0 = Leaf \/
  exists (b0 : bool) (tr1 tr2 : tree),
    Node b t t0 = Node b0 tr1 tr2
