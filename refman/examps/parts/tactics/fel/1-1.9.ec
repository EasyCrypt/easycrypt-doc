Type variables: <none>

Adv: ADV{Or}
&m: memory
#\hrulefill\hspace*{.5cm}#
forall (b : bool) (c : int),
  hoare[ Or.add :
          ! (size Or.gens < n /\ 1 <= x <= upp) /\
          Or.won = b /\ size Or.gens = c ==>
          Or.won = b /\ size Or.gens = c]
