Type variables: <none>

Adv: ADV{Or}
&m: memory
------------------------------------------------------------
forall (c : int),
  hoare[ Or.gen :
          (size Or.gens < n /\ c = size Or.gens) /\
          size Or.gens <= n ==>
          c < size Or.gens /\ size Or.gens <= n]
