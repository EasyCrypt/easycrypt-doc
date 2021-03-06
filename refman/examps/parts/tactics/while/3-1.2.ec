Type variables: <none>

#\hrulefill\hspace*{.5cm}#
&1 (left ) : M.f
&2 (right) : N.f

pre = ={n} /\ 0 <= n{1}

x <- 0                     (1)                           
i <- 0                     (2)                           

post =
  (0 <= i{1} <= n{1} /\ x{1} <= i{1} * i{1}) /\
  forall (i_L x_L : int),
    (0 <= i_L <= n{1} /\ x_L <= i_L * i_L =>
     n{1} - i_L <= 0 => ! i_L < n{1}) /\
    (! i_L < n{1} =>
     0 <= i_L <= n{1} /\ x_L <= i_L * i_L => x_L <= n{2} * n{2})
