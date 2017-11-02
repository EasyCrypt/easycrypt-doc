Type variables: <none>

Adv: ADV{Or1, Or2}
ll_Adv_f: forall (O <: OR{Adv}),
            islossless O.qry => islossless Adv(O).f
#\hrulefill\hspace*{.5cm}#
forall &2,
  Or2.queried{2} =>
  phoare[ Or1.qry :
           Or1.queried = Or2.queried{2} ==>
           Or1.queried = Or2.queried{2}] = 1%r
