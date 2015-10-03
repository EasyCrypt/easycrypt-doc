Type variables: <none>

#\hrulefill\hspace*{.5cm}#
Context : M.f

pre = n > 0

(1--)  x <- 0                   
(2--)  y <- 0                   
(3--)  i <- 0                   
(4--)  j <- 0                   
(5--)  while (i + j < n) {      
(5.1)    x <- x * i             
(5.2)    x <- x + (j + 1)       
(5.3)    y <- y * j             
(5.4)    y <- y + (i + 2)       
(5.5)    i <- i + 1             
(5.6)    j <- j + 2             
(5--)  }                        

post = x + y > 0
