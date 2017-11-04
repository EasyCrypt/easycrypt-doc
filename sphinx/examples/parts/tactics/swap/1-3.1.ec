Type variables: <none>

------------------------------------------------------------
&1 (left ) : M.f
&2 (right) : M.f

pre = ={M.x, M.y, M.z, M.w}

M.z <- true                (1)  M.z <- true              
M.y <- false               (2)  M.x <- true              
M.w <- false               (3)  M.y <- false             
M.x <- true                (4)  M.w <- false             

post = ={M.x, M.y, M.z, M.w}
