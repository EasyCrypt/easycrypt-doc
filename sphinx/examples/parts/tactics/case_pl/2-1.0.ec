Type variables: <none>

------------------------------------------------------------
Context : M.f

pre = true

(1--)  y <- -1                  
(2--)  while (0 < x) {          
(2.1)    y <- y + 2             
(2.2)    x <- x - 1             
(2--)  }                        

post = y <> 0
