Type variables: <none>

x': int
------------------------------------------------------------
Context : M.g

pre = x' = x /\ x = -1


post =
  x' = x && forall (result : int), result = x' + 1 => result = 0
