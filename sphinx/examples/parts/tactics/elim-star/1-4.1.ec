Type variables: <none>

------------------------------------------------------------
forall (f : int),
  hoare[ z <- (-M.x) + y :
          f = y + M.x - 2 /\ 0 <= y /\ 0 <= M.x ==> 0 <= M.x + z + M.x]
