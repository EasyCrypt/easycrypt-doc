Type variables: <none>

m : int
#\hrulefill\hspace*{.5cm}#
Context : M.f

pre = m = n /\ n >= 0

(1--)  x <- 0                   
(2--)  i <- 0                   
(3--)  while (i < n) {          
(3.1)    x <- x + (i + 1)       
(3.2)    i <- i + 1             
(3--)  }                        

post = x <= m * m
