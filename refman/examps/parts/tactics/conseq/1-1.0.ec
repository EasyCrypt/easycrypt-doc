Type variables: <none>

#\hrulefill\hspace*{.5cm}#
&1 (left ) : M.f
&2 (right) : N.f

pre =
  ={z} /\
  M.x{1} = N.x{2} /\
  M.y{1} = N.y{2} /\ z{1} < M.x{1} /\ z{1} < M.y{1}

if (z <= M.x \/ z <= M.y) {  (1--)  if (z <= N.x) {          
  M.x <- M.x + 1             (1.1)    N.x <- N.x - 1         
}                            (1--)  }                        

post = M.y{1} = N.y{2} /\ `|M.x{1} - N.x{2}| <= 2
