Type variables: <none>

------------------------------------------------------------
&1 (left ) : Or1.loop
&2 (right) : Or2.loop

pre =
  ={n} /\
  Or1.x{1} = Or2.x{2} /\
  Or1.y{1} = Or2.y{2} /\ Or1.b{1} = Or2.b{2}

Or1.incr_x()               (1----)  while (0 < n) {          
                           (1.1--)    if (Or2.b) {           
                           (1.1.1)      Or2.incr_x()         
                           (1.1--)    } else {               
                           (1.1?1)      Or2.incr_y()         
                           (1.1--)    }                      
                           (1.2--)    Or2.b <- !Or2.b        
                           (1----)  }                        
Or1.incr_y()               (2----)  Or2.incr_y()             
while (0 < n) {            (3----)  Or2.incr_x()             
  if (Or1.b) {             (3.1--)                           
    Or1.incr_x()           (3.1.1)                           
  } else {                 (3.1--)                           
    Or1.incr_y()           (3.1?1)                           
  }                        (3.1--)                           
  Or1.b <- !Or1.b          (3.2--)                           
}                          (3----)                           

post =
  (!Or1.b{1}) = !Or2.b{2} /\
  Or1.x{1} = Or2.x{2} /\
  Or1.y{1} = Or2.y{2} /\ Or1.b{1} = Or2.b{2}
