Type variables: <none>

#\hrulefill\hspace*{.5cm}#
Context : M.f

pre = 1 <= y < x

(1--)  if (y < x) {             
(1.1)    z1 <- x                
(1.2)    x <- y                 
(1.3)    y <- z1                
(1--)  }                        
(2--)  z1 <$ [x..y]             
(3--)  z2 <$ [x - 1..y + 1]     

post = 0 <= z1 + z2
