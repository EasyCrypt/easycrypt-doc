Type variables: <none>

#\hrulefill\hspace*{.5cm}#
forall (f : int),
  hoare[ z <- (-M.x) + y :
          f = y + M.x - 2 /\ 0 <= y /\ 0 <= M.x ==> 0 <= M.x + z + M.x]
