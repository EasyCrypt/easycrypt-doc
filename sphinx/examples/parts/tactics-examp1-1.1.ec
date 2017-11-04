Type variables: <none>

x : int
zor1_x: x = 1 \/ x = 2
------------------------------------------------------------
pre = y %% 3 = x

    M.f

post = res %% 3 = x %% 2 + 1
