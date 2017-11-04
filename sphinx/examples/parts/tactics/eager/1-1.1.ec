Type variables: <none>

------------------------------------------------------------
&1 (left ) : Or1.incr_y
&2 (right) : Or2.incr_y

pre = Or1.x{1} = Or2.x{2} /\ Or1.y{1} = Or2.y{2}

Or1.incr_x()               (1)  Or2.y <- Or2.y + 1               
Or1.y <- Or1.y + 1         (2)  Or2.trace <- Or2.trace ++ [false]
                           (3)  Or2.incr_x()                     

post = Or1.x{1} = Or2.x{2} /\ Or1.y{1} = Or2.y{2}
