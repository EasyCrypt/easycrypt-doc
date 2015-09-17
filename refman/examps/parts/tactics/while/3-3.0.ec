Type variables: <none>

#\hrulefill\hspace*{.5cm}#
&1 (left ) : M.f
&2 (right) : N.f

pre = ={n} /\ n{1} >= 0

x <- 0                     (1--)                           
i <- 0                     (2--)                           
while (i < n) {            (3--)                           
  x <- x + (i + 1)         (3.1)                           
  i <- i + 1               (3.2)                           
}                          (3--)                           

post = x{1} <= n{2} * n{2}
