Type variables: <none>

------------------------------------------------------------
Context : M.f

pre = true

(1--)  x <- 0                   
(2--)  z <- 0                   
(3--)  while (x < y) {          
(3.1)    z <- z + x             
(3.2)    x <- x + 1             
(3--)  }                        

post = 0 <= z
