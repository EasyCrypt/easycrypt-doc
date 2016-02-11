Type variables: <none>

#\hrulefill\hspace*{.5cm}#
&1 (left ) : M.f
&2 (right) : M.f

pre =
  0 <= n{1} /\ i{1} = 0 /\ x{1} = 0 /\ n{1} * m{1} = n{2} * m{2}

while (i < n) {            (1--)  x <- n * m               
  x <- x + m               (1.1)                           
  i <- i + 1               (1.2)                           
}                          (1--)                           

post = ={x}
