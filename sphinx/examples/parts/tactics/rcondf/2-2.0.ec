Type variables: <none>

------------------------------------------------------------
&1 (left ) : M.f
&2 (right) : N.f

pre = true

i <- 0                     (1--)  i <- 0                   
while (i < 10) {           (2--)  while (i < 10) {         
  i <- i + 1               (2.1)    i <- i + 1             
}                          (2--)  }                        
while (i < 10) {           (3--)                           
  i <- i + 2               (3.1)                           
}                          (3--)                           

post = ={i}
