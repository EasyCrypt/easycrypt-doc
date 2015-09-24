Type variables: <none>

#\hrulefill\hspace*{.5cm}#
&1 (left ) : M.f
&2 (right) : M.f

pre = ={M.x, M.y, M.z, M.w}

M.x <- true                (1)  M.x <- true              
M.y <- false               (2)  M.y <- false             
M.z <- true                (3)  M.z <- true              
M.w <- false               (4)  M.w <- false             

post = ={M.x, M.y, M.z, M.w}
