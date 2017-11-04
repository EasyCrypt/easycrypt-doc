Type variables: <none>

x': int
------------------------------------------------------------
forall &hr,
  x' = M.x{hr} /\ z{hr} < M.x{hr} /\ z{hr} < M.y{hr} =>
  forall (x : int), x' = x - 1 => x' < x
