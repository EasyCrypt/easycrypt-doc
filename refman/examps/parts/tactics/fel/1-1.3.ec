Type variables: <none>

Adv: ADV{Or}
&m: memory
#\hrulefill\hspace*{.5cm}#
Context : G(Adv).main

pre = true

(1)  Or.init()                

post = !Or.won /\ size Or.gens = 0
