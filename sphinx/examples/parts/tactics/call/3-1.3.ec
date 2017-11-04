Type variables: <none>

Adv: T{Or}
------------------------------------------------------------
&1 (left ) : M(Adv).h
&2 (right) : N(Adv).h

pre = ={y, glob Adv} /\ Or.x{1} %% 2 = 0 /\ Or.x{2} %% 2 = 0


post =
  (true /\ ={glob Adv} /\ Or.x{1} %% 2 = 0 /\ Or.x{2} %% 2 = 0) &&
  forall (result_L result_R : unit) (Adv_L : (glob Adv))
    (x_L : int) (Adv_R : (glob Adv)) (x_R : int),
    result_L = result_R /\
    Adv_L = Adv_R /\ x_L %% 2 = 0 /\ x_R %% 2 = 0 =>
    x_L %% 2 = 0 /\ x_R %% 2 = 0
