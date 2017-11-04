Type variables: <none>

------------------------------------------------------------
&1 (left ) : N.f
&2 (right) : M.f

pre = N.x{1}

                           (1)  x <$ {0,1}               
                           (2)  y <- x ^^ x              
                           (3)  z <- true                

post = N.x{1} = z{2}
