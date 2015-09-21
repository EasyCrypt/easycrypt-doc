Type variables: <none>

Adv: T{Or}
#\hrulefill\hspace*{.5cm}#
&1 (left ) : M(Adv).h
&2 (right) : N(Adv).h

pre = ={glob Adv} /\ Or.x{1} %% 2 = Or.x{2} %% 2


post =
  (true /\ ={glob Adv} /\ Or.x{1} %% 2 = Or.x{2} %% 2) &&
  forall (result_L result_R : int) (Adv_L : (glob Adv))
    (x_L : int) (Adv_R : (glob Adv)) (x_R : int),
    result_L = result_R /\ Adv_L = Adv_R /\ x_L %% 2 = x_R %% 2 =>
    result_L = result_R
