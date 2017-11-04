Type variables: <none>

&m: memory
------------------------------------------------------------
pre = true

    M.f ~ N.f

post = M.bad{1} = N.bad{2} /\ (!N.bad{2} => ={res})
