Type variables: <none>

Adv: ADV{Or1, Or2}
ll_Adv_f: forall (O <: OR{Adv}),
            islossless O.qry => islossless Adv(O).f
------------------------------------------------------------
forall &1 &2,
  (!Or2.queried{2} =>
   ={res} /\ ={glob Adv} /\ Or1.qry{1} = Or2.qry{2}) =>
  !Or2.queried{2} => ={res}
