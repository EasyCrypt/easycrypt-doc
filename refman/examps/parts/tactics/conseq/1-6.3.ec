Type variables: <none>

#\hrulefill\hspace*{.5cm}#
pre = ={z} /\ M.x{1} = N.x{2} /\ z{1} <= N.x{2}

    M.f ~ N.f

post = M.x{1} = N.x{2} \/ M.x{1} = N.x{2} + 2
