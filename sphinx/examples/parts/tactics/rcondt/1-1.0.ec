Type variables: <none>

------------------------------------------------------------
Context : M.f

pre = true

(1--)  x <$ {0,1}               
(2--)  y <- x ^^ x              
(3--)  if (!y) {                
(3.1)    z <- true              
(3--)  } else {                 
(3?1)    z <- false             
(3--)  }                        

post = z
