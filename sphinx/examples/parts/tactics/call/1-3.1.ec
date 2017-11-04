Type variables: <none>

------------------------------------------------------------
&1 (left ) : M.f
&2 (right) : N.f

pre = ={y} /\ M.x{1} = -N.x{2}

M.x <- M.x + y             (1)  N.x <- N.x - y           

post = M.x{1} = -N.x{2} /\ M.x{1} = -N.x{2}
