Type variables: <none>

#\hrulefill\hspace*{.5cm}#
&1 (left ) : G1.f
&2 (right) : G2.f

pre =
  (x{1}, y{1}).`1 = (x{2}, y{2}).`1 /\
  (x{1}, y{1}).`2 = (x{2}, y{2}).`2

x <- x + 1                 (1)  y <- y + 1               
y <- y + 1                 (2)  x <- x + 1               

post = x{1} + y{1} = x{2} + y{2}
