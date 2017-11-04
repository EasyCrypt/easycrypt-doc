Type variables: <none>

------------------------------------------------------------
forall &1 &2,
  ={b} /\ M.x{1} %% 2 + N.y{2} %% 2 = 0 =>
  forall (x_L : int) (b_L : bool) (y_R : int) (b_R : bool),
    b_L = b_R /\ x_L %% 2 = 0 /\ y_R %% 2 = 0 =>
    b_L = b_R /\ x_L %% 2 + y_R %% 2 = 0
