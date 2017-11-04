Type variables: <none>

incr: equiv[ Or1.incr_x();; Or1.incr_y(); ~ Or2.incr_y();;
              Or2.incr_x(); :
              ={n} /\
              Or1.x{1} = Or2.x{2} /\
              Or1.y{1} = Or2.y{2} /\ Or1.b{1} = Or2.b{2} ==>
              ={n} /\
              Or1.x{1} = Or2.x{2} /\
              Or1.y{1} = Or2.y{2} /\ Or1.b{1} = Or2.b{2}]
------------------------------------------------------------
forall &1 &2,
  ={n} /\
  Or1.x{1} = Or2.x{2} /\
  Or1.y{1} = Or2.y{2} /\ Or1.b{1} = Or2.b{2} =>
  0 < n{1} = 0 < n{2}
