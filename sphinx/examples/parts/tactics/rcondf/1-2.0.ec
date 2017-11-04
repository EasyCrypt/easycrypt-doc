Type variables: <none>

------------------------------------------------------------
&1 (left ) : N.f
&2 (right) : M.f

pre = !N.x{1}

                           (1--)  x <$ {0,1}               
                           (2--)  y <- x ^^ x              
                           (3--)  if (y) {                 
                           (3.1)    z <- true              
                           (3--)  } else {                 
                           (3?1)    z <- false             
                           (3--)  }                        

post = N.x{1} = z{2}
