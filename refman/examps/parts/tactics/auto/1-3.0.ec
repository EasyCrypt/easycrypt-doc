Type variables: <none>

#\hrulefill\hspace*{.5cm}#
&1 (left ) : M.f
&2 (right) : N.f

pre = ={x, y} /\ 1 < x{1} <= y{2}

if (y < x) {               (1--)  z1 <$ [x..y]             
  z1 <- x                  (1.1)                           
  x <- y                   (1.2)                           
  y <- z1                  (1.3)                           
}                          (1--)                           
z1 <$ [x..y]               (2--)  x <- x - 1               
z2 <$ [x - 1..y + 1]       (3--)  y <- y + 1               
                           (4--)  z2 <$ [x..y]             
                           (5--)  x <- x - 1               
                           (6--)  y <- y + 1               

post = z1{1} + z2{1} = z1{2} + z2{2}
