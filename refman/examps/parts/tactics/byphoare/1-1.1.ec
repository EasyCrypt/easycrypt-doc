Type variables: <none>

x': int
y': int
&m: memory
range: x' + 1 = y'
x_eq: M.x{m} = x'
#\hrulefill\hspace*{.5cm}#
pre = M.x + 1 = y /\ x' = M.x

    M.f
    [=] 1%r / 2%r

post = x' = res
