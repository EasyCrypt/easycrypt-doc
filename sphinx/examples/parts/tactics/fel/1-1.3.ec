Type variables: <none>

Adv: ADV{Or}
&m: memory
------------------------------------------------------------
Context : G(Adv).main

pre = tt = tt /\ Or.gens = Or.gens{m} /\ Or.won = Or.won{m}

(1)  Or.init()                

post = (!Or.won /\ size Or.gens = 0) /\ size Or.gens <= n
