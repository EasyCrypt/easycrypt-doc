Type variables: <none>

#\hrulefill\hspace*{.5cm}#
&1 (left ) : M.f
&2 (right) : N.f

pre = true

i <- 0                     (1--)  i <- 0                   
while (i < 10) {           (2--)  while (i < 10) {         
  i <- i + 1               (2.1)    i <- i + 1             
}                          (2--)  }                        
while (i < 20) {           (3--)  i <- i + 2               
  i <- i + 2               (3.1)                           
}                          (3--)                           
                           (4--)  while (i < 20) {         
                           (4.1)    i <- i + 2             
                           (4--)  }                        

post = ={i}
