Type variables: <none>

n : int
#\hrulefill\hspace*{.5cm}#
&1 (left ) : M.h
&2 (right) : N.h

pre = y{2} = n

x <$ {0,1}                 (1)  y <- y - 1               
                           (2)  x <$ [2..3]              

post = x{1} <=> x{2} + y{2} = n + 2
