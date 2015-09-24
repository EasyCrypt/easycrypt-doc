Type variables: <none>

#\hrulefill\hspace*{.5cm}#
&1 (left ) : M.f
&2 (right) : M.f

pre = ={M.x, M.y, M.z, M.w}

M.z <- true                (1)  M.z <- true              
M.x <- true                (2)  M.x <- true              
M.y <- false               (3)  M.y <- false             
M.w <- false               (4)  M.w <- false             

post = ={M.x, M.y, M.z, M.w}
