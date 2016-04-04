Type variables: <none>

#\hrulefill\hspace*{.5cm}#
Context : N.f

pre = 1 <= y < x

(1)  z1 <$ [x..y]             
(2)  x <- x - 1               
(3)  y <- y + 1               
(4)  z2 <$ [x..y]             
(5)  x <- x - 1               
(6)  y <- y + 1               

post = 0 <= z1 + z2
