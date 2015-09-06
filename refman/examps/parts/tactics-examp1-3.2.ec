Type variables: <none>

n : int
zor1_n: n = 1 \/ n = 2
#\hrulefill\hspace*{.5cm}#
Context : M.f

pre = x %% 3 = n /\ x %% 3 <> 1

(1)  x <- x + 2               

post = x %% 3 = n %% 2 + 1
