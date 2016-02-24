Type variables: <none>

Adv: ADV{Or}
&m: memory
#\hrulefill\hspace*{.5cm}#
forall (c : int),
  hoare[ Or.gen :
          size Or.gens < n /\ c = size Or.gens ==>
          c < size Or.gens /\ size Or.gens <= n]
