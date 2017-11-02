Type variables: <none>

#\hrulefill\hspace*{.5cm}#
Context : M.f

pre = true

(1----)  if (0 <= y) {            
(1.1--)    x <- 0                 
(1.2--)    while (x <> y) {       
(1.2.1)      x <- x + 1           
(1.2--)    }                      
(1----)  }                        

post = 0 <= y
