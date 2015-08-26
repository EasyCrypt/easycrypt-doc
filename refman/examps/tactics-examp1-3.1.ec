Type variables: <none>

n : int
H : n = 1 \/ n = 2
#\hrulefill\hspace*{.5cm}#
Context : M.f

pre = x %% 3 = n /\ x %% 3 = 1

(1)  x <- x + 4               

post = x %% 3 = n %% 2 + 1
