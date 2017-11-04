Type variables: <none>

Adv: ADV{Or1, Or2}
ll_Adv_f: forall (O <: OR{Adv}),
            islossless O.qry => islossless Adv(O).f
------------------------------------------------------------
forall &1,
  phoare[ Or2.qry :
           Or2.queried /\ Or1.queried{1} = Or2.queried ==>
           Or2.queried /\ Or1.queried{1} = Or2.queried] = 1%r
