Type variables: <none>

------------------------------------------------------------
Context : M.f

pre = true

(1--)  i <- 0                   
(2--)  while (i < 10) {         
(2.1)    i <- i + 1             
(2--)  }                        

post = ! i < 10
