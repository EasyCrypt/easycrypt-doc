Type variables: <none>

------------------------------------------------------------
&1 (left ) : M.f
&2 (right) : N.f

pre = ={x, y}

if (y < x) {               (1--)  if (y < x) {             
  z <- x - y               (1.1)    z <- x - y + 1         
} else {                   (1--)  } else {                 
  z <- y - x               (1?1)    z <- y - x + 1         
}                          (1--)  }                        
z <- z * 2                 (2--)                           

post = 0 <= z{1} /\ z{1} = 2 * (z{2} - 1)
