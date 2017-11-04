Type variables: <none>

------------------------------------------------------------
&1 (left ) : M.f
&2 (right) : M.f

pre = ={M.x, M.y, M.z, M.w}

M.y <- false               (1)  M.x <- true              
M.w <- false               (2)  M.y <- false             
M.z <- true                (3)  M.w <- false             
M.x <- true                (4)  M.z <- true              

post = ={M.x, M.y, M.z, M.w}
