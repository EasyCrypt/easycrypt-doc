Type variables: <none>

#\hrulefill\hspace*{.5cm}#
&1 (left ) : M.f
&2 (right) : N.f

pre = ={b} /\ M.x{1} %% 2 + N.y{2} %% 2 = 0

M.x <- M.x + 2             (1)  N.y <- N.y - 2           
b' <$ {0,1}                (2)  b' <$ {0,1}              
b <- b /\ b'               (3)  b <- b /\ b'             

post = ={b} /\ M.x{1} %% 2 + N.y{2} %% 2 = 0
