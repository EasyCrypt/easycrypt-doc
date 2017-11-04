Type variables: <none>

Adv: ADV{Or1, Or2}
incr: equiv[ Or1.incr_x();; Or1.incr_y(); ~ Or2.incr_y();;
              Or2.incr_x(); :
              Or1.x{1} = Or2.x{2} /\ Or1.y{1} = Or2.y{2} ==>
              Or1.x{1} = Or2.x{2} /\ Or1.y{1} = Or2.y{2}]
------------------------------------------------------------
eager[ Or1.incr_x();; Or1.incr_y();, Or1.incr_xy ~ Or2.incr_xy,
        Or2.incr_y();; Or2.incr_x(); :
        true /\
        Or1.x{1} = Or2.x{2} /\
        Or1.y{1} = Or2.y{2} /\ Or1.b{1} = Or2.b{2} ==>
        ={res} /\
        Or1.x{1} = Or2.x{2} /\
        Or1.y{1} = Or2.y{2} /\ Or1.b{1} = Or2.b{2}]
