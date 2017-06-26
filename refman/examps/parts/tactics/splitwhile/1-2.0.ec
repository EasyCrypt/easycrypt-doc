Type variables: <none>

#\hrulefill\hspace*{.5cm}#
&1 (left ) : M.f [programs are in sync]
&2 (right) : M.f

pre = ={y}

(1--)  x <- 0                   
(2--)  z <- 0                   
(3--)  while (x < y) {          
(3.1)    z <- z + x             
(3.2)    x <- x + 1             
(3--)  }                        

post = ={z}
