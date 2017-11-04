Type variables: <none>

------------------------------------------------------------
&1 (left ) : M.h [programs are in sync]
&2 (right) : M.h

pre = ={x}

(1)  x0 <- x + 1              
(2)  M.y <@ M.f(x0 - 1)       
(3)  b <- x0 + M.y + 1 = 3    

post = (!b{1}) = !b{2}
