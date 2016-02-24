Type variables: <none>

Adv: ADV{Or}
&m: memory
#\hrulefill\hspace*{.5cm}#
forall (b : bool) (c : int),
  hoare[ Or.add :
          (! (Or.ctr < n /\ 1 <= x <= upp) /\
           Or.won = b /\ Or.ctr = c) /\
          Or.ctr = size Or.gens ==>
          (Or.won = b /\ Or.ctr = c) /\ Or.ctr = size Or.gens]
