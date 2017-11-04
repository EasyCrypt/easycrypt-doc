Type variables: <none>

------------------------------------------------------------
Context : M.f

pre = true

(1)  x <- 1                   
(2)  y <- x + 1               
(3)  z <- y + x + 2           
(4)  w <- x - z               

post = w = -4
