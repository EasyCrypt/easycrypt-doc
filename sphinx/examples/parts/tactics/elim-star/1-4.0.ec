Type variables: <none>

------------------------------------------------------------
Context : M.f

pre = exists (f : int), f = y + M.x - 2 /\ 0 <= y /\ 0 <= M.x

(1)  z <- (-M.x) + y          

post = 0 <= M.x + z + M.x
