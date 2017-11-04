Type variables: <none>

x': int
y': int
&m: memory
range: x' + 1 = y'
x_eq: M.x{m} = x'
------------------------------------------------------------
forall &hr, x' = res{hr} <=> res{hr} = x'
