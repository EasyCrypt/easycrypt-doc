Type variables: <none>

#\hrulefill\hspace*{.5cm}#
&1 (left ) : M.f
&2 (right) : N.f

pre = ={y}

x <@ M.g()                 (1)  x <$ [1..10]             

post =
  if y{2} = 0 then
    if y{1} = 0 then x{1} + 2 = x{2} + 3 - 1
    else x{1} + (y{1} - 2) = x{2} + 3 - 1
  else
    let y_R = y{2} - 1 in
    (if y{1} = 0 then x{1} + 2 = x{2} + y_R - 1
     else x{1} + (y{1} - 2) = x{2} + y_R - 1)
