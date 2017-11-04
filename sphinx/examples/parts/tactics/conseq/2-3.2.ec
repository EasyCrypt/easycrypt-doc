Type variables: <none>

------------------------------------------------------------
forall &1 &2,
  ={b} /\ M.x{1} %% 2 + N.y{2} %% 2 = 0 =>
  forall (result_L result_R : bool) (x_L y_R : int),
    result_L = result_R /\ x_L %% 2 = 0 /\ y_R %% 2 = 0 =>
    result_L = result_R /\ x_L %% 2 + y_R %% 2 = 0
