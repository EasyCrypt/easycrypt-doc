Type variables: <none>

y1: int
y2: int
&m1: memory
&m2: memory
x_eq: M.x{m1} = M.x{m2}
y_eq: y1 = y2
------------------------------------------------------------
Pr[M.f(y1) @ &m1 : res = 0] = Pr[M.f(y2) @ &m2 : res = 0]
