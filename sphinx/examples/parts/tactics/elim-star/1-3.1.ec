Type variables: <none>

------------------------------------------------------------
forall (f : int),
  hoare[ M.f : f = y + M.x - 2 /\ 0 <= y /\ 0 <= M.x ==> 0 <= res]
