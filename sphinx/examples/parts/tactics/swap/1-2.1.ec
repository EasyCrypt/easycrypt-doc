Type variables: <none>

------------------------------------------------------------
&1 (left ) : M.f [programs are in sync]
&2 (right) : M.f

pre = ={M.x, M.y, M.z, M.w}

(1)  M.z <- true              
(2)  M.x <- true              
(3)  M.y <- false             
(4)  M.w <- false             

post = ={M.x, M.y, M.z, M.w}
