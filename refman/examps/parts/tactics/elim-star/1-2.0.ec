Type variables: <none>

#\hrulefill\hspace*{.5cm}#
&1 (left ) : M.f
&2 (right) : N.f

pre =
  exists (f f0 : int),
    (f = y{1} + 1 /\ f0 = N.x{2} - y{1}) /\
    ={y} /\ M.x{1} = N.x{2}

z <- (-M.x) + y            (1)  z <- N.x - y             

post = M.x{1} + z{1} + M.x{1} = y{2} + z{2} + y{2}
