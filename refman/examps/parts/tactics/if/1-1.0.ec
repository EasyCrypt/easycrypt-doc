Type variables: <none>

#\hrulefill\hspace*{.5cm}#
&1 (left ) : M.f
&2 (right) : N.f

pre = ={x, y}

if (x > y) {               (1--)  if (y < x) {             
  z <- x - y               (1.1)    z <- x - y + 1         
} else {                   (1--)  } else {                 
  z <- y - x               (1?1)    z <- y - x + 1         
}                          (1--)  }                        
z <- z * 2                 (2--)                           

post = z{1} >= 0 /\ z{1} = 2 * (z{2} - 1)
