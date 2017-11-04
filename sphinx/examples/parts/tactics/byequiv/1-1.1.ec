Type variables: <none>

y1: int
y2: int
&m1: memory
&m2: memory
x_eq: M.x{m1} = M.x{m2}
y_eq: y1 = y2
------------------------------------------------------------
pre = ={M.x, y}

    M.f ~ M.f

post = ={res}
