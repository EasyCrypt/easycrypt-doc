Type variables: <none>

#\hrulefill\hspace*{.5cm}#
forall &1 &2 (a : bool * bool),
  (res{1}, M.x{1}) = a =>
  (res{2}, N.x{2}) = a => (res{1} /\ M.x{1}) = (res{2} /\ N.x{2})
