Type variables: <none>

#\hrulefill\hspace*{.5cm}#
Context : M.f

pre = true

(1--)  if (x > y) {             
(1.1)    z <- x - y             
(1--)  } else {                 
(1?1)    z <- y - x             
(1--)  }                        
(2--)  z <- z * 2               

post = z >= 0
