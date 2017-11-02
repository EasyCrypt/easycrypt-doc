Type variables: <none>

n : int
#\hrulefill\hspace*{.5cm}#
&1 (left ) : M.f
&2 (right) : N.f

pre =
  (x{1} - 1 = x{2} - i{2} /\ z{1} * 2 + 1 = z{2}) /\
  0 < x{1} /\ i{2} <= x{2}

z <- z + 1                 (1)  z <- z + 2               
x <- x - 1                 (2)  i <- i + 1               

post =
  (x{1} - 1 = x{2} - i{2} /\ z{1} * 2 + 1 = z{2}) /\
  (0 < x{1} <=> i{2} <= x{2})
