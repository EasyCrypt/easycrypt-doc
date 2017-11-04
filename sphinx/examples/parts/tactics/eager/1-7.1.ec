Type variables: <none>

Adv: ADV{Or1, Or2}
------------------------------------------------------------
&1 (left ) : Top.
&2 (right) : Top.

pre = Or1.x{1} = Or2.x{2} /\ Or1.y{1} = Or2.y{2}

Or1.incr_x()               (1)  Or2.incr_y()             
Or1.incr_y()               (2)  Or2.incr_x()             

post = Or1.x{1} = Or2.x{2} /\ Or1.y{1} = Or2.y{2}
