Type variables: <none>

#\hrulefill\hspace*{.5cm}#
Context : M.f

pre = true

(1--)  x <- 0                   
(2--)  z <- 0                   
(3--)  if (x < y) {             
(3.1)    z <- z + x             
(3.2)    x <- x + 1             
(3--)  }                        
(4--)  while (x < y) {          
(4.1)    z <- z + x             
(4.2)    x <- x + 1             
(4--)  }                        

post = 0 <= z
