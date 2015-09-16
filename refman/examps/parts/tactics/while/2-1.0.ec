Type variables: <none>

#\hrulefill\hspace*{.5cm}#
Context : M.f

pre = x >= 0

(1--)  n <- x                   
(2--)  i <- 0                   
(3--)  while (i < n) {          
(3.1)    i <- i + 1             
(3.2)    x <- x - 1             
(3--)  }                        

post = x = 0
