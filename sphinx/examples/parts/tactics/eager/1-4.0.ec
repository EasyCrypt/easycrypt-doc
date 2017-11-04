Type variables: <none>

------------------------------------------------------------
&1 (left ) : Or1.incr_xy
&2 (right) : Or2.incr_xy

pre = Or1.x{1} = Or2.x{2} /\ Or1.y{1} = Or2.y{2}

Or1.incr_x()               (1)  Or2.incr_y()             
Or1.incr_y()               (2)  Or2.incr_x()             

post = Or1.x{1} = Or2.x{2} /\ Or1.y{1} = Or2.y{2}
