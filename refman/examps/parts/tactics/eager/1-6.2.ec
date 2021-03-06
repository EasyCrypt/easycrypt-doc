Type variables: <none>

incr: equiv[ Or1.incr_x();; Or1.incr_y(); ~ Or2.incr_y();; Or2.incr_x(
              ); :
              ={n} /\
              Or1.x{1} = Or2.x{2} /\
              Or1.y{1} = Or2.y{2} /\ Or1.b{1} = Or2.b{2} ==>
              ={n} /\
              Or1.x{1} = Or2.x{2} /\
              Or1.y{1} = Or2.y{2} /\ Or1.b{1} = Or2.b{2}]
#\hrulefill\hspace*{.5cm}#
forall &m2 (b1 : bool),
  hoare[ Or1.incr_x();; Or1.incr_y(); :
          ((n = n{m2} /\
            Or1.x = Or2.x{m2} /\ Or1.y = Or2.y{m2} /\ Or1.b = Or2.b{m2}) /\
           0 < n) /\
          Or1.b = b1 ==> Or1.b = b1]
