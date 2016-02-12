Type variables: <none>

#\hrulefill\hspace*{.5cm}#
Context : N.f

pre = N.y %% 2 = 0

(1)  N.y <- N.y - 2           
(2)  b' <$ {0,1}              
(3)  b <- b /\ b'             

post = N.y %% 2 = 0
