Type variables: <none>

incr: equiv[ Or1.incr_x();; Or1.incr_y(); ~ Or2.incr_y();;
              Or2.incr_x(); :
              ={n} /\
              Or1.x{1} = Or2.x{2} /\
              Or1.y{1} = Or2.y{2} /\ Or1.b{1} = Or2.b{2} ==>
              ={n} /\
              Or1.x{1} = Or2.x{2} /\
              Or1.y{1} = Or2.y{2} /\ Or1.b{1} = Or2.b{2}]
#\hrulefill\hspace*{.5cm}#
&1 (left ) : Or2.loop [programs are in sync]
&2 (right) : Or2.loop

pre = ={n, Or2.b, Or2.y, Or2.x}

(1--)  if (Or2.b) {             
(1.1)    Or2.incr_x()           
(1--)  } else {                 
(1?1)    Or2.incr_y()           
(1--)  }                        
(2--)  Or2.b <- !Or2.b          

post = ={n, Or2.b, Or2.y, Or2.x}
