Type variables: <none>

#\hrulefill\hspace*{.5cm}#
&1 (left ) : M.f
&2 (right) : M.f

pre = ={y}

x <- 0                     (1--)  x <- 0                   
z <- 0                     (2--)  z <- 0                   
while (x < y) {            (3--)  while (x < y) {          
  z <- z + x               (3.1)    z <- z + x             
  x <- x + 1               (3.2)    x <- x + 1             
}                          (3--)  }                        

post = ={z}
