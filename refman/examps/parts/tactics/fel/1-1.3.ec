Type variables: <none>

Adv: ADV{Or}
&m: memory
#\hrulefill\hspace*{.5cm}#
Context : G(Adv).main

pre = tt = tt /\ Or.won = Or.won{m} /\ Or.gens = Or.gens{m}

(1)  Or.init()                

post = (!Or.won /\ size Or.gens = 0) /\ size Or.gens <= n
