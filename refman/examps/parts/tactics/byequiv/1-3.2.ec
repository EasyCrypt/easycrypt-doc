Type variables: <none>

y1: int
y2: int
&m1: memory
&m2: memory
x_eq: M.x{m1} = M.x{m2}
y_eq: y1 = y2
#\hrulefill\hspace*{.5cm}#
y2 = y2 /\ M.x{m2} = M.x{m2} /\ y1 = y1 /\ M.x{m1} = M.x{m1}
