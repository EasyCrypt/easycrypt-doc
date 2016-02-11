Type variables: <none>

#\hrulefill\hspace*{.5cm}#
forall &1 &2,
  0 <= n{1} /\ 0 <= n{2} /\ n{1} = m{2} /\ m{1} = n{2} =>
  exists (arg : int * int),
    (0 <= n{1} /\ n{1} * m{1} = arg.`1 * arg.`2) /\
    0 <= n{2} /\ arg.`1 * arg.`2 = n{2} * m{2}
