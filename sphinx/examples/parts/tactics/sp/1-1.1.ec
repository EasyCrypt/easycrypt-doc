Type variables: <none>

#\hrulefill\hspace*{.5cm}#
&1 (left ) : M.f
&2 (right) : N.f

pre =
  (exists (y_R : int),
     y{2} = 3 /\
     y_R = 0 /\
     ((exists (y_L : int), y{1} = 2 /\ y_L = 0 /\ y_L = y_R) \/
      exists (y_L : int), y{1} = y_L - 2 /\ y_L <> 0 /\ y_L = y_R)) \/
  exists (y_R : int),
    y{2} = y_R - 1 /\
    y_R <> 0 /\
    ((exists (y_L : int), y{1} = 2 /\ y_L = 0 /\ y_L = y_R) \/
     exists (y_L : int), y{1} = y_L - 2 /\ y_L <> 0 /\ y_L = y_R)

x <@ M.g()                 (1)  x <$ [1..10]             

post = x{1} + y{1} = x{2} + y{2} - 1
