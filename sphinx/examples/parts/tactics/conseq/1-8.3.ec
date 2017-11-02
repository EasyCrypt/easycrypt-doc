Type variables: <none>

x': int
#\hrulefill\hspace*{.5cm}#
Context : M.f

pre = x' = M.x /\ z <= M.y

(1--)  if (z <= M.x \/ z <= M.y) {
(1.1)    M.x <- M.x + 1           
(1--)  }                          

post = x' = M.x - 1
