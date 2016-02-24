Type variables: <none>

Adv: ADV{Or}
&m: memory
#\hrulefill\hspace*{.5cm}#
pre = (0 <= Or.ctr /\ !Or.won) /\ Or.ctr = size Or.gens

    Or.add
    [<=] Or.ctr%r * (1%r / upp%r)

post = Or.won
