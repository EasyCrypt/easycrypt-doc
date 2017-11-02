Type variables: <none>

#\hrulefill\hspace*{.5cm}#
&1 (left ) : M.g
&2 (right) : N.g

pre = ={u}

M.x <- 5                   (1)  N.x <- -5                
z <@ M.f(u)                (2)  z <@ N.f(u)              

post = z{1} + M.x{1} = z{2} - N.x{2}
