Type variables: <none>

&m: memory
#\hrulefill\hspace*{.5cm}#
pre = true

    M.f ~ N.f

post = M.bad{1} = N.bad{2} /\ (!N.bad{2} => ={res})
