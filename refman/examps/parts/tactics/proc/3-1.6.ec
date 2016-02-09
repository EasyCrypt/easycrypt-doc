Type variables: <none>

Adv: ADV{Or1, Or2}
ll_Adv_f: forall (O <: OR{Adv}),
            islossless O.qry => islossless Adv(O).f
#\hrulefill\hspace*{.5cm}#
forall _,
  phoare[ Or2.qry : Or2.queried /\ true ==> Or2.queried /\ true] = 1%r
