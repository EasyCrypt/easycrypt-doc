Type variables: <none>

#\hrulefill\hspace*{.5cm}#
pre =
  ={z} /\
  M.x{1} = N.x{2} /\
  M.y{1} = N.y{2} /\ z{1} <= M.x{1} /\ z{1} <= M.y{1}

    M.f ~ N.f

post = M.y{1} = N.y{2} /\ `|M.x{1} - N.x{2}| <= 2
