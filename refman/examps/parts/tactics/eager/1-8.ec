eager (incr : Or1.incr_x(); Or1.incr_y(); ~
                 Or2.incr_y(); Or2.incr_x(); :
                 ={x, y}(Or1, Or2) ==> ={x, y}(Or1, Or2)) :
         (={x, y, b}(Or1, Or2)).
