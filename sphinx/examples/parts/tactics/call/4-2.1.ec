Type variables: <none>

Adv: ADV{Or1, Or2}
ll_Adv_f: forall (O <: OR{Adv}),
            islossless O.qry => islossless Adv(O).f
------------------------------------------------------------
pre =
  !Or2.queried{2} /\
  ={x} /\
  Or1.qry{1} = Or2.qry{2} /\ Or1.queried{1} = Or2.queried{2}

    Or1.qry ~ Or2.qry

post =
  if Or2.queried{2} then Or1.queried{1} = Or2.queried{2}
  else
    ={res} /\
    Or1.qry{1} = Or2.qry{2} /\ Or1.queried{1} = Or2.queried{2}
