Type variables: <none>

------------------------------------------------------------
forall (f f0 : int),
  equiv[ M.f ~ N.f :
          (f = y{1} + 1 /\ f0 = N.x{2} - y{1}) /\
          ={y} /\ M.x{1} = N.x{2} ==> ={res}]
