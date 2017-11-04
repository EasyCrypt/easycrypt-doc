Type variables: <none>

Adv: ADV{Or}
&m: memory
------------------------------------------------------------
forall (b : bool) (c : int),
  hoare[ Or.add :
          (! (size Or.gens < n /\ 1 <= x <= upp) /\
           Or.won = b /\ size Or.gens = c) /\
          size Or.gens <= n ==>
          (Or.won = b /\ c <= size Or.gens) /\ size Or.gens <= n]
