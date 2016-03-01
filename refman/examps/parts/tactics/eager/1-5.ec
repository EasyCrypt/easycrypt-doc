eager while (incr : Or1.incr_x(); Or1.incr_y(); ~
                       Or2.incr_y(); Or2.incr_x(); :
                       ={n} /\ ={x, y, b}(Or1, Or2) ==>
                       ={n} /\ ={x, y, b}(Or1, Or2)).
