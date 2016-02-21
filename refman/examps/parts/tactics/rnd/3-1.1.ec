Type variables: <none>

#\hrulefill\hspace*{.5cm}#
&1 (left ) : M.f
&2 (right) : M.f

pre = true

                           (1)  x <$ {0,1}               

post =
  weight {0,1} = 1%r && forall (x0 : bool), in_supp x0 {0,1} => x0 = x{2}
