transitivity{1}
     {x <- n * m;}
     (0 <= n{1} /\ i{1} = 0 /\ x{1} = 0 /\ (n * m){1} = (n * m){2} ==>
      ={x})
     (0 <= n{2} /\ j{2} = 0 /\ y{2} = 0 /\ (n * m){1} = (n * m){2} ==>
      x{1} = y{2}).
