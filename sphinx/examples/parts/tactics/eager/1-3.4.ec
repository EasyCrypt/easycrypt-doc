Type variables: <none>

incr: equiv[ Or1.incr_x();; Or1.incr_y(); ~ Or2.incr_y();;
              Or2.incr_x(); :
              Or1.x{1} = Or2.x{2} /\ Or1.y{1} = Or2.y{2} ==>
              Or1.x{1} = Or2.x{2} /\ Or1.y{1} = Or2.y{2}]
#\hrulefill\hspace*{.5cm}#
&1 (left ) : Or2.incr_xy [programs are in sync]
&2 (right) : Or2.incr_xy

pre = ={Or2.b, Or2.y, Or2.x}

(1)  Or2.incr_y()             

post = ={Or2.b, Or2.y, Or2.x}
