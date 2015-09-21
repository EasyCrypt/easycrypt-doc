Type variables: <none>

Adv: ADV{Or1, Or2}
ll_Adv_f: forall (O <: OR{Adv}),
            islossless O.qry => islossless Adv(O).f
#\hrulefill\hspace*{.5cm}#
&1 (left ) : M(Adv).h
&2 (right) : N(Adv).h

pre =
  Or1.qry{1} = Or2.qry{2} /\
  Or1.queried{1} = Or2.queried{2} /\ !Or1.queried{1}


post =
  (if Or2.queried{2} then Or1.queried{1} = Or2.queried{2}
   else
     true /\
     Or1.qry{1} = Or2.qry{2} /\ Or1.queried{1} = Or2.queried{2}) &&
  forall (result_L result_R : bool) (Adv_L : (glob Adv))
    (queried_L : bool) (Adv_R : (glob Adv)) (queried_R : bool),
    if queried_R then queried_L = queried_R
    else
      result_L = result_R /\
      Adv_L = Adv_R /\
      Or1.qry{1} = Or2.qry{2} /\ queried_L = queried_R =>
    queried_L = queried_R /\ (!queried_R => result_L = result_R)
