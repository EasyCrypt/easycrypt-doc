Type variables: <none>

#\hrulefill\hspace*{.5cm}#
&1 (left ) : M.f
&2 (right) : N.f

pre = ={y}

if (y = 0) {               (1--)  if (y = 0) {             
  y <- 2                   (1.1)    y <- 3                 
} else {                   (1--)  } else {                 
  y <- y - 2               (1?1)    y <- y - 1             
}                          (1--)  }                        
x <@ M.g()                 (2--)  x <$ [1..10]             

post = x{1} + y{1} = x{2} + y{2} - 1
