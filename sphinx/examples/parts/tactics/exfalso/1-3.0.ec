Type variables: <none>

#\hrulefill\hspace*{.5cm}#
&1 (left ) : M.f
&2 (right) : N.f

pre = ={i} /\ 0 < i{1} /\ i{1} <= 0

while (j < 10) {           (1--)  while (j < 20) {         
  i <- i + 2               (1.1)    i <- i + 3             
  j <- j + 1               (1.2)    j <- j + 1             
}                          (1--)  }                        

post = ={i}
