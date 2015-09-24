Type variables: <none>

#\hrulefill\hspace*{.5cm}#
&1 (left ) : M.f
&2 (right) : M.f

pre = ={M.x, M.y, M.z, M.w}

M.z <- true                (1)  M.z <- true              
M.w <- false               (2)  M.w <- false             
M.x <- true                (3)  M.x <- true              
M.y <- false               (4)  M.y <- false             

post = ={M.x, M.y, M.z, M.w}
