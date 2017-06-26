Type variables: <none>

#\hrulefill\hspace*{.5cm}#
&1 (left ) : M.f [programs are in sync]
&2 (right) : M.f

pre = ={M.x, M.y, M.z, M.w}

(1)  M.z <- true              
(2)  M.w <- false             
(3)  M.x <- true              
(4)  M.y <- false             

post = ={M.x, M.y, M.z, M.w}
