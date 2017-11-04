Type variables: <none>

------------------------------------------------------------
Context : M.f

pre = true

(1--)  if (y < x) {             
(1.1)    z <- x - y             
(1--)  } else {                 
(1?1)    z <- y - x             
(1--)  }                        
(2--)  z <- z * 2               

post = 0 <= z
