Type variables: <none>

Adv: ADV{Or}
&m: memory
#\hrulefill\hspace*{.5cm}#
forall (b : bool) (c : int),
  hoare[ Or.gen :
          (! Or.ctr < n /\ Or.won = b /\ Or.ctr = c) /\
          Or.ctr = size Or.gens ==>
          (Or.won = b /\ Or.ctr = c) /\ Or.ctr = size Or.gens]
