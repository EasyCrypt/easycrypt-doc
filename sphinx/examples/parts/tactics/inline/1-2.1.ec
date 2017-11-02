Type variables: <none>

#\hrulefill\hspace*{.5cm}#
&1 (left ) : M.h
&2 (right) : M.h

pre = ={x}

x0 <- x + 1                (1)  x0 <- x + 1              
M.y <@ M.f(x0 - 1)         (2)  x1 <- x0 - 1             
b <- x0 + M.y + 1 = 3      (3)  x1 <- x1 + 1             
                           (4)  M.y <- x1 * 2            
                           (5)  b <- x0 + M.y + 1 = 3    

post = (!b{1}) = !b{2}
