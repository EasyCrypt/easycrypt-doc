Type variables: <none>

------------------------------------------------------------
forall &1 &2 (a : bool * bool),
  ={y} /\ M.x{1} = N.x{2} =>
  Pr[M.f(y{1}) @ &1 : a = (res, M.x)] =
  Pr[N.f(y{2}) @ &2 : a = (res, N.x)]
