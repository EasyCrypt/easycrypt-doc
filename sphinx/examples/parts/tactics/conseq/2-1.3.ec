Type variables: <none>

#\hrulefill\hspace*{.5cm}#
Context : M.f

pre = M.x %% 2 = 0

(1)  M.x <- M.x + 2           
(2)  b' <$ {0,1}              
(3)  b <- b /\ b'             

post = M.x %% 2 = 0
