Type variables: <none>

------------------------------------------------------------
&1 (left ) : M.f
&2 (right) : M.f

pre = true

                           (1)  x <$ {0,1}               

post = is_lossless {0,1} && forall (x0 : bool), x0 \in {0,1} => x0 = x{2}
