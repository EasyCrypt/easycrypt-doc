Type variables: <none>

#\hrulefill\hspace*{.5cm}#
Context : M.f

pre = 0 < n

(1--)  x <- 0                   
(2--)  y <- 0                   
(3--)  i <- 0                   
(4--)  j <- 0                   
(5--)  while (i + j < n) {      
(5.1)    x <- x * i             
(5.2)    x <- x + (j + 1)       
(5.3)    i <- i + 1             
(5.4)    j <- j + 2             
(5--)  }                        
(6--)  i <- 0                   
(7--)  j <- 0                   
(8--)  while (i + j < n) {      
(8.1)    y <- y * j             
(8.2)    y <- y + (i + 2)       
(8.3)    i <- i + 1             
(8.4)    j <- j + 2             
(8--)  }                        

post = 0 < x + y
