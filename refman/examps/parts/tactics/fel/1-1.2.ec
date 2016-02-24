Type variables: <none>

Adv: ADV{Or}
&m: memory
#\hrulefill\hspace*{.5cm}#
forall &m0,
  size Or.gens{m0} <= n /\ Or.won{m0} =>
  Or.won{m0} /\ size Or.gens{m0} <= n
