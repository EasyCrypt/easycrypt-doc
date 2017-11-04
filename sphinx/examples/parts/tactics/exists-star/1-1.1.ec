Type variables: <none>

------------------------------------------------------------
pre =
  exists (f f0 : int),
    (f = y{1} + 1 /\ f0 = N.x{2} - y{1}) /\
    ={y} /\ M.x{1} = N.x{2}

    M.f ~ N.f

post = ={res}
