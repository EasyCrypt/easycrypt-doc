Type variables: <none>

#\hrulefill\hspace*{.5cm}#
Context : M.f

pre = true

(1)  x <- 10                  
(2)  w <- (x + 1, 6)          
(3)  x0 <- w.`1 + 7           
(4)  u <- x0                  
(5)  (y, z) <- w              

post = y + z = 17
