Type variables: <none>

#\hrulefill\hspace*{.5cm}#
forall (f : int),
  hoare[ M.f : f = y + M.x - 2 /\ 0 <= y /\ 0 <= M.x ==> 0 <= res]
