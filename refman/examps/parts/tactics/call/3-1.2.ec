Type variables: <none>

Adv: T{Or}
#\hrulefill\hspace*{.5cm}#
pre = true /\ Or.x{1} %% 2 = Or.x{2} %% 2

    Or.f2 ~ Or.f2

post = ={res} /\ Or.x{1} %% 2 = Or.x{2} %% 2
