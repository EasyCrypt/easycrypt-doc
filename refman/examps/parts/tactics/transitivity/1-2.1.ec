Type variables: <none>

#\hrulefill\hspace*{.5cm}#
forall &1 &2,
  j{2} = 0 /\
  y{2} = 0 /\
  i{1} = 0 /\
  x{1} = 0 /\ 0 <= n{1} /\ 0 <= n{2} /\ n{1} * m{1} = n{2} * m{2} =>
  exists (m n : int),
    (0 <= n{1} /\ i{1} = 0 /\ x{1} = 0 /\ n{1} * m{1} = n * m) /\
    0 <= n{2} /\ j{2} = 0 /\ y{2} = 0 /\ n * m = n{2} * m{2}
