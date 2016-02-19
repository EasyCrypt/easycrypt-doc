Type variables: <none>

#\hrulefill\hspace*{.5cm}#
Context : M.f

pre = 0 <= y /\ 0 <= M.x

(1)  z <- (-M.x) + y          

post = 0 <= M.x + z + M.x
