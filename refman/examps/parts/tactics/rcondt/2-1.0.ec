Type variables: <none>

#\hrulefill\hspace*{.5cm}#
Context : M.f

pre = true

(1--)  i <- 0                   
(2--)  while (i < 10) {         
(2.1)    i <- i + 1             
(2--)  }                        
(3--)  while (i < 20) {         
(3.1)    i <- i + 2             
(3--)  }                        

post = i = 20
