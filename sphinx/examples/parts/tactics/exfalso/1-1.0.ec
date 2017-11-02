Type variables: <none>

#\hrulefill\hspace*{.5cm}#
&1 (left ) : M.f
&2 (right) : N.f

pre = true

i <- 0                     (1--)  i <- 0                   
j <- 0                     (2--)  j <- 0                   
while (i <= 0) {           (3--)  while (i <= 0) {         
  i <- i - 1               (3.1)    i <- i - 1             
}                          (3--)  }                        
while (j < 10) {           (4--)  while (j < 20) {         
  i <- i + 2               (4.1)    i <- i + 3             
  j <- j + 1               (4.2)    j <- j + 1             
}                          (4--)  }                        

post = ={i}
