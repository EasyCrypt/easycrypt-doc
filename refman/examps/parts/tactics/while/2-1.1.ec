Type variables: <none>

#\hrulefill\hspace*{.5cm}#
Context : M.f

pre = (i <= n /\ x + i = n) /\ i < n

(1)  i <- i + 1               
(2)  x <- x - 1               

post = i <= n /\ x + i = n
