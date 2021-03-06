Type variables: <none>

#\hrulefill\hspace*{.5cm}#
&1 (left ) : M.f
&2 (right) : N.g

pre =
  j{2} = 0 /\
  y{2} = 0 /\
  i{1} = 0 /\
  x{1} = 0 /\ 0 <= n{1} /\ 0 <= n{2} /\ n{1} * m{1} = n{2} * m{2}

while (i < n) {            (1--)  while (j < n) {          
  x <- x + m               (1.1)    y <- y + m             
  i <- i + 1               (1.2)    j <- j + 1             
}                          (1--)  }                        

post = x{1} = y{2}
