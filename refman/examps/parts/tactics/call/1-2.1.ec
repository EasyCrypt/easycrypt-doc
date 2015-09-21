Type variables: <none>

#\hrulefill\hspace*{.5cm}#
&1 (left ) : M.g
&2 (right) : N.g

pre = ={u}

M.x <- 5                   (1)  N.x <- -5                

post =
  (={u} /\ M.x{1} = -N.x{2}) &&
  forall (result_L result_R x_L x_R : int),
    result_L = result_R /\ x_L = -x_R =>
    result_L + x_L = result_R - x_R
