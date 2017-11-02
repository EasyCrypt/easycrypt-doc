Type variables: <none>

#\hrulefill\hspace*{.5cm}#
forall (tr : tree),
  tr = Leaf \/
  exists (b : bool) (tr1 tr2 : tree), tr = Node b tr1 tr2
