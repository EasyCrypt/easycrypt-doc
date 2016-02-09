Type variables: <none>

#\hrulefill\hspace*{.5cm}#
&1 (left ) : M.f
&2 (right) : N.f

pre = true

i <- 0                     (1--)  i <- 0                   
while (i < 10) {           (2--)  while (i < 10) {         
  i <- i + 1               (2.1)    i <- i + 1             
}                          (2--)  }                        

post = ={i}
