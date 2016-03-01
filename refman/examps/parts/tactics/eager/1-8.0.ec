Type variables: <none>

Adv: ADV{Or1, Or2}
#\hrulefill\hspace*{.5cm}#
&1 (left ) : G(Adv).main1
&2 (right) : G(Adv).main2

pre =
  Or1.x{1} = Or2.x{2} /\
  Or1.y{1} = Or2.y{2} /\ Or1.b{1} = Or2.b{2}

Or1.incr_x()               (1)  b <@ Adv(Or2).main()     
Or1.incr_y()               (2)  Or2.incr_y()             
b <@ Adv(Or1).main()       (3)  Or2.incr_x()             

post = ={b} /\ Or1.x{1} = Or2.x{2} /\ Or1.y{1} = Or2.y{2}
