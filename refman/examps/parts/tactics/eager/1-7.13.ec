Type variables: <none>

Adv: ADV{Or1, Or2}
incr: equiv[ Or1.incr_x();; Or1.incr_y(); ~ Or2.incr_y();;
              Or2.incr_x(); :
              Or1.x{1} = Or2.x{2} /\ Or1.y{1} = Or2.y{2} ==>
              Or1.x{1} = Or2.x{2} /\ Or1.y{1} = Or2.y{2}]
#\hrulefill\hspace*{.5cm}#
pre = ={n, Or2.b, Or2.y, Or2.x}

    Or2.loop ~ Or2.loop

post = ={res, Or2.b, Or2.y, Or2.x}
