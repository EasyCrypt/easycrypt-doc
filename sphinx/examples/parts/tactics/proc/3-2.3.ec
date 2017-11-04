Type variables: <none>

Adv: ADV{Or1, Or2}
ll_Adv_f: forall (O <: OR{Adv}),
            islossless O.qry => islossless Adv(O).f
------------------------------------------------------------
forall (O <: OR{Adv}), islossless O.qry => islossless Adv(O).f
