Type variables: <none>

------------------------------------------------------------
Context : M.f

pre = true

(1)  x <- 10                  
(2)  w <- (x + 1, 6)          
(3)  u <- w.`1 + 7            
(4)  (y, z) <- w              

post = y + z = 17
