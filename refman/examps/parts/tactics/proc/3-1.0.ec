Type variables: <none>

Adv: ADV{Or1, Or2}
ll_Adv_f: forall (O <: OR{Adv}),
            islossless O.qry => islossless Adv(O).f
#\hrulefill\hspace*{.5cm}#
pre = Or1.qry{1} = Or2.qry{2}

    Adv(Or1).f ~ Adv(Or2).f

post = !Or2.queried{2} => ={res}
