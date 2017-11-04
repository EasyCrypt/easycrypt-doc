Type variables: <none>

------------------------------------------------------------
forall &1 &2,
  ={z} /\
  M.x{1} = N.x{2} /\
  M.y{1} = N.y{2} /\ z{1} < M.x{1} /\ z{1} < M.y{1} =>
  forall (x_L x_R : int),
    x_L = x_R \/ x_L = x_R + 2 =>
    M.y{1} = N.y{2} /\ `|x_L - x_R| <= 2
