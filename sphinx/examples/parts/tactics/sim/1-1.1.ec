Type variables: <none>

#\hrulefill\hspace*{.5cm}#
&1 (left ) : M.f
&2 (right) : N.f

pre = x{1} = N.u{2} /\ y{1} + 1 = N.v{2}

i <- 0                     (1)  j <- 0                   
y <- y + 1                 (2)                           

post = x{1} = N.u{2} /\ y{1} = N.v{2} /\ i{1} = j{2}
