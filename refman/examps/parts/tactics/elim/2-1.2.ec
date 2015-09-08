Type variables: <none>

#\hrulefill\hspace*{.5cm}#
forall (b : bool) (tr1 tr2 : tree),
  rev (rev tr1) = tr1 =>
  rev (rev tr2) = tr2 => rev (rev (Node b tr1 tr2)) = Node b tr1 tr2
