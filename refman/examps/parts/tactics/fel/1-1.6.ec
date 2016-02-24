Type variables: <none>

Adv: ADV{Or}
&m: memory
#\hrulefill\hspace*{.5cm}#
forall (b : bool) (c : int),
  hoare[ Or.gen :
          ! size Or.gens < n /\ Or.won = b /\ size Or.gens = c ==>
          Or.won = b /\ size Or.gens = c]
