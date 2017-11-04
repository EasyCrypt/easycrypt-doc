Type variables: <none>

x': int
y': int
&m: memory
range: x' + 1 = y'
x_eq: M.x{m} = x'
------------------------------------------------------------
M.x{m} + 1 = y' /\ x' = M.x{m}
