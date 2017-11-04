Type variables: <none>

m : int
------------------------------------------------------------
Context : M.f

pre = (0 <= i <= n /\ x <= i * i) /\ i < n

(1)  x <- x + (i + 1)         
(2)  i <- i + 1               

post = 0 <= i <= n /\ x <= i * i
