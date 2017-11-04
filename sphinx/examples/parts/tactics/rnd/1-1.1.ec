Type variables: <none>

------------------------------------------------------------
Context : M.f

pre = true

(1)  y <- 2                   

post = forall (x0 : int), x0 \in [1..10] => 3 <= x0 + y <= 12
