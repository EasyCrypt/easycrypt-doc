Type variables: <none>

------------------------------------------------------------
&1 (left ) : M.h
&2 (right) : N.h

pre = true

k <- 0                     (1)  k <- 0                   
M.x <- 0                   (2)  N.x <- 0                 

post = ={k} /\ M.x{1} = -N.x{2}
