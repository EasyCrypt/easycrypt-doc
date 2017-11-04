Type variables: <none>

------------------------------------------------------------
&1 (left ) : M.f
&2 (right) : N.f

pre = ={y} /\ M.x{1} = N.x{2}

z <- (-M.x) + y            (1)  z <- N.x - y             

post = M.x{1} + z{1} + M.x{1} = y{2} + z{2} + y{2}
