Type variables: <none>

Adv: ADV{Or}
&m: memory
#\hrulefill\hspace*{.5cm}#
forall (c : int),
  hoare[ Or.add :
          (size Or.gens < n /\ 1 <= x <= upp) /\ c = size Or.gens ==>
          c < size Or.gens /\ size Or.gens <= n]
