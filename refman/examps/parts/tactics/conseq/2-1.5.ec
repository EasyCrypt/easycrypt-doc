Type variables: <none>

#\hrulefill\hspace*{.5cm}#
&1 (left ) : M.f
&2 (right) : N.f

pre = ={b}

M.x <- M.x + 2             (1)  N.y <- N.y - 2           
b' <$ {0,1}                (2)  b' <$ {0,1}              
b <- b /\ b'               (3)  b <- b /\ b'             

post = ={b}
