Type variables: <none>

#\hrulefill\hspace*{.5cm}#
&1 (left ) : M.f
&2 (right) : N.f

pre = x{1} = N.u{2} /\ y{1} + 1 = N.v{2} /\ 0 <= y{1}

i <- 0                     (1--)  j <- 0                   
y <- y + 1                 (2--)  while (j < N.v) {        
                           (2.1)    N.u <- N.u + N.u       
                           (2.2)    j <- j + 1             
                           (2--)  }                        
while (i < y) {            (3--)                           
  x <- x + x               (3.1)                           
  i <- i + 1               (3.2)                           
}                          (3--)                           

post = x{1} = N.u{2} /\ 1 < N.v{2} + 1
