Type variables: <none>

#\hrulefill\hspace*{.5cm}#
&1 (left ) : M.f
&2 (right) : N.f

pre = ={y}

x <@ M.g()                 (1--)  x <$ [1..10]             
if (y = 0) {               (2--)  if (y = 0) {             
  y <- 2                   (2.1)    y <- 3                 
} else {                   (2--)  } else {                 
  y <- y - 2               (2?1)    y <- y - 1             
}                          (2--)  }                        

post = x{1} + y{1} = x{2} + y{2} - 1
