Type variables: <none>

#\hrulefill\hspace*{.5cm}#
&1 (left ) : N.g
&2 (right) : N.g

pre =
  0 <= n{2} /\ j{2} = 0 /\ y{2} = 0 /\ n{1} * m{1} = n{2} * m{2}

y <- n * m                 (1--)  while (j < n) {          
                           (1.1)    y <- y + m             
                           (1.2)    j <- j + 1             
                           (1--)  }                        

post = ={y}
