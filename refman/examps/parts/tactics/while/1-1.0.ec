Type variables: <none>

n : int
#\hrulefill\hspace*{.5cm}#
&1 (left ) : M.f
&2 (right) : N.f

pre = ={x, y} /\ y{1} = n

z <- 0                     (1--)  z <- 1                   
while (0 < x) {            (2--)  i <- 1                   
  z <- z + 1               (2.1)                           
  x <- x - 1               (2.2)                           
}                          (2--)                           
                           (3--)  while (i <= x) {         
                           (3.1)    z <- z + 2             
                           (3.2)    i <- i + 1             
                           (3--)  }                        

post = (z{1} + y{1} - n) * 2 + 1 = z{2} + y{2} - n
