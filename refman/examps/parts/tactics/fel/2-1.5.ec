Type variables: <none>

Adv: ADV{Or}
&m: memory
#\hrulefill\hspace*{.5cm}#
forall (c : int),
  hoare[ Or.gen :
          (Or.ctr < n /\ c = Or.ctr) /\ Or.ctr = size Or.gens ==>
          (c < Or.ctr /\ Or.ctr <= n) /\ Or.ctr = size Or.gens]
