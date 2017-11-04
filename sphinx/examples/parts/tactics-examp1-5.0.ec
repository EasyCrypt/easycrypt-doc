Type variables: <none>

x : int
zor1_x: x = 1 \/ x = 2
------------------------------------------------------------
Context : M.f

pre = y %% 3 = x /\ y %% 3 = 1


post = (y + 4) %% 3 = x %% 2 + 1
