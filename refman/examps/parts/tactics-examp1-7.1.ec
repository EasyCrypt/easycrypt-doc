Type variables: <none>

x : int
zor1_x: x = 1 \/ x = 2
#\hrulefill\hspace*{.5cm}#
Context : M.f

pre = x %% 3 = x /\ x %% 3 <> 1


post = (x + 2) %% 3 = x %% 2 + 1
