Type variables: <none>

#\hrulefill\hspace*{.5cm}#
forall &1 &2 (a : bool * bool),
  ={y} /\ M.x{1} = N.x{2} =>
  Pr[M.f(y{1}) @ &1 : (res, M.x) = a] =
  Pr[N.f(y{2}) @ &2 : (res, N.x) = a]
