Type variables: <none>

------------------------------------------------------------
forall (f f0 : int),
  equiv[ M.f.z <- (-M.x{hr}) + M.f.y{hr} ~ N.f.z <-
            N.x{hr} - N.f.y{hr} :
          (f = y{1} + 1 /\ f0 = N.x{2} - y{1}) /\
          ={y} /\ M.x{1} = N.x{2} ==>
          M.x{1} + z{1} + M.x{1} = y{2} + z{2} + y{2}]
