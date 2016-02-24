Type variables: <none>

Adv: ADV{Or}
&m: memory
#\hrulefill\hspace*{.5cm}#
Context : G(Adv).main

pre = true

(1)  Or.init()                

post = (!Or.won /\ Or.ctr = 0) /\ Or.ctr = size Or.gens
