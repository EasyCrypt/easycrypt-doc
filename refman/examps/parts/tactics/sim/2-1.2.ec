Type variables: <none>

#\hrulefill\hspace*{.5cm}#
pre = true /\ M.i{1} = N.i{2} /\ M.x{1} = -N.x{2}

    M.f ~ N.f

post = ={res} /\ M.i{1} = N.i{2} /\ M.x{1} = -N.x{2}
