Type variables: <none>

Adv: ADV{Or}
&m: memory
------------------------------------------------------------
forall (c : int),
  hoare[ Or.add :
          ((size Or.gens < n /\ 1 <= x <= upp) /\ c = size Or.gens) /\
          size Or.gens <= n ==>
          c < size Or.gens /\ size Or.gens <= n]
